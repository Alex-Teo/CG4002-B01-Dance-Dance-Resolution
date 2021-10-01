import os
import socket
import time
import traceback

DANCER_ID = int(os.environ["DANCER_ID"])


class Laptop:
    def __init__(self):
        self.idx = 0

    def run(self):
        
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
            
            sock.connect(("localhost", 8000))    #previously localhost 8000 137.132.86.224 8888
            emg = 0
            laptop_time = time.time()
            while True:     #add time.now, timestamps code etc
                try:
                    line = f"#{DANCER_ID},1,1,1,1,1,1,1,{emg},{laptop_time}\n"
                    print(line)
                    sock.sendall(line.encode())
                    self.idx += 1
                    time.sleep(0.5)
                    emg += 1
                    laptop_time = time.time()
            
                except Exception:
                    print(traceback.format_exc())


if __name__ == "__main__":
    laptop = Laptop()
    laptop.run()
