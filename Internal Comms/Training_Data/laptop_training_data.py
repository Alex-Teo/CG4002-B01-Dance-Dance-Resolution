from bluepy import btle
from bluepy.btle import Scanner, DefaultDelegate, BTLEDisconnectError
from time import sleep
import struct
import threading
import csv

ACK = 'A'
HELLO = 'H'
RESET = 'R'

BEETLE_ADDR_1 = "b0:b1:13:2d:b6:21" # SET 1 CHEST
BEETLE_ADDR_2 = "b0:b1:13:2d:b5:48" # SET 1 HAND
BEETLE_ADDR_3 = "b0:b1:13:2d:d6:75" # SET 2 CHEST
BEETLE_ADDR_4 = "b0:b1:13:2d:b6:2a" # SET 2 HAND (SPOILT)
BEETLE_ADDR_5 = "b0:b1:13:2d:cd:81" # EMG SET CHEST (SPOILT)
BEETLE_ADDR_6 = "b0:b1:13:2d:d6:7b" # EMG SET HAND

SERIVCE_ID = "0000dfb0-0000-1000-8000-00805f9b34fb"

BUFFER_DICT = {BEETLE_ADDR_1: b"", BEETLE_ADDR_2: b"", BEETLE_ADDR_3: b"", BEETLE_ADDR_4: b"", BEETLE_ADDR_5: b"", BEETLE_ADDR_6: b""}


BEETLE_ALL = [BEETLE_ADDR_1, BEETLE_ADDR_2, BEETLE_ADDR_3, BEETLE_ADDR_4, BEETLE_ADDR_5, BEETLE_ADDR_6]
BEETLE_DICT = {BEETLE_ADDR_1: 1, BEETLE_ADDR_2: 2, BEETLE_ADDR_3: 3, BEETLE_ADDR_4: 4, BEETLE_ADDR_5: 5, BEETLE_ADDR_6: 6}
BEETLE_FOUND_DICT = {BEETLE_ADDR_1: False, BEETLE_ADDR_2: False, BEETLE_ADDR_3: False, BEETLE_ADDR_4: False, BEETLE_ADDR_5: False, BEETLE_ADDR_6: False}

ACK_BOOL_DICT = {BEETLE_ADDR_1: False, BEETLE_ADDR_2: False, BEETLE_ADDR_3: False, BEETLE_ADDR_4: False, BEETLE_ADDR_5: False, BEETLE_ADDR_6: False}
HANDSHAKE_BOOL_DICT = {BEETLE_ADDR_1: False, BEETLE_ADDR_2: False, BEETLE_ADDR_3: False, BEETLE_ADDR_4: False, BEETLE_ADDR_5: False, BEETLE_ADDR_6: False}

START_DICT = {BEETLE_ADDR_1: False, BEETLE_ADDR_2: False, BEETLE_ADDR_3: False, BEETLE_ADDR_4: False, BEETLE_ADDR_5: False, BEETLE_ADDR_6: False}

PACKET_DICT = {b'E': "EMG Packet", b'I': "IMU Packet", b'T': "Time Packet"}

HAND_MOVING = False

DATA_LIST_1 = []
DATA_LIST_2 = []

class MyDelegate(btle.DefaultDelegate):
    def __init__(self,addr):
        btle.DefaultDelegate.__init__(self)
        self.beetle_addr = addr
        self.buffer = b''
    
    def handleNotification(self,cHandle,fragment):
        packet_size = len(fragment)

        # Handshake not completed
        if not HANDSHAKE_BOOL_DICT[self.beetle_addr]:
            if packet_size == 1:
                packet_type = struct.unpack('<c',fragment)[0] 
                # ACK packet for handshake
                if packet_type == b'A':
                    print("ACK packet has been received from Beetle %s." % (BEETLE_DICT[self.beetle_addr]))
                    ACK_BOOL_DICT[self.beetle_addr] = True

            # Ignore packet
            else:
                pass    
        
        # Handshake has already been completed
        else:
            if packet_size == 20:
                self.handleData(fragment)

            elif packet_size == 2:
                packet = struct.unpack('<cc',fragment)
                if packet == b'AA':
                    pass

            # Data assembling is required
            else:
                print("")
                print("")
                print("")
                print("Data Assembling Begin")
                
                existing_fragmented_data = BUFFER_DICT[self.beetle_addr]

                # No data fragments currently present
                if existing_fragmented_data == b'': 
                    existing_fragmented_data = fragment
                    fragmented_data_length = len(existing_fragmented_data)
                
                else:

                    existing_fragmented_data += fragment
                    fragmented_data_length = len(existing_fragmented_data)

                # Assembled data fragments form exactly 1 packet
                if fragmented_data_length == 20:
                    fragment = existing_fragmented_data
                    # Clear assembled data fragments
                    BUFFER_DICT[self.beetle_addr] = b''

                    print("Data Assembling Completed. Assembled Data: ")

                    # Send for data reading directly since it is a complete packet
                    self.handleData(fragment)

                # Current data fragments form more than 1 complete packet
                elif fragmented_data_length > 20:
                    fragment = existing_fragmented_data[0:20]
                    
                    print("Data Assembling Completed. Assembled Data: ")

                    # Store rest of fragment into buffer dictionary
                    BUFFER_DICT[self.beetle_addr] = existing_fragmented_data[20:]
                    # Send for data reading directly 
                    self.handleData(fragment)
                    
                else:

                    BUFFER_DICT[self.beetle_addr] += fragment
        
    def handleData(self,fragment):

        # IMU Packet
        if fragment[0] == 73:
            packet = struct.unpack('<cchhhhhhhhh', fragment)
            
            arduino_checksum = packet[-1]
            checkSumState = calcDataChecksum(packet,arduino_checksum)
            if (checkSumState):
                # print("Checksum Correct")
                beetle_num = BEETLE_DICT[self.beetle_addr]
                if (beetle_num == 2 or beetle_num == 4 or beetle_num == 6 or beetle_num == 1 or beetle_num == 3):
                    beetle_pos = "Hand"
                else:
                    beetle_pos = "Chest"

                # print("Data from: Beetle " + str(beetle_num))
                packet_type = PACKET_DICT[packet[0]]
                accx = packet[2]
                accy = packet[3]
                accz = packet[4]
                gyrox = packet[5]
                gyroy = packet[6]
                gyroz = packet[7]
                moving = packet[1]

                if (moving == b'Y' and beetle_pos == "Hand"):
                    moving_status = "Hand Moving"
                    HAND_MOVING = True
                elif (moving == b'N' and beetle_pos == "Hand"):
                    moving_status = "Hand Not Moving"
                    HAND_MOVING = False
                elif (moving == b'N' and beetle_pos == "Chest"):
                    moving_status = "Chest Not Moving"
                elif (moving == b'Y' and beetle_pos == "Chest"):
                    moving_status = "Chest Moving"

                print(f"{beetle_pos} Beetle Moving Status: " + str(moving_status))

                #################################################################################################
                #################################################################################################
                ### CHANGE TO DANCEMOVE: DAB/JAMESBOND/MERMAID/COWBOY/PUSHBACK/SCARECROW/SNAKE/WINDOW/LOGOUT ####
                #################################################################################################
                #################################################################################################
                dance_move = "dab"

                # Collect data only if hand beetle is detected to be moving
                if (beetle_num == 2 or beetle_num == 4 or beetle_num == 6 or beetle_num == 1 or beetle_num == 3):
                    if HAND_MOVING:
                        row_data = [beetle_pos, gyrox, gyroy, gyroz, accx, accy, accz, dance_move]
                        DATA_LIST_1.append(row_data)
                        print("Beetle %s: " % beetle_num + str(len(DATA_LIST_1)))
                        if len(DATA_LIST_1) == 100:

                            #################################################################################################
                            #################################################################################################
                            ### CHANGE TO DANCEMOVE: DAB/JAMESBOND/MERMAID/COWBOY/PUSHBACK/SCARECROW/SNAKE/WINDOW/LOGOUT ####
                            #################################################################################################
                            #################################################################################################    
                            with open('dab_hand.csv','a',newline='') as f:
                                writer = csv.writer(f)
                                writer.writerows(DATA_LIST_1)                            
                            DATA_LIST_1.clear()
            
                else:
                    pass

                # # Dont detect to see if chest is moving, just record data
                # if (beetle_num == 1 or beetle_num == 3 or beetle_num == 5):
                #     row_data = [beetle_pos, gyrox, gyroy, gyroz, accx, accy, accz, dance_move]
                #     DATA_LIST_2.append(row_data)
                #     print("Beetle %s: " % beetle_num + str(len(DATA_LIST_2)))
                #     if len(DATA_LIST_2) == 100:


                #         #################################################################################################
                #         #################################################################################################
                #         #################### CHANGE TO DANCEMOVE: dab_chest/jamesbond_chest/mermaid_chest ###############
                #         #################################################################################################
                #         #################################################################################################    

                #         with open('test_chest.csv','a',newline='') as f:
                #             writer = csv.writer(f)
                #             writer.writerows(DATA_LIST_2)                 
                #         DATA_LIST_2.clear()
                
            else:
                print("Checksum Incorrect")
                # Ignore Data

        else: 
            return

def calcDataChecksum(data_packet,arduino_checksum):
    try:
        data_check = data_packet[0:len(data_packet)-1]
        checksum = ord(data_check[0]) 
        for i in range(1,len(data_check)):
            if type(data_check[i]) == bytes:
                checksum ^= ord(data_check[i])
            else: 
                checksum ^= data_check[i] 
        if (checksum == arduino_checksum):
            return True
        else:
            return False

    except ValueError:
        return False

class myThread(threading.Thread):
    def __init__(self,beetle,characteristics):
        threading.Thread.__init__(self)
        self.beetle = beetle
        self.characteristics = characteristics

    def run(self):
        try:
            idle_count = 0
            if (HANDSHAKE_BOOL_DICT[self.beetle.addr]):
                # Start receiving data only when both hand and chest beetle handshake have been completed

                # while not ((HANDSHAKE_BOOL_DICT[BEETLE_ADDR_1] and HANDSHAKE_BOOL_DICT[BEETLE_ADDR_2]) 
                # or (HANDSHAKE_BOOL_DICT[BEETLE_ADDR_3] and HANDSHAKE_BOOL_DICT[BEETLE_ADDR_4]) 
                # or (HANDSHAKE_BOOL_DICT[BEETLE_ADDR_5] and HANDSHAKE_BOOL_DICT[BEETLE_ADDR_6])):
                    # continue

                print("Receiving data...")
                while True:
                    try: 
                        if self.beetle.waitForNotifications(2.0):
                            continue
                        idle_count += 1
                        print(f"idle count: {idle_count}")
                        if idle_count == 3:
                            break
                    except BTLEDisconnectError:
                        print("Disconnect Error in Beetle %s" % (BEETLE_DICT[self.beetle.addr]))
                        reconnectBeetle(self.beetle)
                        self.reset()
                        initHandshake(self.beetle,self.characteristics)
                        print("HANDSHAKE COMPLETED AT RUN")
                        self.run()
                print("Error in Beetle %s" % (BEETLE_DICT[self.beetle.addr]))
                reconnectBeetle(self.beetle)
                self.reset()                
                initHandshake(self.beetle,self.characteristics)
                print("HANDSHAKE COMPLETED AT RUN")
                self.run()

        except Exception as e:
            print("Error in Beetle %s: %s" % (BEETLE_DICT[self.beetle.addr], e))
            reconnectBeetle(self.beetle)
            self.reset()
            initHandshake(self.beetle,self.characteristics)
            print("HANDSHAKE COMPLETED AT RUN")
            self.run()
        
    def reset(self):
        print("Resetting Beetle %s" % (BEETLE_DICT[self.beetle.addr]))
        self.characteristics.write(bytes(RESET,'utf-8'), withResponse = False)

    
def initHandshake(beetle, characteristics):
    print("Initializing Handshake Sequence with Beetle %s" % (BEETLE_DICT[beetle.addr]))
    
    print("Resetting Device")
    characteristics.write(bytes(RESET,'utf-8'), withResponse = False)

    ACK_BOOL_DICT[beetle.addr] = False

    sleep(1.0)
    
    handshake_attempts = 1
    try: 
        while (handshake_attempts <= 3 and not HANDSHAKE_BOOL_DICT[beetle.addr]):
            characteristics.write(bytes(HELLO,'utf-8'), withResponse = False)
            print("HANDSHAKE ATTEMPT %i: HELLO packet sent to Beetle %s" % (handshake_attempts, BEETLE_DICT[beetle.addr]))

            if (beetle.waitForNotifications(3.0) and (ACK_BOOL_DICT[beetle.addr] == True)):
                characteristics.write(bytes(ACK,'utf-8'),withResponse = False)
                print("HANDSHAKE ATTEMPT %i: ACK packet sent to Beetle %s" % (handshake_attempts, BEETLE_DICT[beetle.addr]))

                HANDSHAKE_BOOL_DICT[beetle.addr] = True
                print("Handshake sequence completed. Laptop is successfully connected to Beetle %s" % (BEETLE_DICT[beetle.addr]))
                return True
            handshake_attempts += 1

        if handshake_attempts > 3:
            HANDSHAKE_BOOL_DICT[beetle.addr] = False
            print("Handshake sequence with Beetle %s failed. Reattempting handshake..." % (BEETLE_DICT[beetle.addr]))
            # return False
            initHandshake(beetle,characteristics)
    
    except Exception as e:
            print(str(e) + " Error handshaking with Beetle %s" % (BEETLE_DICT[beetle.addr]))
            reconnectBeetle(beetle)
            initHandshake(beetle,characteristics)

#RECONNECT FUNCTION
def reconnectBeetle(beetle):
    HANDSHAKE_BOOL_DICT[beetle.addr] = False
    beetle._stopHelper()
    beetle.disconnect()
    sleep(2.0)
    try: 
        print("Reconnecting to Beetle %s" % (BEETLE_DICT[beetle.addr]))
        beetle.connect(beetle.addr)
        sleep(1.0)
        beetle.withDelegate(MyDelegate(beetle.addr))
        print("Reconnected to Beetle %s" % (BEETLE_DICT[beetle.addr]))
        
    except Exception as e:
        print(str(e) + " Error reconnecting to Beetle %s" % (BEETLE_DICT[beetle.addr]))
        reconnectBeetle(beetle)

class ScanDelegate(DefaultDelegate):
    def __init__(self):
        DefaultDelegate.__init__(self)

    def handleDiscovery(self, dev, isNewDev, isNewData):
        if dev.addr in BEETLE_DICT.keys():
            if not BEETLE_FOUND_DICT[dev.addr]:
                BEETLE_FOUND_DICT[dev.addr] = True
                print("Beetle %s found!" % (BEETLE_DICT[dev.addr]))

def establish_connection(addr):
    try:
        beetle = btle.Peripheral(addr)
        print("Established peripheral connection with Beetle %s" % (BEETLE_DICT[discovered.addr]))
        service = beetle.getServiceByUUID(SERIVCE_ID)
        characteristics = service.getCharacteristics()[0]
        beetle.setDelegate(MyDelegate(beetle.addr))
        handshake_status = initHandshake(beetle,characteristics)
        while handshake_status == False:
            initHandshake(beetle,characteristics)
        myThread(beetle,characteristics).start()
    except Exception as e:
        print("Error encountered while establish peripheral connection: %s" % e)
        print("Reattempting to establish connection with Beetle %s" % (BEETLE_DICT[discovered.addr]))
        sleep(1.0)
        establish_connection(addr)

class ScanDelegate(DefaultDelegate):
    def __init__(self):
        DefaultDelegate.__init__(self)

    def handleDiscovery(self, dev, isNewDev, isNewData):
            if dev.addr in BEETLE_DICT.keys():
                if not BEETLE_FOUND_DICT[dev.addr]:
                    BEETLE_FOUND_DICT[dev.addr] = True
                    print("Beetle %s found!" % (BEETLE_DICT[dev.addr]))

if __name__ == '__main__':
    scanner = Scanner().withDelegate(ScanDelegate())
    devices = scanner.scan(3.0)

    for discovered in devices:
        if discovered.addr in BEETLE_ALL:
            print("Establishing connection with Beetle %s" % (BEETLE_DICT[discovered.addr]))
            beetle = establish_connection(discovered.addr)