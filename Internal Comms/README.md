# Internal Communications

## Set Up Guide

- Install the required dependencies

  - `pip3 install -r requirements.txt`

- Upload the bluno.ino code file onto the Bluno Beetle

- Execute this command on the terminal (In this case we take on the identity of dancer 1)
  - `sudo DANCER_ID=1 python3 laptop.py`

## File Descriptions

### Training Folder

| File                    | Description                                                                              |
| ----------------------- | ---------------------------------------------------------------------------------------- |
| laptop_training_data.py | Code file to generate and record training data from the dancers                          |
| CSV files               | Empty CSV files that are used to contain the generated training data for each dance move |

### bluno Folder

| File      | Description                                                                                              |
| --------- | -------------------------------------------------------------------------------------------------------- |
| bluno.ino | Main Bluno Beetle code that contains the integration of hardware sensor and internal communications code |

### Others

| File             | Description                                                                                                            |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------- |
| laptop.py        | Main laptop code that is run to establish connection and carry out data transmission with the Bluno Beetle and Ultra96 |
| requirements.txt | Records the Internal Comms folder environment's dependencies                                                           |

## Important Notes

- To run laptop.py and connect to the external communications code (Extcomms.py), make sure that the laptop.py is connecting to the same port number and host as the Extcomms.py.
- Do state the dancer ID accordingly before executing the laptop.py
- Before uploading the bluno.ino code to the beetle, run this code in the terminal to enable read and write permissions on the USB port:
  - `sudo chmod a+rw /dev/ttyACM0`
