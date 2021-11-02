#include <Wire.h> //for I2C communication
#include "I2Cdev.h"
#include "MPU6050.h"
#include <math.h>
#include <string.h>
#include <EEPROM.h>

//for offset
const int SERIAL_NUMBER_ADDRESS = 1023;
byte serialNo;
int ID;

//addresses according to datasheet
#define I2C_ADDR 0x68 //I2C address of MPU
#define PWR_MGMT 0x6B //Power Management
#define ACCEL_CONFIG 0x1C
#define GYRO_CONFIG 0x1B
#define ACCEL_OUT 0x3B //Starting register for accel readings
#define GYRO_OUT 0x43 //Starting address for gyro readings 

MPU6050 mpu;

#define SAMPLES 5

float preAX = 0;
float preAY = 0;
float preAZ = 16384;

int aCount = 0;
int gCount = 0;
long accelXDiff[SAMPLES];
long accelYDiff[SAMPLES];
long accelZDiff[SAMPLES];
long accelXDiffSum = 0;
long accelYDiffSum = 0;
long accelZDiffSum = 0;
long gyroXSum = 0;
long gyroYSum = 0;
long gyroZSum = 0;
float gyroXAvg = 0;
float gyroYAvg = 0;
float gyroZAvg = 0;
boolean dancing = false;

//store raw data of accel and gyro
int accelX, accelY, accelZ;  
int gyroX, gyroY, gyroZ;

//calculate accel and gyro in g and degree units
float gForceX, gForceY, gForceZ;
float rotX, rotY, rotZ;

//detect positions from 3 dancers
bool positionDetected = false;
bool startDancingAfterShift = false;
int lMoveCnt = 0;
int rMoveCnt = 0;
unsigned long tPosition;

void setup() {
  Serial.begin(115200);
  Wire.begin(); //initialise I2C comm
  serialNo = EEPROM.read(SERIAL_NUMBER_ADDRESS);
  ID = int(serialNo);
  setupMPU();
}

void loop() {
//  initHandshake(); 
  processAccelData(); //pre-processing for accel data
  processGyroData(); //pre-processing for gyro data
  detectPosition();
  delay(200);
}

//Set up registers to read data
void setupMPU() {
  mpu.initialize();
  if (!mpu.testConnection()) {
    Serial.println(F("!MPU6050 connection failed"));
  }
  
  Wire.beginTransmission(I2C_ADDR); //I2C address of MPU according to datasheet
  Wire.write(PWR_MGMT); //Power Management according to datasheet
  Wire.write(0b00000000); //Power on MPU6050 according to datasheet
  Wire.endTransmission();

  //Accel 
  Wire.beginTransmission(I2C_ADDR); //I2C address 
  Wire.write(ACCEL_CONFIG); 
  Wire.write(0b00000000); //Set accel full scale range to +/- 2g
  Wire.endTransmission();
  
  //Gyro 
  Wire.beginTransmission(I2C_ADDR); //I2C address
  Wire.write(GYRO_CONFIG); 
  Wire.write(0x00000000); //Set gyro full scale to +/- 250deg/sec
  Wire.endTransmission();

  setOffsetValues();
}

void setOffsetValues() {
  if (ID == 1) { // C1
    mpu.setXAccelOffset(-2203);
    mpu.setYAccelOffset(-211);
    mpu.setZAccelOffset(1198);

    mpu.setXGyroOffset(604);
    mpu.setYGyroOffset(792);
    mpu.setZGyroOffset(4);
  }else if (ID == 2) { // H1
    mpu.setXAccelOffset(-1088);
    mpu.setYAccelOffset(1678);
    mpu.setZAccelOffset(1593);

    mpu.setXGyroOffset(-82);
    mpu.setYGyroOffset(-18);
    mpu.setZGyroOffset(68);
  } else if (ID == 3) { // C2
    mpu.setXAccelOffset(-4415);
    mpu.setYAccelOffset(400);
    mpu.setZAccelOffset(969);

    mpu.setXGyroOffset(47);
    mpu.setYGyroOffset(-32);
    mpu.setZGyroOffset(-2);
  } else if (ID == 4) { // H2
    mpu.setXAccelOffset(-2970);
    mpu.setYAccelOffset(3988);
    mpu.setZAccelOffset(1568);

    mpu.setXGyroOffset(57);
    mpu.setYGyroOffset(121);
    mpu.setZGyroOffset(-64);
  } else if (ID == 5) { // C3
    mpu.setXAccelOffset(-310);
    mpu.setYAccelOffset(1716);
    mpu.setZAccelOffset(773);

    mpu.setXGyroOffset(119);
    mpu.setYGyroOffset(21);
    mpu.setZGyroOffset(-33);
  } else if (ID == 6) { // H3
    mpu.setXAccelOffset(1244);
    mpu.setYAccelOffset(79);
    mpu.setZAccelOffset(849);

    mpu.setXGyroOffset(110);
    mpu.setYGyroOffset(138);
    mpu.setZGyroOffset(33);
  }
}

void clearGyroSum() {
  gyroXSum = 0;
  gyroYSum = 0;
  gyroZSum = 0;
  gyroXAvg = 0;
  gyroYAvg = 0;
  gyroZAvg = 0;
  gCount = 0;
}

//retrieving accel raw data
void processAccelData() {
  Wire.beginTransmission(I2C_ADDR); //I2C address
  Wire.write(ACCEL_OUT);
  Wire.endTransmission();
  Wire.requestFrom(I2C_ADDR,6);  //Request 6 (3B - 40) accel registers

  while(Wire.available() < 6); 
  mpu.getAcceleration(&accelX, &accelY, &accelZ);
  
  //noise removal
  if (abs(accelX) < 24576 && abs(accelY) < 24576 && abs(accelZ) < 24576) {
    accelXDiff[aCount] = accelX - preAX;
    accelYDiff[aCount] = accelY - preAY;
    accelZDiff[aCount] = accelZ - preAZ;
    preAX = accelX;
    preAY = accelY;
    preAZ = accelZ;
    
    aCount += 1;

    //thresholding
    if (aCount >= 5) {
      for (int i = 0; i < SAMPLES; i++) {
        accelXDiffSum += abs(accelXDiff[i]);
        accelYDiffSum += abs(accelYDiff[i]);
        accelZDiffSum += abs(accelZDiff[i]);
      }
      
      if (accelXDiffSum >= 10000 || accelYDiffSum >= 10000 || accelZDiffSum >= 10000) {
        dancing = true;
        Serial.println("dancing!");
        Serial.print("gyroYAvg value: ");
        Serial.println(gyroYAvg);
      } else {
        dancing = false;
        Serial.println("not dancing!");
      }
      aCount = 0;
      accelXDiffSum = 0;
      accelYDiffSum = 0;
      accelZDiffSum = 0;
    }
  }

  //process the dancing data
  if (dancing) {
    //process Accel Data
    //convert data to g. LSB per g = 16384.0 from the datasheet.
    //MPU6050 has the range of +-2g.
    gForceX = accelX / 16384.0; 
    gForceY = accelY / 16384.0; 
    gForceZ = accelZ / 16384.0;
  } else { //process the walking/stop data
    gForceX = accelX / 16384.0; 
    gForceY = accelY / 16384.0; 
    gForceZ = accelZ / 16384.0;
  }
  
}

void processGyroData() {
  Wire.beginTransmission(I2C_ADDR); //I2C address
  Wire.write(GYRO_OUT); 
  Wire.endTransmission();
  Wire.requestFrom(I2C_ADDR,6);  //Request 6 (43 - 48) gyro registers 

  while(Wire.available() < 6);
  mpu.getRotation(&gyroX, &gyroY, &gyroZ);

  //process the walking/stop data
  if (!dancing) {
    gyroXSum += gyroX;
    gyroYSum += gyroY;
    gyroZSum += gyroZ;

    gCount += 1;

    gyroXAvg = gyroXSum / (gCount * 1.0);
    gyroYAvg = gyroYSum / (gCount * 1.0);
    gyroZAvg = gyroZSum / (gCount * 1.0);
    
    //process Gyro Data
    //convert data to degrees. 
    //LSB per degrees per second = 131.0 according to the datasheet.
    //range is 250 deg/s from datasheet.
    rotX = gyroX / 131.0; 
    rotY = gyroY / 131.0; 
    rotZ = gyroZ / 131.0;

  } else {
    //process the dancing data
    rotX = gyroX / 131.0; 
    rotY = gyroY / 131.0; 
    rotZ = gyroZ / 131.0;

  }
}

void detectPosition() {
    if (!dancing) {
      //alreagy detect the new position
      if (positionDetected) {
        return;
      }

      Serial.print("gyroYAvg value: ");
      Serial.println(gyroYAvg);
      if (gyroYAvg > 1600) {
        rMoveCnt += 1;
      }
      if (gyroYAvg < -1500) {
        lMoveCnt += 1;
      }

      if (lMoveCnt > 5) {
        lMoveCnt = 0;
        rMoveCnt = 0;
        positionDetected = true;
        tPosition = millis();
        //state = STATE_L;
        Serial.println("Left Position!");

        clearGyroSum();
      }

      if (rMoveCnt > 5) {
        lMoveCnt = 0;
        rMoveCnt = 0;
        positionDetected = true;
        tPosition = millis();
        //state = STATE_R;
        Serial.println("Right Position!");

        clearGyroSum();
      }

      startDancingAfterShift = true;
    } else { //dancing
      if (startDancingAfterShift) {
        positionDetected = false;
        //update the previous state variable
        //preState = State;
        //state = STATE_S;
        Serial.println("Stay!");

        clearGyroSum();

        startDancingAfterShift = false;

        if (millis() - tPosition < 800) {
          //preSTATE = STATE_S;
        }
        lMoveCnt = 0;
        rMoveCnt = 0;
      }
    }
}
