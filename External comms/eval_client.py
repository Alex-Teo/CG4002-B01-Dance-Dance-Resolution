import os
import sys
import random
import time

import socket
import threading

import base64
import numpy as np
from tkinter import Label, Tk
import pandas as pd
from Crypto.Cipher import AES
from Crypto import Random

# Week 13 test: 8 moves, so 33 in total = (8*4) + 1 (logout)
#ACTIONS = ['mermaid', 'jamesbond', 'dab', 'window360', 'cowboy', 'scarecrow', 'pushback', 'snake']
# Week 9 and 11 tests: 3 moves, repeated 4 times each = 12 moves.
ACTIONS = ['mermaid', 'jamesbond', 'dab']  
POSITIONS = ['1 2 3', '3 2 1', '2 3 1', '3 1 2', '1 3 2', '2 1 3']
LOG_DIR = os.path.join(os.path.dirname(__file__), 'evaluation_logs')
NUM_MOVE_PER_ACTION = 4
N_TRANSITIONS = 6
MESSAGE_SIZE = 3 # position, 1 action, sync 

ENCRYPT_BLOCK_SIZE = 16
PADDING = ' '

class Client(threading.Thread):

    def __init__(self, ip_addr, port_num, group_id, secret_key): 
        super(Client, self).__init__()
  

        self.groupid = group_id 
        self.secret_key = secret_key
                                        #explanation not in order
        self.idx = 0                    #check if there is a connection, 
        self.timeout = 60              #and if the client sends to the server. 
        self.has_no_response = False    #If there is a timeout, the display will update to the next one.
        self.connection = None          # If logout, the display shut downs
        self.timer = None
        self.logout = False

        self.dancer_positions = ['1', '2', '3']


    # Create a TCP/IP socket and bind to port
        self.shutdown = threading.Event()
        self.socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        server_address = (ip_addr, port_num)

        print('Start connecting... server address: %s port: %s' % server_address, file=sys.stderr)
        self.socket.connect(server_address)
        print('Connected')


    # for encryption
    def add_padding(self, raw_message):
        pad = lambda s: s + (ENCRYPT_BLOCK_SIZE - (len(s) % ENCRYPT_BLOCK_SIZE)) * PADDING
        padded_plain_text = pad(raw_message)
        # print("[Evaluation Client] padded_plain_text length: ", len(padded_plain_text))
        return padded_plain_text


    #To encrypt the message, which is a string
    def encrypt_message(self, message):
        raw_message =  "#" + message
        print("raw_message: "+raw_message)
        padded_raw_message = self.add_padding(raw_message)
        print("padded_raw_message: " + padded_raw_message)
        iv = Random.new().read(AES.block_size)
        aes_key = bytes(str(self.secret_key), encoding="utf8")
        cipher = AES.new(aes_key, AES.MODE_CBC, iv)
        encrypted_message = base64.b64encode(iv + cipher.encrypt(bytes(padded_raw_message, "utf8")))
        print("[Evaluation Client] encrypted_message: ", encrypted_message)
        return encrypted_message

    #To send the message to the sever
    def send_message(self, message):
        encrypted_text = self.encrypt_message(message)
        print("[Evaluation Client] encrypted_text: ", encrypted_text)
        self.socket.sendall(encrypted_text)
    
    def receive_dancer_position(self):
        dancer_position = self.socket.recv(1024)
        msg = dancer_position.decode("utf8")
        return msg

    def stop(self):
        self.connection.close()
        self.shutdown.set()
        self.timer.cancel()







def main():
    if len(sys.argv) != 5:
        print('[Evaluation Client] Invalid number of arguments')
        print('python eval_client.py [IP address] [Port] [groupID] [secret key]')
        sys.exit()
    

    ip_addr = sys.argv[1]
    port_num = int(sys.argv[2])
    group_id = sys.argv[3]
    secret_key = sys.argv[4]

    my_client = Client(ip_addr, port_num, group_id, secret_key)
    time.sleep(30)

    count = 0        #basically time out count in seconds

    while count <= 60:
        if count == 0:
            my_client.send_message("1 2 3" + '|' + "start" + '|' + "1.5" + '|')   #dancer position, dance move, sync delay
        dancer_position = my_client.receive_dancer_position()
        print("dancer_position: " + dancer_position)
        my_client.send_message("1 2 3" + '|' + "mermaid" + '|' + "1.5" + '|')
        
        print("Received dancer postions: ", str(dancer_position))
        time.sleep(4)
        count += 1
        if count == 60:
            my_client.send_message(dancer_position + '|' + "logout" + '|' + "1.5" + '|')
            my_client.stop()

if __name__ == '__main__':
    main()
