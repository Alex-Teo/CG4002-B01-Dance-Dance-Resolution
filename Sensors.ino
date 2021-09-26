#include <Wire.h> //for I2C communication
#include<math.h>
#include <string.h>

//store raw data of accel and gyro
long accelX, accelY, accelZ;  
long gyroX, gyroY, gyroZ;

//calculate accel and gyro in degree and g
float gForceX, gForceY, gForceZ;
float rotX, rotY, rotZ;

void setup() {
  Serial.begin(115200);
  Wire.begin(); //initialise I2C communication
  setupMPU();
}

void loop() {
  initHandshake(); 
  recordAccelRegisters(); //pre-processing
  recordGyroRegisters();
  updateDance();
  updatePosition();
  delay(200);
}

//Establish communication with MPU and set up needed registers to read data from
void setupMPU() {
  Wire.beginTransmission(); //I2C address of MPU
  Wire.write(); //Power Management
  Wire.write(); //Power on MPU6050
  Wire.endTransmission();

  //Gyro configuration. 
  Wire.beginTransmission();
  Wire.write(); 
  Wire.write(); //Set gyro full scale to +/- 250deg/sec
  Wire.endTransmission();
  
  //Acc configuration. 
  Wire.beginTransmission(); 
  Wire.write(); 
  Wire.write(); //Set acc full scale range to +/- 2g
  Wire.endTransmission();
}

//retrieving accel raw data
void recordAccelRegisters() {
  Wire.beginTransmission(); //I2C address of MPU6050
  Wire.write(); //Starting register for accel readings.
  Wire.endTransmission();
  Wire.requestFrom( ,6);  //Request 6 accel registers

  while(Wire.available() < 6);
  accelX = Wire.read()<<8|Wire.read();  //Store first two bytes. accelXW is a long variable which can save 2 bytes. Wire.read() reads 1 byte each time. 
  accelY = Wire.read()<<8|Wire.read();  //Store middle two bytes
  accelZ = Wire.read()<<8|Wire.read();  //Store last two bytes
  
  //process Accel Data
  gForceX = accelX / 16384.0; //convert data to g. LSB per g = 16384.0 from the datasheet.
  gForceY = accelY / 16384.0; //MPU6050 has the range of +-2g.
  gForceZ = accelZ / 16384.0;
}

void recordGyroRegisters() {
  Wire.beginTransmission(); //I2C address of MPU6050
  Wire.write(); //Starting address for gyro readings 
  Wire.endTransmission();
  Wire.requestFrom( ,6);  //Request 6 gyro registers 

  while(Wire.available() < 6);
  gyroX = Wire.read()<<8|Wire.read();  //Store first two bytes.
  gyroY = Wire.read()<<8|Wire.read();  //Store middle two bytes 
  gyroZ = Wire.read()<<8|Wire.read();  //Store last two bytes 
  
  //process Gyro Data
  rotX = gyroX / 131.0; //convert data to degrees. LSB per degrees per second = 131.0 according to the datasheet.
  rotY = gyroY / 131.0; //range is 250 deg/s from datasheet.
  rotZ = gyroZ / 131.0;
}
