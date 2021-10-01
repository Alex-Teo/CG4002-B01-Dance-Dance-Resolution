hello this is external comms


From laptop to ultra96, type this command
ssh -L 8888:localhost:8888 -J alex-teo@sunfire.comp.nus.edu.sg xilinx@makerslab-fpga-01
password will for sunfire will be sent separately, the 2nd one is xilinx.  This is for the port forwarding, when accessing and running the ext comms code on ultra96


to run the laptop code and connect to the ext comms code (Extcomms.py), make sure laptop code (simplelaptop.py) is connecting to the smae port number and local host.  Also state dancer id before typing command:

DANCER_ID=1 python3 simplelaptop.py
