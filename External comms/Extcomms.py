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
import timesync as sync


from twisted.internet import reactor  #with twisted library, handles everything including multiple connections
from twisted.internet.protocol import Factory
from twisted.protocols.basic import LineReceiver

from eval_client import ACTIONS, Client
from ML.NN_main import ML

IP_ADDRESS = os.environ["IP_ADDRESS"]
EVAL_PORT = int(os.environ["EVAL_PORT"])

TIMESTAMP_DICT = {"Dancer 1": 0, "Dancer 2": 0, "Dancer 3": 0}
TIMESTAMP_BOOL_DICT = {"Dancer 1": False, "Dancer 2": False, "Dancer 3": False}

POSITION_DICT = {"Dancer 1": "S", "Dancer 2": "S", "Dancer 3": "S"}
POSITION_BOOL_DICT = {"Dancer 1": False, "Dancer 2": False, "Dancer 3": False}

dancer1list = []
dancer2list = []
dancer3list = []

dashboardlist = []



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

    "mongodb://172.31.20.67:2717/data"
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
        if self.persistent_data.skip_initial_readings_cnt[dancer_id-1][data_type] > 0:
            self.persistent_data.skip_initial_readings_cnt[dancer_id-1][data_type] -= 1
            return True
        return False    

    

            
        
    def lineReceived(self, line):  # line is data received
        global dancer1list
        global dancer2list
        global dancer3list
        #global begin_time

        try:
            line = line.decode()

            self.getFrequency()

            if line[0] == "#":  # add case for dummy data
                #logger.error("Received invalid data", line)
                #return
                (
                    dancer_id,
                    data_type,
                    gyrox,
                    gyroy,
                    gyroz,
                    accx,
                    accy,
                    accz,
                    emg,
                    moving,
                ) = line[1:].split(",")

                # appends data for each dancer to window
                dancer_id = int(dancer_id)    #add time stamp here, then - incoming data
                gyrox, gyroy, gyroz, accx, accy, accz= (
                    float(gyrox),
                    float(gyroy),
                    float(gyroz),
                    float(accx),
                    float(accy),
                    float(accz),
                )  

                

                data_type = int(data_type)
                moving  = int(moving)
                emg = float(emg)

                raw_data = {
                    "userID": str(dancer_id),
                    "aX": str(accx),
                    "aY": str(accy),
                    "aZ": str(accz),
                    "gX": str(gyrox),
                    "gY": str(gyroy),
                    "gZ": str(gyroz),
                    
                }
                

                emgdata = {"emgMean": str(emg)}
                if self.persistent_data.counter % 20 == 0:
                    self.persistent_data.counter += 1
                    if dancer_id == 1:
                        if data_type == 0:
                            data.d1_raw_hand_datas.insert(raw_data)
                    elif dancer_id == 2:
                        if data_type == 0:
                            data.d2_raw_hand_datas.insert(raw_data)
                    elif dancer_id == 3:
                        if data_type == 0:
                            data.d3_raw_hand_datas.insert(raw_data)

                    if emg != 0.0:
                        data.emg_datas.insert(emgdata)

                if self.skipInitialReadings(dancer_id, data_type): #throw away initial data, akin to scale zeroing
                    return     
                
                if data_type == 0 and moving == 1:
                    
                    if dancer_id == 1 and (POSITION_BOOL_DICT["Dancer 1"] == True):
                        self.persistent_data.Dancer1mlclass.write_data(
                            dancer_id,
                            [gyrox, gyroy, gyroz, accx, accy, accz],
                        )
                    elif dancer_id == 2 and (POSITION_BOOL_DICT["Dancer 2"] == True):
                        self.persistent_data.Dancer2mlclass.write_data(
                            dancer_id,
                            [gyrox, gyroy, gyroz, accx, accy, accz],
                        )
                    elif dancer_id == 3 and (POSITION_BOOL_DICT["Dancer 3"] == True):
                        self.persistent_data.Dancer3mlclass.write_data(
                            dancer_id,
                            [gyrox, gyroy, gyroz, accx, accy, accz],
                        )
                
                self.handleMainLogic(dancer_id)

            elif line[0] == "!":
                (
                dancer_id,
                starttime,
                ) = line[1:].split(",")
                dancer_id = int(dancer_id)   
                starttime = float(starttime)
                if (dancer_id == 1) and TIMESTAMP_BOOL_DICT["Dancer 1"] == False:
                    TIMESTAMP_DICT["Dancer 1"] = starttime
                    TIMESTAMP_BOOL_DICT["Dancer 1"] = True
                elif dancer_id == 2 and TIMESTAMP_BOOL_DICT["Dancer 2"] == False:
                    TIMESTAMP_DICT["Dancer 2"] = starttime
                    TIMESTAMP_BOOL_DICT["Dancer 2"] = True
                elif dancer_id == 3 and TIMESTAMP_BOOL_DICT["Dancer 3"] == False:
                    TIMESTAMP_DICT["Dancer 3"] = starttime
                    TIMESTAMP_BOOL_DICT["Dancer 3"] = True

            elif line[0] == "$":
                (
                dancer_id,
                newPosition,
                ) = line[1:].split(",")
                dancer_id = int(dancer_id)
                newPosition = str(newPosition)
                if dancer_id == 1 and POSITION_BOOL_DICT["Dancer 1"] == False:
                    POSITION_DICT["Dancer 1"] = newPosition
                    POSITION_BOOL_DICT["Dancer 1"] = True
                    dancer1list.clear()
                    
                elif dancer_id == 2 and POSITION_BOOL_DICT["Dancer 2"] == False:
                    POSITION_DICT["Dancer 2"] = newPosition
                    POSITION_BOOL_DICT["Dancer 2"] = True
                    dancer2list.clear()

                elif dancer_id == 3 and POSITION_BOOL_DICT["Dancer 3"] == False:
                    POSITION_DICT["Dancer 3"] = newPosition
                    POSITION_BOOL_DICT["Dancer 3"] = True
                    dancer3list.clear()

                print("Dancer ", dancer_id, "NEW POSITION ", newPosition)

            else:
                logger.error("Received invalid data", line)
                return
            
        
        
        except Exception:
            logger.error(line)
            print(traceback.format_exc())

    def handleMainLogic(self, dancer_id):  #receive ai prediction data
        
        global dancer1list
        global dancer2list
        global dancer3list

        if dancer_id ==1:
            pred1 = self.persistent_data.Dancer1mlclass.predict(dancer1list)  #give me predictions, if none give me none
            #print(pred1)
            if pred1 is not None:
                logger.info(pred1)
                mqueue.put((pred1))
                dancer1list.clear()
                self.clearLineBuffer()
            
        elif dancer_id ==2:
            pred2 = self.persistent_data.Dancer2mlclass.predict(dancer2list)  #give me predictions, if none give me none
        
            if pred2 is not None:
                logger.info(pred2)
                mqueue.put((pred2))
                dancer2list.clear()
                self.clearLineBuffer()

        elif dancer_id ==3:
            pred3 = self.persistent_data.Dancer3mlclass.predict(dancer3list)  #give me predictions, if none give me none
            if pred3 is not None:
                logger.info(pred3)
                mqueue.put((pred3))
                dancer3list.clear()
                self.clearLineBuffer()

class LaptopFactory(Factory):

    def __init__(self,):

        self.dancernumber = 0  #number of dancers currently connected
        self.skip_initial_readings_cnt = [[50, 50], [50, 50], [50, 50]]
        self.counter = 0
        self.init_counter = 24
        self.start_time = time.time()
        self.is_idle = True
        self.Dancer1mlclass = ML()
        self.Dancer2mlclass = ML()
        self.Dancer3mlclass = ML()

    #protocol = EchoClient

    def clientConnectionFailed(self, connector, reason):
        print("Connection failed - goodbye!")
        reactor.stop()

    def clientConnectionLost(self, connector, reason):
        print("Connection lost - goodbye!")
        reactor.stop()

    def buildProtocol(self, addr):
        return LaptopSide(self)

def format_results(positions, dance_moves, dance_move, pos, sync_delay): 
    new_positions = dancemoves.swap_positions(positions, pos)
    eval_results = f"{new_positions[0]} {new_positions[1]} {new_positions[2]}|{dance_move}|{sync_delay}|"
    if len(dance_moves) == 3:
        dashboard_results = {"predictedDance1": dance_moves[0],
                         "predictedDance2": dance_moves[1],
                         "predictedDance3": dance_moves[2],
                         "predictedPos": f"{new_positions[0]}|{new_positions[1]}|{new_positions[2]}",
                         "syncDelay" : str(sync_delay)}  
    elif len(dance_moves) == 2:
        dashboard_results = {"predictedDance1": dance_moves[0],
                         "predictedDance2": dance_moves[1],
                         "predictedDance3": dance_moves[1],
                         "predictedPos": f"{new_positions[0]}|{new_positions[1]}|{new_positions[2]}",
                         "syncDelay" : str(sync_delay)} 
    
    elif len(dance_moves) == 1:
        dashboard_results = {"predictedDance1": dance_moves[0],
                         "predictedDance2": dance_moves[0],
                         "predictedDance3": dance_moves[0],
                         "predictedPos": f"{new_positions[0]}|{new_positions[1]}|{new_positions[2]}",
                         "syncDelay" : str(sync_delay)}  
    

    return eval_results, dashboard_results
    


if __name__ == "__main__":
    #logger.info("Started server on port %d" % DANCE_PORT)
    
    dashboarddata = {"predictedDance1": 'inactive', "predictedDance2": 'inactive', "predictedDance3": 'inactive', "predictedPos": "1|2|3", "syncDelay" : str(0)}
    
    
    positions = [1, 2, 3]
    pos = ["S", "S", "S"]
    sync_delay = 0
    try:
        reactor.listenTCP(8888, LaptopFactory())
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
        
        begin_time = time.time()
       
        while True:
            current_time = time.time()
            if counter == 1:
                if (mqueue.qsize() >= 3) or ((mqueue.qsize() <= 2 and mqueue.qsize() > 0) and (time.time() - begin_time >= 85.0)):   #should we lower a bit see how?
                    logger.info("bigger than 121")
                    dance_moves = list(mqueue.queue) #dance_moves1, 2,3
                    dance_move = stats.mode(dance_moves)[0][0]

                    if (POSITION_BOOL_DICT["Dancer 1"] == True):
                        pos[0] = POSITION_DICT["Dancer 1"]
                    if (POSITION_BOOL_DICT["Dancer 2"] == True):
                        pos[1] = POSITION_DICT["Dancer 2"]
                    if (POSITION_BOOL_DICT["Dancer 3"] == True):
                        pos[2] = POSITION_DICT["Dancer 3"]

                    POSITION_BOOL_DICT["Dancer 1"] = False
                    POSITION_BOOL_DICT["Dancer 2"] = False
                    POSITION_BOOL_DICT["Dancer 3"] = False

                    if (TIMESTAMP_BOOL_DICT["Dancer 1"] == True) and (TIMESTAMP_BOOL_DICT["Dancer 2"] == True) and (TIMESTAMP_BOOL_DICT["Dancer 3"] == True):
                        sync_delay = sync.calculate_sync_delay(TIMESTAMP_DICT["Dancer 1"], TIMESTAMP_DICT["Dancer 2"], TIMESTAMP_DICT["Dancer 3"])
                        
                    TIMESTAMP_BOOL_DICT["Dancer 1"] = False
                    TIMESTAMP_BOOL_DICT["Dancer 2"] = False
                    TIMESTAMP_BOOL_DICT["Dancer 3"] = False
                    logger.info(f"predictions: {(sync_delay)}")

                    logger.info(f"predictions: {(dance_move)}")
                    eval_results, dashboard_results = format_results(
                        positions, dance_moves, dance_move, pos, sync_delay
                    )

                    logger.info(f"eval_results: {eval_results}")
                    logger.info(f"dashboard_results: {dashboard_results}")

                    data.processed_datas.insert(dashboard_results)
                    
                    my_client.send_message(eval_results)
                    positions = my_client.receive_dancer_position()
                    positions = [int(position) for position in positions.split(" ")]
                    logger.info(f"received positions: {positions}")
                    begin_time = time.time()
                    counter += 1
                    dancer1list.clear()
                    dancer2list.clear()
                    dancer3list.clear()
                    mqueue.queue.clear()

            elif counter > 1:
                if (mqueue.qsize() >= 3) or ((mqueue.qsize() <= 2) and (time.time() - begin_time >= 44.0)):   #should we lower a bit see how?
                    dance_moves = list(mqueue.queue) #dance_moves1, 2,3
                    dance_move = stats.mode(dance_moves)[0][0]
                    
    
                    if (POSITION_BOOL_DICT["Dancer 1"] == True):
                        pos[0] = POSITION_DICT["Dancer 1"]
                    if (POSITION_BOOL_DICT["Dancer 2"] == True):
                        pos[1] = POSITION_DICT["Dancer 2"]
                    if (POSITION_BOOL_DICT["Dancer 3"] == True):
                        pos[2] = POSITION_DICT["Dancer 3"]
                    POSITION_BOOL_DICT["Dancer 1"] = False
                    POSITION_BOOL_DICT["Dancer 2"] = False
                    POSITION_BOOL_DICT["Dancer 3"] = False

                    if (TIMESTAMP_BOOL_DICT["Dancer 1"] == True) and (TIMESTAMP_BOOL_DICT["Dancer 2"] == True) and (TIMESTAMP_BOOL_DICT["Dancer 3"] == True):
                        sync_delay = sync.calculate_sync_delay(TIMESTAMP_DICT["Dancer 1"], TIMESTAMP_DICT["Dancer 2"], TIMESTAMP_DICT["Dancer 3"])
                    
                    TIMESTAMP_BOOL_DICT["Dancer 1"] = False
                    TIMESTAMP_BOOL_DICT["Dancer 2"] = False
                    TIMESTAMP_BOOL_DICT["Dancer 3"] = False
                    logger.info(f"predictions: {(sync_delay)}")

                    logger.info(f"predictions: {(dance_move)}")
                    eval_results, dashboard_results = format_results(
                        positions, dance_moves, dance_move, pos, sync_delay
                    )
                    logger.info(f"eval_results: {eval_results}")
                    logger.info(f"dashboard_results: {dashboard_results}")
                    data.processed_datas.insert(dashboard_results)

                    my_client.send_message(eval_results)
                    positions = my_client.receive_dancer_position()
                    positions = [int(position) for position in positions.split(" ")]
                    logger.info(f"received positions: {positions}")
                    begin_time = time.time()
                    counter += 1
                    dancer1list.clear()
                    dancer2list.clear()
                    dancer3list.clear()
                    mqueue.queue.clear()

        

    #except Exception as e:  for testing
    except KeyboardInterrupt:
        logger.info(e)
        thread.join()
        print("Terminating")


    



