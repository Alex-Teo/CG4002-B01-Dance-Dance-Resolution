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
BEETLE_ADDR_4 = "2c:ab:33:cc:5f:45" # SET 2 HAND
BEETLE_ADDR_5 = "c8:df:84:fe:4c:19" # EMG SET CHEST
BEETLE_ADDR_6 = "b0:b1:13:2d:d6:7b" # EMG SET HAND 

SERIVCE_ID = "0000dfb0-0000-1000-8000-00805f9b34fb"

BUFFER_DICT = {BEETLE_ADDR_1: b"", BEETLE_ADDR_2: b"", BEETLE_ADDR_3: b"", BEETLE_ADDR_4: b"", BEETLE_ADDR_5: b"", BEETLE_ADDR_6: b""}


BEETLE_ALL = [BEETLE_ADDR_1, BEETLE_ADDR_2, BEETLE_ADDR_3, BEETLE_ADDR_4, BEETLE_ADDR_5, BEETLE_ADDR_6]
BEETLE_DICT = {BEETLE_ADDR_1: 1, BEETLE_ADDR_2: 2, BEETLE_ADDR_3: 3, BEETLE_ADDR_4: 4, BEETLE_ADDR_5: 5, BEETLE_ADDR_6: 6}
BEETLE_TYPE = {BEETLE_ADDR_1: "HAND", BEETLE_ADDR_2: "HAND", BEETLE_ADDR_3: "HAND", BEETLE_ADDR_4: "HAND", BEETLE_ADDR_5: "HAND", BEETLE_ADDR_6: "HAND"}
BEETLE_FOUND_DICT = {BEETLE_ADDR_1: False, BEETLE_ADDR_2: False, BEETLE_ADDR_3: False, BEETLE_ADDR_4: False, BEETLE_ADDR_5: False, BEETLE_ADDR_6: False}

ACK_BOOL_DICT = {BEETLE_ADDR_1: False, BEETLE_ADDR_2: False, BEETLE_ADDR_3: False, BEETLE_ADDR_4: False, BEETLE_ADDR_5: False, BEETLE_ADDR_6: False}
HANDSHAKE_BOOL_DICT = {BEETLE_ADDR_1: False, BEETLE_ADDR_2: False, BEETLE_ADDR_3: False, BEETLE_ADDR_4: False, BEETLE_ADDR_5: False, BEETLE_ADDR_6: False}

START_DICT = {BEETLE_ADDR_1: False, BEETLE_ADDR_2: False, BEETLE_ADDR_3: False, BEETLE_ADDR_4: False, BEETLE_ADDR_5: False, BEETLE_ADDR_6: False}

START_MOVE = False
START_MOVE_TIME = False
VERY_FIRST = True
POS_DETECTED = ""
POS_DETECTED_BOOL = False
POS_DATA_SENT = False
STOP_FIRST_BOOL = True
STOP_FIRST_TIME = 9999999999

DATA_LIST_1 = []
DATA_LIST_2 = []

SEND_BUFFER = []

# Create logs folder if it does not currently exist
try:
    os.mkdir('logs')
except FileExistsError:
    pass

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
        
        # Handshake Process
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

            # Data assembling is required
            else:                
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

                    # Send for data reading directly since it is a complete packet
                    self.handleData(fragment)

                # Current data fragments form more than 1 complete packet
                elif fragmented_data_length > 20:
                    # Extract only the first 20 bytes for a complete packet
                    fragment = existing_fragmented_data[0:20]
                    
                    # Store rest of fragment into buffer dictionary
                    BUFFER_DICT[self.beetle_addr] = existing_fragmented_data[20:]
                    # Send for data reading directly 
                    self.handleData(fragment)
                    
                else:
                    BUFFER_DICT[self.beetle_addr] += fragment
        
    # Function to process received data from beetle
    def handleData(self,fragment):
        global SEND_BUFFER
        global START_MOVE
        global START_MOVE_TIME
        global VERY_FIRST
        global POS_DETECTED
        global POS_DETECTED_BOOL
        global STOP_FIRST_TIME
        global STOP_FIRST_BOOL
        global POS_DATA_SENT

        # Very first dance move
        if VERY_FIRST:
            # If 41 seconds has passed and position data is not sent yet
            if round(time.time() - STOP_FIRST_TIME) >= 41 and not POS_DATA_SENT:
                
                # Send S as position change if no position change is detected
                if not POS_DETECTED_BOOL:
                    POS_DETECTED = "S"

                try:
                    position_data = f"${DANCER_ID},{POS_DETECTED}\n"
                    SEND_BUFFER.append(position_data)
                    STOP_FIRST_TIME = 9999999999
                    logger.info(f"{BEETLE_TYPE[self.beetle_addr]} BEETLE NEW POSITION: {POS_DETECTED}")
                    POS_DATA_SENT = True
                    POS_DETECTED_BOOL = False
                except Exception:
                    print(traceback.format_exc()) 

        # For every other dance moves
        else: 
            # If 16 seconds has passed and position data is not sent yet
            if round(time.time() - STOP_FIRST_TIME) >= 16 and not POS_DATA_SENT:

                # Send S as position change if no position change is detected
                if not POS_DETECTED_BOOL:
                    POS_DETECTED = "S"

                try:
                    position_data = f"${DANCER_ID},{POS_DETECTED}\n"
                    SEND_BUFFER.append(position_data)
                    STOP_FIRST_TIME = 9999999999
                    logger.info(f"{BEETLE_TYPE[self.beetle_addr]} BEETLE NEW POSITION: {POS_DETECTED}")
                    POS_DATA_SENT = True
                    POS_DETECTED_BOOL = False
                except Exception:
                    print(traceback.format_exc()) 

        # DATA Packet
        if fragment[0] == 68: # If fragment[0] is char 'D'
            packet = struct.unpack('<cchhhhhhhhh', fragment)
            
            arduino_checksum = packet[-1]
            checkSumState = calcDataChecksum(packet,arduino_checksum)
            if (checkSumState):   
                beetle_pos = 0 # Hand Beetle
                moving = packet[1]
                accx = packet[2]
                accy = packet[3]
                accz = packet[4]
                gyrox = packet[5]
                gyroy = packet[6]
                gyroz = packet[7]
                emg = packet[8] / 100.0

                if (moving == b'Y' and beetle_pos == 0):
                    moving_status = "Hand Moving"
                    moving_packet = 1
                    VERY_FIRST = False
                    POS_DATA_SENT = True

                    # Capture start of new dance move timestamp
                    if not START_MOVE and not START_MOVE_TIME:
                        START_MOVE = True
                        start_time = time.time()
                        START_MOVE_TIME = True

                    # Reset flag status that keeps track of dancer movement status
                    if not STOP_FIRST_BOOL:
                        STOP_FIRST_BOOL = True

                elif (moving == b'N' and beetle_pos == 0):
                    moving_status = "Hand Not Moving"
                    moving_packet = 0

                    # Reset flag status that keeps track of first move of each dance move
                    if START_MOVE:
                        START_MOVE = False
                    
                    # Keep track of time elapsed since dancer stops moving for position data sending
                    if STOP_FIRST_BOOL:
                        STOP_FIRST_TIME = time.time()
                        STOP_FIRST_BOOL = False
                        POS_DATA_SENT = False

                logger.info(moving_status)
    
                try:
                    # Send timestamp of new dance move to calculate sync delay
                    if START_MOVE and START_MOVE_TIME:
                        sync_delay_data = f"!{DANCER_ID},{start_time}\n"
                        SEND_BUFFER.append(sync_delay_data)
                        logger.info(f"START TIME SENT: {start_time}")
                        START_MOVE_TIME = False
                    
                    # Send dance move data when dancer is moving
                    if moving_packet == 1:
                        final_data = f"#{DANCER_ID},{beetle_pos},{gyrox},{gyroy},{gyroz},{accx},{accy},{accz},{emg},{moving_packet}\n"
                        SEND_BUFFER.append(final_data)
                    
                except Exception:
                    print(traceback.format_exc())       

            else:
                logger.error("Checksum Incorrect")
    
        # Position Packet
        elif fragment[0] == 80: # If fragment[0] is char 'P'
            packet = struct.unpack('<cclllhl', fragment)
            
            arduino_checksum = packet[-1]
            checkSumState = calcDataChecksum(packet,arduino_checksum)
            if (checkSumState):
                position = packet[1]
                if position == b'S':
                    position = "S"
                    POS_DETECTED = "S"
                    POS_DETECTED_BOOL = True
                elif position == b'L':
                    position = "L"
                    POS_DETECTED = "L"
                    POS_DETECTED_BOOL = True
                elif position == b'R':
                    position = "R"
                    POS_DETECTED = "R"
                    POS_DETECTED_BOOL = True
                else:
                    pass

            else:
                logger.error("Checksum Incorrect")

        else: 
            return

# Function to calculate checksum of received packets and compare with checksum calculated in the Beetle
def calcDataChecksum(data_packet,arduino_checksum):
    try:
        data_check = data_packet[0:len(data_packet)-1]
        checksum = ord(data_check[0]) 
        for i in range(1,len(data_check)):
            # Convert bytes to int type 
            if type(data_check[i]) == bytes:
                checksum ^= ord(data_check[i])
            else: 
                checksum ^= data_check[i] 

        # Received packet is the correct intended packet
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
            sock.connect(("localhost", 8888))
            
            try:
                idle_count = 0
                # Only receive data after handshaking process is completed
                if (HANDSHAKE_BOOL_DICT[self.beetle.addr]):
                    logger.info(f"Receiving data from {BEETLE_TYPE[self.beetle.addr]} Beetle...")
                    while True:
                        try:
                            # Congestion control of data to external comms
                            if len(SEND_BUFFER) >= 3:
                                    compiled_data = "".join(SEND_BUFFER)
                                    sock.sendall(compiled_data.encode())
                                    SEND_BUFFER = []
                            if self.beetle.waitForNotifications(2.0):
                                continue
                            idle_count += 1
                            logger.info(f"idle count: {idle_count}")
                            if idle_count == 1: # Beetle requires reset
                                break
                        except BTLEDisconnectError:
                            logger.error(f"BTLEDisconnect Error in Beetle {BEETLE_DICT[self.beetle.addr]}")
                            reconnectBeetle(self.beetle)
                            self.reset()
                            initHandshake(self.beetle,self.characteristics)
                            sock.close()
                            self.run()
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

    # Function to send 'R' char to beetle to initiate reset of beetle
    def reset(self):
        logger.info(f"Resetting Beetle {BEETLE_DICT[self.beetle.addr]}")
        self.characteristics.write(bytes(RESET,'utf-8'), withResponse = False)

# Function to carry out handshaking process between beetle and laptop
def initHandshake(beetle, characteristics):
    logger.info(f"Initializing Handshake Sequence with Beetle {BEETLE_DICT[beetle.addr]}")
    
    logger.info("Resetting Device")
    characteristics.write(bytes(RESET,'utf-8'), withResponse = False)

    ACK_BOOL_DICT[beetle.addr] = False

    sleep(1.0)
    
    handshake_attempts = 1
    try: 
        # Attempt up to 3 handshake attempts 
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

        # Reconnect to beetle if handshaking fails after 3 attempts
        if handshake_attempts > 3:
            logger.error(f"Handshake sequence with Beetle {BEETLE_DICT[beetle.addr]} failed. Reattempting handshake...")
            reconnectBeetle(beetle)
            initHandshake(beetle,characteristics)
    
    except Exception as e:
        logger.error(f"{e} Error handshaking with Beetle {BEETLE_DICT[beetle.addr]}")
        reconnectBeetle(beetle)
        initHandshake(beetle,characteristics)

# Function to reconnect laptop to beetle
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

# Function to establish peripheral connection with beetle
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

def main():
    scanner = Scanner().withDelegate(ScanDelegate())
    devices = scanner.scan(3.0)

    for discovered in devices:
        if discovered.addr in BEETLE_ALL:
            logger.info(f"Establishing connection with Beetle {BEETLE_DICT[discovered.addr]}")
            establish_connection(discovered.addr)


if __name__ == '__main__':
    main()