#include <EEPROM.h>

const int SERIAL_NUMBER_ADDRESS = 1023;
// 2 = set 1 hand, 4 = set 2 hand, 6 = set 3 hand (emg one)
const byte SERIAL_NUMBER = 6;

void setup() {
  // dont do it if it has been done before
  if (EEPROM.read(SERIAL_NUMBER_ADDRESS) != SERIAL_NUMBER) {
    EEPROM.write(SERIAL_NUMBER_ADDRESS, SERIAL_NUMBER);
  }

}

void loop() {
  // put your main code here, to run repeatedly:

}
