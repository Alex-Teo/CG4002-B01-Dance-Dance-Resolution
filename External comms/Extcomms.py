import logging
import os
import random
import sys
import threading  #needed to send date to testing server, 
import multiprocessing
import time
import traceback
import socket
import sys
import dancemoves
from queue import Queue


from twisted.internet import reactor  #with twisted library, handles everything including multiple connections
from twisted.internet.protocol import Factory
from twisted.protocols.basic import LineReceiver

from eval_client import ACTIONS, Client




sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

#logging setup
filehandler = logging.FileHandler(
    filename=f'logs/ultra96_{time.strftime("%H%M%S-%Y%m%d")}.log'
)
streamhandler = logging.StreamHandler(sys.stdout)
handlers = [filehandler, streamhandler]
logging.basicConfig(
    level=logging.INFO,
    format="[%(asctime)s] {%(filename)s:%(lineno)d} %(levelname)s - %(message)s",
    handlers=handlers,
)
logger = logging.getLogger("ultra96")



class LaptopSide(LineReceiver):
    """Once connected, send relevant data."""

    delimiter = b"\n"

    def __init__(self, persistent_data):
        self.persistent_data = persistent_data
        self.clearLineBuffer()

    def connectionMade(self):
        print("A New Dancer is on the Stage!")
        self.persistent_data.dancernumber += 1
        self.printDancerNumber()

    def connectionLost(self, reason):
        print("A Dancer has left the Stage!")
        self.persistent_data.dancernumber -= 1
        self.printDancerNumber()

    def printDancerNumber(self):
        print(
            "There are currently %d connected dancers."
            % self.persistent_data.dancernumber
        )
    def getFrequency(self):
        self.persistent_data.counter += 1
        if self.persistent_data.counter % 30 == 0:   #multiple of 30
            end_time = time.time()
            logger.info(
                "Receiving data at %f Hz"
                % (30 / (end_time - self.persistent_data.start_time))
            )
            self.persistent_data.start_time = end_time  #restarting the cycle

    def skipInitialReadings(self, dancer_id, data_type): #skip noisy data at the start to prevent false positive
        if self.persistent_data.skip_initial_readings_cnt[dancer_id][data_type] > 0:
            self.persistent_data.skip_initial_readings_cnt[dancer_id][data_type] -= 1
            return True
        return False    

    

            
        
    def lineReceived(self, line):  # line is data received

        try:
            line = line.decode()

            self.getFrequency()

            if line[0] != "#":
                logger.error("Received invalid data", line)
                return
            (
                dancer_id,
                data_type,
                #float(yaw),    #angle for these 3
                #float(pitch),
                #float(roll),
                gyrox,
                gyroy,
                gyroz,
                accx,
                accy,
                accz,
                emg,
                lapt_time,
            ) = line[1:].split(",")

            # appends data for each dancer to window
            dancer_id = int(dancer_id)    #add time stamp here, then - incoming data
            gyrox, gyroy, gyroz, accx, accy, accz, lapt_time= (
                #float(yaw),
                #float(pitch),
                #float(roll),
                float(gyrox),
                float(gyroy),
                float(gyroz),
                float(accx),
                float(accy),
                float(accz),
                float(lapt_time),
            )  
            if self.persistent_data.counter % 30 == 0:   #multiple of 30
                end_time = time.time()
                logger.info(
                    "at " + str(end_time) + " for Dancer " + str(dancer_id) + ", current sync delay is %f"
                    % (end_time - lapt_time)
                )
            print("Dancer ", dancer_id, data_type, gyrox, gyroy, gyroz, accx, accy, accz, emg, self.persistent_data.counter)  
        except Exception:
            print(traceback.format_exc())


    
    

    


class LaptopFactory(Factory):

    def __init__(self,):

        self.dancernumber = 0  #number of dancers currently connected
        self.skip_initial_readings_cnt = [[50, 50], [50, 50], [50, 50]]
        self.counter = 0
        self.start_time = time.time()
        self.is_idle = True


    #protocol = EchoClient

    def clientConnectionFailed(self, connector, reason):
        print("Connection failed - goodbye!")
        reactor.stop()

    def clientConnectionLost(self, connector, reason):
        print("Connection lost - goodbye!")
        reactor.stop()

    def buildProtocol(self, addr):
        return LaptopSide(self)

def format_results(positions, dance_moves, pos, sync_delay):
    new_positions = dancemoves.swap_positions(positions, pos)
    


if __name__ == "__main__":
    #logger.info("Started server on port %d" % DANCE_PORT)

    try:
        reactor.listenTCP(8000, LaptopFactory())
        thread = threading.Thread(target=reactor.run, args=(False,))
        thread.start()

        while True:
            pass
    except KeyboardInterrupt:
        thread.join()
        print("Terminating")


    






   


       