# External Communications

## Set Up Guide

- Install the required dependencies

  - `pip3 install -r requirements.txt`

- From laptop to ultra96, type this command
- ssh -L 8888:localhost:8888 -J _________ @sunfire.comp.nus.edu.sg xilinx@makerslab-fpga-01
- This is for the port forwarding, when running the laptop code on ultra96

- To run the ExtComms.py, you need to state the ip address and port you wish to connect to for the eval server.  For example:

  - 'IP_ADDRESS=localhost EVAL_PORT=5000 python3 Extcomms.py'

- Once prompted, press enter and wait for the other party to enter the secret key you chose


- To run the laptop code and connect to the ext comms code (Extcomms.py), make sure laptop code (simplelaptop.py) is connecting to the smae port number and local host.  Also state dancer id before typing command:

  - 'DANCER_ID=1 python3 simplelaptop.py'


- simplelaptop.py is a development version of the laptop.py code used for testing purposes.  For the actual laptop.py, please look at the Internal Comms folder for - the laptop.py which has a different command.



## File Descriptions

### Training Folder

| File                    | Description                                                                                   |
| ----------------------- | --------------------------------------------------------------------------------------------- |
| Extcomms.py      | Main External Communications file that receives data from laptop and sends data to evaluation server |
| eval_client.py   | Empty CSV files that are used to contain the generated training data for each dance move             |
| eval_server.py   | evaluation server code                                                                               |
| dancemoves.py    | Code that contains the possible position order changes                                               |
| simplelaptop.py  | Dummy laptop code that is run to test for ExtComms.py                                                |
| timesync.py      | code in charge of calculating sync delay between dancers                                             |
| requirements.txt | Records the External Comms folder environment's dependencies                                         |

## Important Notes

- To run ExtComms.py and connect to the evaluation server code (eval_server.py), make sure that the laptop.py is connecting to the same port number and host as the eval_server.py.
- Do remeber to tunnel when connecting the laptop.py code to ExtComms.py code on Ultra96

