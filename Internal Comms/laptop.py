from bluepy import btle
from bluepy.btle import Scanner, DefaultDelegate, BTLEDisconnectError
from time import sleep
import struct
import threading
import os
import socket
import time
import traceback
import logging
import sys

DANCER_ID = int(os.environ["DANCER_ID"])

ACK = 'A'
HELLO = 'H'
RESET = 'R'

BEETLE_ADDR_1 = "b0:b1:13:2d:b6:21" # SET 1 CHEST
BEETLE_ADDR_2 = "b0:b1:13:2d:b5:48" # SET 1 HAND
BEETLE_ADDR_3 = "b0:b1:13:2d:d6:75" # SET 2 CHEST
BEETLE_ADDR_4 = "b0:b1:13:2d:b6:2a" # SET 2 HAND
BEETLE_ADDR_5 = "b0:b1:13:2d:cd:81" # EMG SET CHEST
BEETLE_ADDR_6 = "b0:b1:13:2d:d6:7b" # EMG SET HAND


SERIVCE_ID = "0000dfb0-0000-1000-8000-00805f9b34fb"

BUFFER_DICT = {BEETLE_ADDR_1: b"", BEETLE_ADDR_2: b"", BEETLE_ADDR_3: b"", BEETLE_ADDR_4: b"", BEETLE_ADDR_5: b"", BEETLE_ADDR_6: b""}


BEETLE_ALL = [BEETLE_ADDR_1, BEETLE_ADDR_2, BEETLE_ADDR_3, BEETLE_ADDR_4, BEETLE_ADDR_5, BEETLE_ADDR_6]
BEETLE_DICT = {BEETLE_ADDR_1: 1, BEETLE_ADDR_2: 2, BEETLE_ADDR_3: 3, BEETLE_ADDR_4: 4, BEETLE_ADDR_5: 5, BEETLE_ADDR_6: 6}
BEETLE_TYPE = {BEETLE_ADDR_1: "CHEST", BEETLE_ADDR_2: "HAND", BEETLE_ADDR_3: "CHEST", BEETLE_ADDR_4: "HAND", BEETLE_ADDR_5: "CHEST", BEETLE_ADDR_6: "HAND"}
BEETLE_FOUND_DICT = {BEETLE_ADDR_1: False, BEETLE_ADDR_2: False, BEETLE_ADDR_3: False, BEETLE_ADDR_4: False, BEETLE_ADDR_5: False, BEETLE_ADDR_6: False}

ACK_BOOL_DICT = {BEETLE_ADDR_1: False, BEETLE_ADDR_2: False, BEETLE_ADDR_3: False, BEETLE_ADDR_4: False, BEETLE_ADDR_5: False, BEETLE_ADDR_6: False}
HANDSHAKE_BOOL_DICT = {BEETLE_ADDR_1: False, BEETLE_ADDR_2: False, BEETLE_ADDR_3: False, BEETLE_ADDR_4: False, BEETLE_ADDR_5: False, BEETLE_ADDR_6: False}

START_DICT = {BEETLE_ADDR_1: False, BEETLE_ADDR_2: False, BEETLE_ADDR_3: False, BEETLE_ADDR_4: False, BEETLE_ADDR_5: False, BEETLE_ADDR_6: False}

PACKET_DICT = {b'E': "EMG Packet", b'I': "IMU Packet", b'T': "Time Packet"}

HAND_MOVING = False

DATA_LIST_1 = []
DATA_LIST_2 = []

SEND_BUFFER = []

#logging setup
filehandler = logging.FileHandler(
    filename=f'logs/laptop_{time.strftime("%H%M%S-%Y%m%d")}.log'
)
streamhandler = logging.StreamHandler(sys.stdout)
handlers = [filehandler,streamhandler]
logging.basicConfig(
    level=logging.INFO,
    format="[%(asctime)s] {%(filename)s:%(lineno)d} %(levelname)s - %(message)s",
    handlers=handlers,
)
logger = logging.getLogger("laptop")


class MyDelegate(btle.DefaultDelegate):
    def __init__(self,addr):
        btle.DefaultDelegate.__init__(self)
        self.beetle_addr = addr
        self.buffer = b''

    def handleNotification(self,cHandle,fragment):
        packet_size = len(fragment)
        # print("Packet Size: " + str(packet_size))
        # print(fragment)
        
        # Handshake not completed
        if not HANDSHAKE_BOOL_DICT[self.beetle_addr]:
            if packet_size == 1:
                packet_type = struct.unpack('<c',fragment)[0] 
                # ACK packet for handshake
                if packet_type == b'A':
                    logger.info(f"ACK packet has been received from Beetle {BEETLE_DICT[self.beetle_addr]}.")
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
                logger.info(f"Data Assembling Begin in Beetle {BEETLE_DICT[self.beetle_addr]}")
                
                existing_fragmented_data = BUFFER_DICT[self.beetle_addr]
                # print("Existing Buffer Data: ")
                # print(existing_fragmented_data)
                # No data fragments currently present
                if existing_fragmented_data == b'': 
                    existing_fragmented_data = fragment
                    fragmented_data_length = len(existing_fragmented_data)
                    # print("Fragmented Data: ")
                    # print(existing_fragmented_data)
                
                else:
                    # print("Fragmented Data: ")
                    # print(fragment)
                    existing_fragmented_data += fragment
                    fragmented_data_length = len(existing_fragmented_data)

                # Assembled data fragments form exactly 1 packet
                if fragmented_data_length == 20:
                    fragment = existing_fragmented_data
                    # Clear assembled data fragments
                    BUFFER_DICT[self.beetle_addr] = b''

                    logger.info(f"Data Assembling Completed in Beetle {BEETLE_DICT[self.beetle_addr]}")
                    # print(fragment)
                    # print("")
                    # print("")
                    # print("")
                    # Send for data reading directly since it is a complete packet
                    self.handleData(fragment)

                # Current data fragments form more than 1 complete packet
                elif fragmented_data_length > 20:
                    fragment = existing_fragmented_data[0:20]
                    
                    logger.info(f"Data Assembling Completed in Beetle {BEETLE_DICT[self.beetle_addr]}")
                    # print(fragment)
                    # print("")
                    # print("")
                    # print("")

                    # Store rest of fragment into buffer dictionary
                    BUFFER_DICT[self.beetle_addr] = existing_fragmented_data[20:]
                    # Send for data reading directly 
                    self.handleData(fragment)
                    
                else:
                    # print("Buffer not full.")
                    # print("")
                    # print("")
                    # print("")
                    BUFFER_DICT[self.beetle_addr] += fragment
        
    def handleData(self,fragment):
        global SEND_BUFFER
        # IMU Packet
        if fragment[0] == 73:
            packet = struct.unpack('<cchhhhhhBBBBh', fragment)

            # Obtain timestamp packet
            big_endian_packet = struct.unpack('>cchhhhhhLh', fragment)
            timestamp = big_endian_packet[8]
            
            arduino_checksum = packet[-1]
            checkSumState = calcDataChecksum(packet,arduino_checksum)
            if (checkSumState):
                # print("Checksum Correct")
                beetle_num = BEETLE_DICT[self.beetle_addr]
                if (beetle_num == 1 or beetle_num == 3 or beetle_num == 5):
                    beetle_pos = 1 #"Chest"
                else:
                    beetle_pos = 0 #"Hand"

                # print("Data from: Beetle " + str(beetle_num))
                data_type = PACKET_DICT[packet[0]]
                accx = packet[2]
                accy = packet[3]
                accz = packet[4]
                gyrox = packet[5]
                gyroy = packet[6]
                gyroz = packet[7]
                moving = packet[1]
                if (moving == b'Y' and beetle_pos == 0):
                    moving_status = "Hand Moving"
                    HAND_MOVING = True
                elif (moving == b'N' and beetle_pos == 0):
                    moving_status = "Hand Not Moving"
                    HAND_MOVING = False
                elif (moving == b'N' and beetle_pos == 1):
                    moving_status = "Chest Not Moving"
                elif (moving == b'Y' and beetle_pos == 1):
                    moving_status = "Chest Moving"

                logger.info(f"{BEETLE_TYPE[self.beetle_addr]} Beetle Moving Status: " + str(moving_status))
    
                # Dont detect to see if chest is moving, just record data
                if (beetle_num == 1 or beetle_num == 3 or beetle_num == 5):
                    try:
                        emg = 0
                        laptop_time = time.time() #clarify
                        final_data = f"#{DANCER_ID},{beetle_pos},{gyrox},{gyroy},{gyroz},{accx},{accy},{accz},{emg},{laptop_time}\n"
                        SEND_BUFFER.append(final_data)
                        # emg += 1
                    except Exception:
                        print(traceback.format_exc())
                # Collect data only if beetle is detected to be moving
                elif (beetle_num == 2 or beetle_num == 4 or beetle_num == 6):
                    if HAND_MOVING:
                        try:
                            emg = 0
                            laptop_time = time.time() #clarify
                            final_data = f"#{DANCER_ID},{beetle_pos},{gyrox},{gyroy},{gyroz},{accx},{accy},{accz},{emg},{laptop_time}\n"
                            SEND_BUFFER.append(final_data)
                            
                            # emg += 1
                        except Exception:
                            print(traceback.format_exc())       
                
                else:
                    pass
                # print("Packet Type: " + str(packet_type))
                # print("Accx: " + str(accx))
                # print("Accy: " + str(accy))
                # print("Accz: " + str(accz))
                # print("Gyrox: " + str(gyrox))
                # print("Gyroy: " + str(gyroy))
                # print("Gyroz: " + str(gyroz))  
                # print("Timestamp: " + str(timestamp))
                # Send Data to Ultra96
            else:
                logger.error("Checksum Incorrect")
                # Ignore Data
    
    


        # # Time Packet
        # elif fragment[0] == 84:
        #     packet = struct.unpack('<cBBBBlllch', fragment)
            
        #     big_endian_packet = struct.unpack('>cLlllch', fragment)
        #     timestamp = big_endian_packet[1]

        #     arduino_checksum = packet[-1]
        #     checkSumState = calcDataChecksum(packet,arduino_checksum)
        #     if (checkSumState):
        #         print("Checksum Correct")
        #         print("Data from: Beetle " + str(BEETLE_DICT[self.beetle_addr]))
        #         packet_type = PACKET_DICT[packet[0]]
        #         print("Packet Type: " + str(packet_type))
        #         print("Timestamp: " + str(timestamp))
        #         print("")
        #         print("")
        #         print("")
        #     else:
        #         print("Checksum Incorrect")

        # # EMG Packet
        # elif fragment[0] == 69:
        #     packet = struct.unpack('<chhhBBBBlhch', fragment)
            
        #     big_endian_packet = struct.unpack('>chhhLlhch', fragment)
        #     timestamp = big_endian_packet[4]

        #     arduino_checksum = packet[-1]
        #     checkSumState = calcDataChecksum(packet,arduino_checksum)
        #     if (checkSumState):
        #         print("Checksum Correct")
        #         print("Data from: Beetle " + str(BEETLE_DICT[self.beetle_addr]))
        #         packet_type = PACKET_DICT[packet[0]]
        #         mean = packet[1]
        #         rms = packet[2]
        #         emax = packet[3]
        #         print("Packet Pype: " + str(packet_type))
        #         print("Mean: " + str(mean))
        #         print("Rms: " + str(rms))
        #         print("Max: " + str(emax))
        #         print("Timestamp: " + str(timestamp))
        #         print("")
        #         print("")
        #         print("")
        #     else:
        #         print("Checksum Incorrect")
        
        # else: 
        #     return

def calcDataChecksum(data_packet,arduino_checksum):
    try:
        data_check = data_packet[0:len(data_packet)-1]
        checksum = ord(data_check[0]) 
        # print("Arduino checksum: " + str(arduino_checksum))
        for i in range(1,len(data_check)):
            if type(data_check[i]) == bytes:
                checksum ^= ord(data_check[i])
            else: 
                checksum ^= data_check[i] 
        # print("calculated checksum: " + str(checksum))
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
        global SEND_BUFFER
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
            sock.connect(("localhost", 8000))
            
            try:
                idle_count = 0
                if (HANDSHAKE_BOOL_DICT[self.beetle.addr]):
                    # while not ((HANDSHAKE_BOOL_DICT[BEETLE_ADDR_1] and HANDSHAKE_BOOL_DICT[BEETLE_ADDR_2]) 
                    # or (HANDSHAKE_BOOL_DICT[BEETLE_ADDR_3] and HANDSHAKE_BOOL_DICT[BEETLE_ADDR_4]) 
                    # or (HANDSHAKE_BOOL_DICT[BEETLE_ADDR_5] and HANDSHAKE_BOOL_DICT[BEETLE_ADDR_6])):
                    #     continue
                    logger.info(f"Receiving data from {BEETLE_TYPE[self.beetle.addr]} Beetle...")
                    while True:
                        if self.beetle.waitForNotifications(2.0):
                            if len(SEND_BUFFER) == 3:
                                compiled_data = "".join(SEND_BUFFER)
                                sock.sendall(compiled_data.encode())
                                SEND_BUFFER = []
                            continue
                        idle_count += 1
                        logger.info(f"idle count: {idle_count}")
                        if idle_count == 3:
                            break
                    logger.error(f"Error in Beetle {BEETLE_DICT[self.beetle.addr]}")
                    reconnectBeetle(self.beetle)
                    self.reset()                
                    initHandshake(self.beetle,self.characteristics)
                    sock.close()
                    self.run()

            except Exception as e:
                logger.error(f"Error in Beetle {BEETLE_DICT[self.beetle.addr]}: {e}")
                reconnectBeetle(self.beetle)
                self.reset()
                initHandshake(self.beetle,self.characteristics)
                sock.close()
                self.run()

    def reset(self):
        logger.info(f"Resetting Beetle {BEETLE_DICT[self.beetle.addr]}")
        self.characteristics.write(bytes(RESET,'utf-8'), withResponse = False)

    
def initHandshake(beetle, characteristics):
    logger.info(f"Initializing Handshake Sequence with Beetle {BEETLE_DICT[beetle.addr]}")
    
    logger.info("Resetting Device")
    characteristics.write(bytes(RESET,'utf-8'), withResponse = False)

    ACK_BOOL_DICT[beetle.addr] = False

    sleep(1.0)
    
    handshake_attempts = 1
    try: 
        while (handshake_attempts <= 3 and not HANDSHAKE_BOOL_DICT[beetle.addr]):
            characteristics.write(bytes(HELLO,'utf-8'), withResponse = False)
            logger.info(f"HANDSHAKE ATTEMPT {handshake_attempts}: HELLO packet sent to Beetle {BEETLE_DICT[beetle.addr]}")

            if (beetle.waitForNotifications(3.0) and (ACK_BOOL_DICT[beetle.addr] == True)):
                characteristics.write(bytes(ACK,'utf-8'),withResponse = False)
                logger.info(f"HANDSHAKE ATTEMPT {handshake_attempts}: ACK packet sent to Beetle {BEETLE_DICT[beetle.addr]}")

                HANDSHAKE_BOOL_DICT[beetle.addr] = True
                logger.info(f"Handshake sequence completed. Laptop is successfully connected to Beetle {BEETLE_DICT[beetle.addr]}")
                return True
            handshake_attempts += 1

        if handshake_attempts > 3:
            HANDSHAKE_BOOL_DICT[beetle.addr] = False
            logger.error(f"Handshake sequence with Beetle {BEETLE_DICT[beetle.addr]} failed. Reattempting handshake...")
            # return False
            initHandshake(beetle,characteristics)
    
    except Exception as e:
        logger.error(f"{e} Error handshaking with Beetle {BEETLE_DICT[beetle.addr]}")
        reconnectBeetle(beetle)
        initHandshake(beetle,characteristics)

#RECONNECT FUNCTION
def reconnectBeetle(beetle):
    HANDSHAKE_BOOL_DICT[beetle.addr] = False
    beetle._stopHelper()
    beetle.disconnect()
    sleep(2.0)
    try: 
        logger.info(f"Reconnecting to Beetle {BEETLE_DICT[beetle.addr]}")
        beetle.connect(beetle.addr)
        sleep(1.0)
        beetle.withDelegate(MyDelegate(beetle.addr))
        logger.info(f"Reconnected to Beetle {BEETLE_DICT[beetle.addr]}")
        
    except Exception as e:
        logger.error(f"{e}  Error reconnecting with Beetle {BEETLE_DICT[beetle.addr]}")
        reconnectBeetle(beetle)

class ScanDelegate(DefaultDelegate):
    def __init__(self):
        DefaultDelegate.__init__(self)

    def handleDiscovery(self, dev, isNewDev, isNewData):
        if dev.addr in BEETLE_DICT.keys():
            if not BEETLE_FOUND_DICT[dev.addr]:
                BEETLE_FOUND_DICT[dev.addr] = True
                logger.info(f"Beetle {BEETLE_DICT[dev.addr]} found!")

def establish_connection(addr):
    try:
        beetle = btle.Peripheral(addr)
        logger.info(f"Established peripheral connection with Beetle {BEETLE_DICT[addr]}")
        service = beetle.getServiceByUUID(SERIVCE_ID)
        characteristics = service.getCharacteristics()[0]
        beetle.setDelegate(MyDelegate(beetle.addr))
        handshake_status = initHandshake(beetle,characteristics)
        while handshake_status == False:
            initHandshake(beetle,characteristics)
        myThread(beetle,characteristics).start()
    except Exception as e:
        logger.error(f"Error encountered while establish peripheral connection: {e}")
        logger.info(f"Reattempting to establish connection with Beetle {BEETLE_DICT[addr]}")
        sleep(1.0)
        establish_connection(addr)

class ScanDelegate(DefaultDelegate):
    def __init__(self):
        DefaultDelegate.__init__(self)

    def handleDiscovery(self, dev, isNewDev, isNewData):
            if dev.addr in BEETLE_DICT.keys():
                if not BEETLE_FOUND_DICT[dev.addr]:
                    BEETLE_FOUND_DICT[dev.addr] = True
                    logger.info(f"Beetle {BEETLE_DICT[dev.addr]} found!")



if __name__ == '__main__':
    scanner = Scanner().withDelegate(ScanDelegate())
    devices = scanner.scan(3.0)

    for discovered in devices:
        if discovered.addr in BEETLE_ALL:
            logger.info(f"Establishing connection with Beetle {BEETLE_DICT[discovered.addr]}")
            beetle = establish_connection(discovered.addr)