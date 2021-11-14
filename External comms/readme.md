- Hello this is external communications

- First please install the required librarires in requirements.txt.  You can use pip3 install to do it.


- From laptop to ultra96, type this command
- ssh -L 8888:localhost:8888 -J _________ @sunfire.comp.nus.edu.sg xilinx@makerslab-fpga-01
- This is for the port forwarding, when running the laptop code on ultra96

- To run the ExtComms.py, you need to state the ip address and port you wish to connect to for the eval server.  For example:

  - 'IP_ADDRESS=localhost EVAL_PORT=5000 python3 Extcomms.py'

- Once prompted, press enter and wait for the other party to enter the secret key you chose


- to run the laptop code and connect to the ext comms code (Extcomms.py), make sure laptop code (simplelaptop.py) is connecting to the smae port number and local host.  Also state dancer id before typing command:

  - 'DANCER_ID=1 python3 simplelaptop.py'


- simplelaptop.py is a development version of the laptop.py code used for testing purposes.  For the actual laptop.py, please look at the Internal Comms fodler for - the laptop.py which has a different command.
