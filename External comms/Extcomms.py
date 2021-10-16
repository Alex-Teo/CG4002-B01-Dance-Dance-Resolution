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
from scipy import stats
import pymongo
from pymongo import MongoClient
import ML.config as config


from twisted.internet import reactor  #with twisted library, handles everything including multiple connections
from twisted.internet.protocol import Factory
from twisted.protocols.basic import LineReceiver

from eval_client import ACTIONS, Client
from ML.NN_main import ML

IP_ADDRESS = os.environ["IP_ADDRESS"]
EVAL_PORT = int(os.environ["EVAL_PORT"])


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

client = MongoClient(

    "mongodb://172.31.23.100:2717/data"
)

db = client
data = db.data



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
            self.persistent_data.start_time = end_time  #restarting the cycle   taking 20 Hz

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
                #float(yaw),    #angle for these 3  keep here for now, can delete later
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

            data_type = int(data_type)


            raw_data = {
                "userID": str(dancer_id),
                "aX": str(accx),
                "aY": str(accy),
                "aZ": str(accz),
                "gX": str(gyrox),
                "gY": str(gyroy),
                "gZ": str(gyroz),
                "emg": str(emg),
            }

            if dancer_id == 1:
                if data_type == 0:
                    data.d1_raw_hand_datas.insert(raw_data)
                ##elif data_type == 1:
                ##    data.d1_raw_chest_datas(raw_data)
            elif dancer_id == 2:
                if data_type == 0:
                    data.d2_raw_hand_datas.insert(raw_data)
                #elif data_type == 1:
                #    data.d2_raw_chest_datas.insert(raw_data)
            elif dancer_id == 3:
                if data_type == 0:
                    data.d3_raw_hand_datas.insert(raw_data)
                #elif data_type == 1:
                #    data.d3_raw_chest_datas.insert(raw_data)




            if self.skipInitialReadings(dancer_id, data_type): #throw away initial data, akin to scale zeroing
                return
            
            #if self.persistent_data.is_idle:     #movement start flag        can just leave here for now, can delete later see how
            #    if self.persistent_data.counter % 100 == 0:
            #        print("idling")
            #    if abs(gyrox) >= 1 or abs(gyroz) >= 1:   #both originally 50, 1 for dummy testing purposes
            #        self.persistent_data.init_counter -= 1
            #        if self.persistent_data.init_counter == 0:
            #            self.persistent_data.is_idle = False
            #            print("starting")
            #    return
            if data_type == 0:
                self.persistent_data.mlclass.write_data(
                    dancer_id,
                    [gyrox, gyroy, gyroz, accx, accy, accz],
                    
                )
            
            self.handleMainLogic(dancer_id)

        
        
        except Exception:
            logger.error(line)
            print(traceback.format_exc())

    def handleMainLogic(self, dancer_id):  #receive ai prediction data
        pred = self.persistent_data.mlclass.predict_single_row(config.MODEL_PATH)  #give me predictions, if none give me none
        if pred is not None:
            logger.info(pred)
            dance_moves = pred
            mqueue.put((dance_moves))
            self.clearLineBuffer()


    
    

    


class LaptopFactory(Factory):

    def __init__(self,):

        self.dancernumber = 0  #number of dancers currently connected
        self.skip_initial_readings_cnt = [[50, 50], [50, 50], [50, 50]]
        self.counter = 0
        self.init_counter = 24
        self.start_time = time.time()
        self.is_idle = True
        self.mlclass = ML()


    #protocol = EchoClient

    def clientConnectionFailed(self, connector, reason):
        print("Connection failed - goodbye!")
        reactor.stop()

    def clientConnectionLost(self, connector, reason):
        print("Connection lost - goodbye!")
        reactor.stop()

    def buildProtocol(self, addr):
        return LaptopSide(self)

def format_results(dance_moves): #, positions, pos, sync_delay):
    #new_positions = dancemoves.swap_positions(positions, pos)
    eval_results = f"1 2 3|{dance_move}|1.2|"
    dashboard_results = {"predictedDance": dance_moves}  #will update later depending on how you set schema amir
    #dashboard_results = f"{positions[0]} {positions[1]} {positions[2]}|{dance_move}|{new_positions[0]} {new_positions[1]} {new_positions[2]}|{sync_delay}|{accuracy}"

    return eval_results, dashboard_results
    


if __name__ == "__main__":
    #logger.info("Started server on port %d" % DANCE_PORT)


    
    #mqueue = Queue() #to communicate with thread
    try:
        reactor.listenTCP(8000, LaptopFactory())
        thread = threading.Thread(target=reactor.run, args=(False,))
        thread.start()

        mqueue = Queue() #to communicate with thread

        input("Press any input to start evaluation server")  #press enter

        group_id = "B01"
        secret_key = "1234123412341234"
        my_client = Client(IP_ADDRESS, EVAL_PORT, group_id, secret_key) #IP_ADDRESS = 137.132.92.127, EVAL_PORT = 5000
        my_client.send_message("1 2 3" + "|" + "start" + "|" + "1.5" + "|")
        #logger.info(f"received positions: {positions}")
        counter = 1
        
        start_time = time.time()
        while True:
            current_time = time.time()
            if (current_time - start_time >=0.3) and not mqueue.empty():  #get data, do formating, send data to client server for evaluation
                #dance_moves = mqueue.get()
                #dance_move = stats.mode(dance_moves)[0][0]
                temp_move = list(mqueue.queue)
                dance_movefake = stats.mode(temp_move)[0][0]
                dashboard_results = {"predictedDance" : dance_movefake}
                data.processed_datas.insert(dashboard_results)
                start_time = current_time

            if mqueue.qsize() >= 10:   #should we lower a bit see how?
                dance_moves = list(mqueue.queue)
                dance_move = stats.mode(dance_moves)[0][0]

                #if counter == 33:    #next update or so need to settle logout move
                #    dance_move = "logout"
                #elif counter < 33 and dance_move == "logout":
                #    dance_move = random.choice(ACTIONS)

                logger.info(f"predictions: {(dance_move)}")
                eval_results, dashboard_results = format_results(
                    dance_move
                )

                logger.info(f"eval_results: {eval_results}")
                logger.info(f"dashboard_results: {dashboard_results}")

                data.processed_datas.insert(dashboard_results)

                my_client.send_message(eval_results)
                positions = my_client.receive_dancer_position()
                positions = [int(position) for position in positions.split(" ")]
                logger.info(f"received positions: {positions}")
                counter += 1

        

    #except Exception as e:  for testing
    except KeyboardInterrupt:
        logger.info(e)
        thread.join()
        print("Terminating")


    






   


       