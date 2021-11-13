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
#define EMG_SAMPLES 35 //No. of sample in the window period
#define DATA_THRESHOLD 50
#define POSITION_THRESHOLD 100

unsigned long start;

float preAX = 0;
float preAY = 0;
float preAZ = 16384;

int dancing_count = 0;
int idling_count = 0;
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
bool dancing = false;
bool idling = true;

//Turning
long gyroXSumT = 0;
long gyroYSumT = 0;
long gyroZSumT = 0;
long gyroXAvgT = 0;
long gyroYAvgT = 0;
long gyroZAvgT = 0;
int gCountT = 0;
int gyroXT, gyroYT, gyroZT;
bool firstClear = false;
bool veryFirst = true;

//emg data
double totalValue = 0; 
double squareValue = 0;
float meanAmplitude = 0;
int scaledMeanAmplitude = 0;

//store raw data of accel and gyro
int accelX, accelY, accelZ;  
int gyroX, gyroY, gyroZ;

//calculate accel and gyro in g and degree units
float gForceX, gForceY, gForceZ;
float rotX, rotY, rotZ;

//scaled accel and gyro values
int scaledgForceX, scaledgForceY, scaledgForceZ;
int scaledRotX, scaledRotY, scaledRotZ;

//detect positions from 3 dancers
bool positionDetected = false;
bool positionDataSent = false;
bool startDancingAfterShift = false;
int lMoveCnt = 0;
int rMoveCnt = 0;
int sMoveCnt = 0;
char newPosition;
unsigned long stopTime;
bool firstStop = false;
unsigned long elapsedTime;

bool handshake_completed = false;
unsigned long current_time;
unsigned long previous_dpacket_time = 0;
unsigned long previous_ppacket_time = 0;

// Function to reset beetle
void(* resetFunc) (void) = 0;

// Define IMU packet format
struct IMU_Packet {
  char type;
  char moving;
  int accx;
  int accy;
  int accz;
  int gyrox;
  int gyroy;
  int gyroz;
  int emg;
  int padding;
  int checksum;
};

// Define Position packet format
struct Position_Packet {
  char type;
  char newPosition;
  long padding0;
  long padding1;
  long padding2;
  int padding3;
  long checksum;
};

void setup() {
  Serial.begin(115200);
  Wire.begin(); //initialise I2C comm
  serialNo = EEPROM.read(SERIAL_NUMBER_ADDRESS);
  ID = int(serialNo);
  setupMPU();
}

void loop() {
  if (Serial.available() > 0) {
    // Read data sent from laptop
    byte cmd = Serial.read();
    switch(char(cmd)) {
      // Send ACK back to laptop
      case 'H':
        Serial.write('A');
        handshake_completed = false;
        break;
      // Received ACK from laptop, handshake process is completed
      case 'A':
        handshake_completed = true;
        break;
      // Received instruction from laptop to reset beetle
      case 'R':
        resetFunc();
        break;
    }
  }

  // Send data after handshake is completed
  if (handshake_completed) {
    current_time = millis();
    // Send data at 20 Hz
    if (current_time - previous_dpacket_time > DATA_THRESHOLD) {
      processAccelData(); //pre-processing for accel data
      processGyroData(); //pre-processing for gyro data
      sendIMUData();
      previous_dpacket_time = current_time;
    }
    // Detect position change if dancer is not dancing
    if (!dancing) {
      if (current_time - previous_ppacket_time > POSITION_THRESHOLD) {
        processGyroDataTurning();
        detectPosition();
        previous_ppacket_time = current_time;
      }
    }
    // Send position change data to laptop
    if (positionDetected) {
      if (!positionDataSent) {
        sendPositionData();
        positionDataSent = true;
      }
      if (dancing) {
        positionDetected = false;
        positionDataSent = false;
      }
    }
  }
}

// Calculate IMU packet checksum
int calcIMUChecksum(IMU_Packet packet) {
  return packet.type ^ packet.moving ^ packet.accx ^ packet.accy ^ packet.accz ^ packet.gyrox ^ packet.gyroy ^ packet.gyroz ^ packet.emg ^ packet.padding;
}

// Calculate Position packet checksum
long calcPositionChecksum(Position_Packet packet) {
  return packet.type ^ packet.newPosition ^ packet.padding0 ^ packet.padding1 ^ packet.padding2 ^ packet.padding3;
}

void sendIMUData() {
  IMU_Packet ipacket;
  ipacket.type = 'I';
  if (dancing) {
    ipacket.moving = 'Y';
  } else {
    ipacket.moving = 'N';
  }
  ipacket.accx = scaledgForceX;
  ipacket.accy = scaledgForceY;
  ipacket.accz = scaledgForceZ;
  ipacket.gyrox = scaledRotX;
  ipacket.gyroy = scaledRotY;
  ipacket.gyroz = scaledRotZ;
  ipacket.emg = calculateEMGData();
  ipacket.padding = 0; // Padding to ensure packet is size 20 bytes
  ipacket.checksum = calcIMUChecksum(ipacket);

  Serial.write((uint8_t *)&ipacket, sizeof(ipacket));
}

void sendPositionData() {
  Position_Packet ppacket;
  ppacket.type = 'P';
  ppacket.newPosition = newPosition;
  ppacket.padding0 = 0;
  ppacket.padding1 = 0;
  ppacket.padding2 = 0;
  ppacket.padding3 = 0;
  ppacket.checksum = calcPositionChecksum(ppacket);

  Serial.write((uint8_t *)&ppacket, sizeof(ppacket));
}

float calculateEMGData() {
  if (ID == 6) { // Only read EMG data if it is EMG set
    totalValue = 0;
    squareValue = 0;
    meanAmplitude = 0;
  
    // 35 samples with 1kHz frequency, tuned down to maintain data reading at 20 Hz
    for (int i = 0; i < EMG_SAMPLES; i++) {
      float sensorValue = analogRead(A0); //read the analog value
      float convertedValue = (sensorValue / 1024.0) * 5; //convert into voltage range
      
      totalValue += convertedValue;
      delay(1);
    }
    meanAmplitude = totalValue / (EMG_SAMPLES * 1.0);
    scaledMeanAmplitude = round(meanAmplitude * 100.0);
  } else {
    scaledMeanAmplitude = 0; // Send as 0 if it is not EMG set
  }
  return scaledMeanAmplitude;
}


//Set up registers to read data
void setupMPU() {
  mpu.initialize();
  if (!mpu.testConnection()) {
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

// Calibrate offset values for different beetles
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
  } else if (ID == 4) { //set2 yellow 
    mpu.setXAccelOffset(-2970);
    mpu.setYAccelOffset(3988);
    mpu.setZAccelOffset(1568);

    mpu.setXGyroOffset(57);
    mpu.setYGyroOffset(121);
    mpu.setZGyroOffset(-64);
  } else if (ID == 6) { // H3
    mpu.setXAccelOffset(1244);
    mpu.setYAccelOffset(79);
    mpu.setZAccelOffset(849);

    mpu.setXGyroOffset(110);
    mpu.setYGyroOffset(138);
    mpu.setZGyroOffset(33);
  }
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

    // Dancer moving status thresholding
    if (aCount >= 5) {
      for (int i = 0; i < SAMPLES; i++) {
        accelXDiffSum += abs(accelXDiff[i]);
        accelYDiffSum += abs(accelYDiff[i]);
        accelZDiffSum += abs(accelZDiff[i]);
      }
      if (accelXDiffSum >= 10000 || accelYDiffSum >= 10000 || accelZDiffSum >= 10000) {
        dancing_count += 1;
        idling_count = 0;

        // Detect state of motion as moving
        if (dancing_count >= 8) {
          veryFirst = false;
          dancing = true;
          idling = false;
        }
      } else {
        idling_count += 1;
      }

      // Detect state of motion as idling
      if (idling_count >= 5) {
        if (idling_count == 5) {
          firstClear = true;
          firstStop = true;
        } 
        idling = true;
        dancing = false;
        dancing_count = 0;
      }
        
      aCount = 0;
      accelXDiffSum = 0;
      accelYDiffSum = 0;
      accelZDiffSum = 0;
    }
  }

  //process the moving data
  if (dancing) {
    //process Accel Data
    //convert data to g. LSB per g = 16384.0 from the datasheet.
    //MPU6050 has the range of +-2g.
    gForceX = accelX / 16384.0; 
    gForceY = accelY / 16384.0; 
    gForceZ = accelZ / 16384.0;
    scaledgForceX = (round(gForceX * 100.0));
    scaledgForceY = (round(gForceY * 100.0));
    scaledgForceZ = (round(gForceZ * 100.0));
  } else { //process the walking/stop data
    gForceX = accelX / 16384.0; 
    gForceY = accelY / 16384.0; 
    gForceZ = accelZ / 16384.0;
    scaledgForceX = (round(gForceX * 100.0));
    scaledgForceY = (round(gForceY * 100.0));
    scaledgForceZ = (round(gForceZ * 100.0));  
  }
}

void processGyroData() {
  Wire.beginTransmission(I2C_ADDR); //I2C address
  Wire.write(GYRO_OUT); 
  Wire.endTransmission();
  Wire.requestFrom(I2C_ADDR,6);  //Request 6 (43 - 48) gyro registers 

  while(Wire.available() < 6);
  mpu.getRotation(&gyroX, &gyroY, &gyroZ);

  //process the moving data
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
    scaledRotX = (round(rotX * 100.0));
    scaledRotY = (round(rotY * 100.0));
    scaledRotZ = (round(rotZ * 100.0));
  } else {
    //process the dancing data
    rotX = gyroX / 131.0; 
    rotY = gyroY / 131.0; 
    rotZ = gyroZ / 131.0;
    scaledRotX = (round(rotX * 100.0));
    scaledRotY = (round(rotY * 100.0));
    scaledRotZ = (round(rotZ * 100.0));
  }
}

// Process Gyro data to detect position changes
void processGyroDataTurning() {
  Wire.beginTransmission(I2C_ADDR); //I2C address
  Wire.write(GYRO_OUT); 
  Wire.endTransmission();
  Wire.requestFrom(I2C_ADDR,6);  //Request 6 (43 - 48) gyro registers 

  while(Wire.available() < 6);
  mpu.getRotation(&gyroXT, &gyroYT, &gyroZT);

  //process the moving data
  if (!dancing) {
    gyroXSumT += gyroXT;
    gyroYSumT += gyroYT;
    gyroZSumT += gyroZT;

    if (gCountT < 60) {
      gCountT += 1;
    }

    gyroXAvgT = gyroXSumT / (gCountT * 1.0);
    gyroYAvgT = gyroYSumT / (gCountT * 1.0);
    gyroZAvgT = gyroZSumT / (gCountT * 1.0);
  }
}

void clearGyroSum() {
  gyroXSumT = 0;
  gyroYSumT = 0;
  gyroZSumT = 0;
  gyroXAvgT = 0;
  gyroYAvgT = 0;
  gyroZAvgT = 0;
  gCountT = 0;
}

// Position Detection
void detectPosition() {
    // Capture timestamp when dancer first stops moving
    if (firstStop) {
      stopTime = millis();
      firstStop = false;
    }
    elapsedTime = millis();
    
    // Already detected the new position
    if (positionDetected) {
      return;
    }

    // Clear existing Gyro values to accurately determine turning
    if (firstClear) {
      clearGyroSum();
      firstClear = false;
    }

    if (gyroYAvgT > 1600) {
      rMoveCnt += 1;
    } else if (gyroYAvgT < -1600) {
      lMoveCnt += 1;
    }

    // Position change for the very first dance move
    if (veryFirst) {
      if (lMoveCnt > 15) {
        lMoveCnt = 0;
        rMoveCnt = 0;
        positionDetected = true;
        newPosition = 'L';
        clearGyroSum();
      } else if (rMoveCnt > 15) {
        lMoveCnt = 0;
        rMoveCnt = 0;
        positionDetected = true;
        newPosition = 'R';
        clearGyroSum();
      } else if (elapsedTime - stopTime > 39000) { // Detect as stay if no left or right turning is detected
        lMoveCnt = 0;
        rMoveCnt = 0;
        positionDetected = true;
        newPosition = 'S';
        clearGyroSum();
      }

    // Position change for every other dance moves
    } else {
      if (lMoveCnt > 15) {
        lMoveCnt = 0;
        rMoveCnt = 0;
        sMoveCnt = 0;
        positionDetected = true;
        newPosition = 'L';
        clearGyroSum();
      } else if (rMoveCnt > 15) {
        lMoveCnt = 0;
        rMoveCnt = 0;
        sMoveCnt = 0;
        positionDetected = true;
        newPosition = 'R';
        clearGyroSum();
      } else if (elapsedTime - stopTime > 14000) {
        lMoveCnt = 0;
        rMoveCnt = 0;
        sMoveCnt = 0;
        positionDetected = true;
        newPosition = 'S';
        clearGyroSum();
      }
    }
}
