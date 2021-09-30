from bluepy import btle
from bluepy.btle import Scanner, DefaultDelegate, BTLEDisconnectError
from time import sleep
import struct
import threading
import numpy as np

ACK = 'A'
HELLO = 'H'
RESET = 'R'

BEETLE_ADDR_1 = "b0:b1:13:2d:b5:48"
BEETLE_ADDR_2 = "b0:b1:13:2d:d6:75"
BEETLE_ADDR_3 = "b0:b1:13:2d:b6:2a"

SERIVCE_ID = "0000dfb0-0000-1000-8000-00805f9b34fb"

BUFFER_DICT = {BEETLE_ADDR_1: b"", BEETLE_ADDR_2: b"", BEETLE_ADDR_3: b""}


BEETLE_ALL = [BEETLE_ADDR_1, BEETLE_ADDR_2, BEETLE_ADDR_3]
BEETLE_DICT = {BEETLE_ADDR_1: 1, BEETLE_ADDR_2: 2, BEETLE_ADDR_3: 3}
BEETLE_FOUND_DICT = {BEETLE_ADDR_1: False, BEETLE_ADDR_2: False, BEETLE_ADDR_3: False}

ACK_BOOL_DICT = {BEETLE_ADDR_1: False, BEETLE_ADDR_2: False, BEETLE_ADDR_3: False}
HANDSHAKE_BOOL_DICT = {BEETLE_ADDR_1: False, BEETLE_ADDR_2: False, BEETLE_ADDR_3: False}
RECONNECT_BEETLE_DICT = {BEETLE_ADDR_1: 0, BEETLE_ADDR_2: 0, BEETLE_ADDR_3: 0}

START_DICT = {BEETLE_ADDR_1: False, BEETLE_ADDR_2: False, BEETLE_ADDR_3: False}

PACKET_DICT = {b'E': "EMG Packet", b'I': "IMU Packet", b'T': "Time Packet"}

class MyDelegate(btle.DefaultDelegate):
    def __init__(self,addr):
        btle.DefaultDelegate.__init__(self)
        self.beetle_addr = addr
        self.buffer = b''
    
    def handleNotification(self,cHandle,fragment):
        packet_size = len(fragment)
        print("Packet Size: " + str(packet_size))
        print(fragment)
        
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
                print("Complete handshake process first before sending data.")    
        
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
                print("Existing Buffer Data: ")
                print(existing_fragmented_data)
                # No data fragments currently present
                if existing_fragmented_data == b'': 
                    existing_fragmented_data = fragment
                    fragmented_data_length = len(existing_fragmented_data)
                    print("Fragmented Data: ")
                    print(existing_fragmented_data)
                
                else:
                    print("Fragmented Data: ")
                    print(fragment)
                    existing_fragmented_data += fragment
                    fragmented_data_length = len(existing_fragmented_data)

                # Assembled data fragments form exactly 1 packet
                if fragmented_data_length == 20:
                    fragment = existing_fragmented_data
                    # Clear assembled data fragments
                    BUFFER_DICT[self.beetle_addr] = b''

                    print("Data Assembling Completed. Assembled Data: ")
                    print(fragment)
                    print("")
                    print("")
                    print("")
                    # Send for data reading directly since it is a complete packet
                    self.handleData(fragment)

                # Current data fragments form more than 1 complete packet
                elif fragmented_data_length > 20:
                    fragment = existing_fragmented_data[0:20]
                    
                    print("Data Assembling Completed. Assembled Data: ")
                    print(fragment)
                    print("")
                    print("")
                    print("")

                    # Store rest of fragment into buffer dictionary
                    BUFFER_DICT[self.beetle_addr] = existing_fragmented_data[20:]
                    # Send for data reading directly 
                    self.handleData(fragment)
                    
                else:
                    print("Buffer not full.")
                    print("")
                    print("")
                    print("")
                    BUFFER_DICT[self.beetle_addr] += fragment
        
    def handleData(self,fragment):
        # IMU Packet
        if fragment[0] == 73:
            packet = struct.unpack('<chhhhhhBBBBch', fragment)
            
            # Obtain timestamp packet
            # print(packet)
            big_endian_packet = struct.unpack('>chhhhhhLch', fragment)
            unsigned_long = np.uint32
            timestamp = big_endian_packet[7]
            
            arduino_checksum = packet[-1]
            checkSumState = calcDataChecksum(packet,arduino_checksum)
            if (checkSumState):
                print("Checksum Correct")
                print("Data from: Beetle " + str(BEETLE_DICT[self.beetle_addr]))
                packet_type = PACKET_DICT[packet[0]]
                accx = packet[1]
                accy = packet[2]
                accz = packet[3]
                gyrox = packet[4]
                gyroy = packet[5]
                gyroz = packet[6]
                print("Packet Type: " + str(packet_type))
                print("Accx: " + str(accx))
                print("Accy: " + str(accy))
                print("Accz: " + str(accz))
                print("Gyrox: " + str(gyrox))
                print("Gyroy: " + str(gyroy))
                print("Gyroz: " + str(gyroz))  
                print("Timestamp: " + str(timestamp))
                print("")
                print("")
                print("")
                # Send Data to Ultra96
            else:
                print("Checksum Incorrect")
                # Ignore Data


        # Time Packet
        elif fragment[0] == 84:
            packet = struct.unpack('<cBBBBlllch', fragment)
            
            big_endian_packet = struct.unpack('>cLlllch', fragment)
            unsigned_long = np.uint32
            timestamp = big_endian_packet[1]

            arduino_checksum = packet[-1]
            checkSumState = calcDataChecksum(packet,arduino_checksum)
            if (checkSumState):
                print("Checksum Correct")
                print("Data from: Beetle " + str(BEETLE_DICT[self.beetle_addr]))
                packet_type = PACKET_DICT[packet[0]]
                print("Packet Type: " + str(packet_type))
                print("Timestamp: " + str(timestamp))
                print("")
                print("")
                print("")
            else:
                print("Checksum Incorrect")

        # EMG Packet
        elif fragment[0] == 69:
            packet = struct.unpack('<chhhBBBBlhch', fragment)
            
            big_endian_packet = struct.unpack('>chhhLlhch', fragment)
            unsigned_long = np.uint32
            timestamp = big_endian_packet[4]

            arduino_checksum = packet[-1]
            checkSumState = calcDataChecksum(packet,arduino_checksum)
            if (checkSumState):
                print("Checksum Correct")
                print("Data from: Beetle " + str(BEETLE_DICT[self.beetle_addr]))
                packet_type = PACKET_DICT[packet[0]]
                mean = packet[1]
                rms = packet[2]
                emax = packet[3]
                print("Packet Pype: " + str(packet_type))
                print("Mean: " + str(mean))
                print("Rms: " + str(rms))
                print("Max: " + str(emax))
                print("Timestamp: " + str(timestamp))
                print("")
                print("")
                print("")
            else:
                print("Checksum Incorrect")
        
        else: 
            return



def calcDataChecksum(data_packet,arduino_checksum):
    try:
        data_check = data_packet[0:len(data_packet)-1]
        checksum = ord(data_check[0]) 
        print("Arduino checksum: " + str(arduino_checksum))
        for i in range(1,len(data_check)):
            if type(data_check[i]) == bytes:
                checksum ^= ord(data_check[i])
            else: 
                checksum ^= data_check[i] 
        print("calculated checksum: " + str(checksum))
        if (checksum == arduino_checksum):
            return True
        else:
            return False

    except ValueError:
        return False

class ScanDelegate(DefaultDelegate):
    def __init__(self):
        DefaultDelegate.__init__(self)

    def handleDiscovery(self, dev, isNewDev, isNewData):
            if dev.addr in BEETLE_DICT.keys():
                if not BEETLE_FOUND_DICT[dev.addr]:
                    BEETLE_FOUND_DICT[dev.addr] = True
                    print("Beetle %s found!" % (BEETLE_DICT[dev.addr]))

class myThread(threading.Thread):
    def __init__(self,beetle):
        threading.Thread.__init__(self)
        self.beetle = beetle
        self.service = beetle.getServiceByUUID(SERIVCE_ID)
        self.characteristics = self.service.getCharacteristics()[0]

    def run(self):
        try:
            self.beetle.setDelegate(MyDelegate(self.beetle.addr))
            RECONNECT_BEETLE_DICT[self.beetle.addr] = 0
            HANDSHAKE_BOOL_DICT[self.beetle.addr] = self.initHandshake()
            if (HANDSHAKE_BOOL_DICT[self.beetle.addr]):
                self.receiveData()
            else:
                self.beetle._stopHelper()
                self.beetle.disconnect()
                self.reconnectBeetle()

        except Exception as e:
            print(str(e) + " Error in Beetle %s at run: " % (BEETLE_DICT[self.beetle.addr]))
            HANDSHAKE_BOOL_DICT[self.beetle.addr] = False
            self.reconnectBeetle()
        

    
    #RECONNECT FUNCTION
    def reconnectBeetle(self):
        # HANDSHAKE_BOOL_DICT[self.beetle.addr] = False
        sleep(3)
        try: 
            RECONNECT_BEETLE_DICT[self.beetle.addr] += 1
            print("RECONNECT ATTEMPT %i: Reconnecting to Beetle %s" % (RECONNECT_BEETLE_DICT[self.beetle.addr], BEETLE_DICT[self.beetle.addr]))
            self.beetle.connect(self.beetle.addr)
            sleep(3.0)
            print("RECONNECT ATTEMPT %i: Reconnected to Beetle %s" % (RECONNECT_BEETLE_DICT[self.beetle.addr], BEETLE_DICT[self.beetle.addr]))
            self.run()
        except Exception as e:
            print(str(e) + " Error in Beetle %s at reconnectBeetle: " % (BEETLE_DICT[self.beetle.addr]))
            print("RECONNECT ATTEMPT %i: Failed to reconnect to Beetle %s. Reattempt to reconnect to Beetle %s" % (RECONNECT_BEETLE_DICT[self.beetle.addr], BEETLE_DICT[self.beetle.addr], BEETLE_DICT[self.beetle.addr]))
            RECONNECT_BEETLE_DICT[self.beetle.addr] += 1
            self.reconnectBeetle()

    def receiveData(self):
        print("Receiving data..")
        idle_count = 0
        try:
            while True:
                try:
                    if self.beetle.waitForNotifications(2.0):
                        continue
                    else:
                        idle_count += 1
                        if (idle_count == 1):
                            print("Beetle %s disconnected." % (BEETLE_DICT[self.beetle.addr]))
                        print("Idle count: " + str(idle_count))
                        if idle_count > 1: # To be adjusted
                            idle_count = 0
                            self.beetle._stopHelper()
                            self.beetle.disconnect()
                            self.reconnectBeetle()
                except Exception as e:
                    print(str(e) + " Error in Beetle %s at receiveData: " % (BEETLE_DICT[self.beetle.addr]))
                    self.beetle._stopHelper()
                    self.beetle.disconnect()
                    self.reconnectBeetle()
        except BTLEDisconnectError:
            print("BTLEDDisconnect Error in Beetle %s at receiveData, attempting to reconnect" % (BEETLE_DICT[self.beetle.addr]))
            self.reconnectBeetle()


    def initHandshake(self):
        print("Initializing Handshake Sequence with Beetle %s" % (BEETLE_DICT[self.beetle.addr]))
        
        print("Resetting Device")
        self.characteristics.write(bytes(RESET,'utf-8'), withResponse = False)

        ACK_BOOL_DICT[self.beetle.addr] = False
        
        handshake_attempts = 1
        try: 
            while (handshake_attempts <= 3 and not HANDSHAKE_BOOL_DICT[self.beetle.addr]):
                self.characteristics.write(bytes(HELLO,'utf-8'), withResponse = False)
                print("HANDSHAKE ATTEMPT %i: HELLO packet sent to Beetle %s" % (handshake_attempts, BEETLE_DICT[self.beetle.addr]))

                if (beetle.waitForNotifications(3.0) and (ACK_BOOL_DICT[self.beetle.addr] == True)):
                    self.characteristics.write(bytes(ACK,'utf-8'),withResponse = False)
                    print("HANDSHAKE ATTEMPT %i: ACK packet sent to Beetle %s" % (handshake_attempts, BEETLE_DICT[self.beetle.addr]))

                    HANDSHAKE_BOOL_DICT[self.beetle.addr] = True
                    print("Handshake sequence completed. Laptop is successfully connected to Beetle %s" % (BEETLE_DICT[self.beetle.addr]))
                    return True
                handshake_attempts += 1

            if handshake_attempts > 3:
                HANDSHAKE_BOOL_DICT[self.beetle.addr] = False
                print("Handshake sequence with Beetle %s failed" % (BEETLE_DICT[self.beetle.addr]))
                return False
        except Exception as e:
            print(str(e) + " Error in Beetle %s at Handshake: " % (BEETLE_DICT[self.beetle.addr]))
            self.beetle._stopHelper()
            self.beetle.disconnect()
            self.reconnectBeetle()

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
            try:
                beetle = btle.Peripheral(discovered.addr)
                print("Established peripheral connection with Beetle %s" % (BEETLE_DICT[discovered.addr]))
                myThread(beetle).start()
            except Exception as e:
                print(e)
                print("Reattempting to establish connection with Beetle %s" % (BEETLE_DICT[discovered.addr]))
                sleep(1)
                beetle = btle.Peripheral(discovered.addr)
                myThread(beetle).start()