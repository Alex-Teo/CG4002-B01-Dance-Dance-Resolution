#include <Wire.h> //for I2C communication
#include "I2Cdev.h"
#include "MPU6050.h"
#include <math.h>
#include <string.h>

//addresses according to datasheet
#define I2C_ADDR 0x68 //I2C address of MPU
#define PWR_MGMT 0x6B //Power Management
#define ACCEL_CONFIG 0x1C
#define GYRO_CONFIG 0x1B
#define ACCEL_OUT 0x3B //Starting register for accel readings
#define GYRO_OUT 0x43 //Starting address for gyro readings 

//offsets for set chest_1
#define AXO -290
#define AYO 350
#define AZO -1160
#define GXO -495
#define GYO -92
#define GZO 135

MPU6050 mpu;

#define SAMPLES 5
#define DATA_THRESHOLD 50
#define TIME_THRESHOLD 10000

float preAX = 0;
float preAY = 0;
float preAZ = 16384;

int moving_count = 0;
int idling_count = 0;
int count = 0;

long accelXDiff[SAMPLES];
long accelYDiff[SAMPLES];
long accelZDiff[SAMPLES];
long accelXDiffSum = 0;
long accelYDiffSum = 0;
long accelZDiffSum = 0;
bool moving = false;
bool idling = true;

//store raw data of accel and gyro
long accelX, accelY, accelZ;  
long gyroX, gyroY, gyroZ;

//calculate accel and gyro in g and degree units
float gForceX, gForceY, gForceZ;
float rotX, rotY, rotZ;

//scaled accel and gyro values
int scaledgForceX, scaledgForceY, scaledgForceZ;
int scaledRotX, scaledRotY, scaledRotZ;

bool handshake_completed = false;
unsigned long current_time;
unsigned long previous_dpacket_time = 0;
unsigned long previous_tpacket_time = 0;

void(* resetFunc) (void) = 0;

struct IMU_Packet {
  char type;
  char moving;
  int accx;
  int accy;
  int accz;
  int gyrox;
  int gyroy;
  int gyroz;
  byte timestamp[4];
  int checksum;
};

void setup() {
  Serial.begin(115200);
  Wire.begin(); //initialise I2C comm
  setupMPU();
}

void loop() {
//  processAccelData();
//  processGyroData();
//  Serial.println(moving);
//}
  if (Serial.available() > 0) {
    byte cmd = Serial.read();
    switch(char(cmd)) {
      case 'H':
        Serial.write('A');
        handshake_completed = false;
        break;
      case 'A':
        handshake_completed = true;
        break;
      case 'R':
        resetFunc();
        break;
    }
  }


  if (handshake_completed) {
    current_time = millis();
    if (current_time - previous_dpacket_time > DATA_THRESHOLD) {
      processAccelData(); //pre-processing for accel data
      processGyroData(); //pre-processing for gyro data
      sendIMUData();
      previous_dpacket_time = current_time;
    }
//      sendEMGData(); // Only for the 1 beetle that is connected to the EMG sensor
  }
}
//    if (current_time - previous_tpacket_time > TIME_THRESHOLD) {
//      sendTimeData();
//      previous_tpacket_time = current_time;
//    }
//  }
//}

int calcIMUChecksum(IMU_Packet packet) {
  return packet.type ^ packet.moving ^ packet.accx ^ packet.accy ^ packet.accz ^ packet.gyrox ^ packet.gyroy ^ packet.gyroz ^ packet.timestamp[0] ^ packet.timestamp[1] ^ 
         packet.timestamp[2] ^ packet.timestamp[3];
}

void sendIMUData() {
  IMU_Packet ipacket;
  ipacket.type = 'I';
  if (moving) {
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
  unsigned long a_time = millis();
  ipacket.timestamp[0] = a_time >> 24;
  ipacket.timestamp[1] = a_time >> 16;  
  ipacket.timestamp[2] = a_time >> 8;
  ipacket.timestamp[3] = a_time;
  ipacket.checksum = calcIMUChecksum(ipacket);

  Serial.write((uint8_t *)&ipacket, sizeof(ipacket));
}

//Set up registers to read data
void setupMPU() {
  mpu.initialize();
  if (!mpu.testConnection()) {
//    Serial.println(F("!MPU6050 connection failed"));
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
}
  
//retrieving accel raw data
void processAccelData() {
  Wire.beginTransmission(I2C_ADDR); //I2C address
  Wire.write(ACCEL_OUT);
  Wire.endTransmission();
  Wire.requestFrom(I2C_ADDR,6);  //Request 6 (3B - 40) accel registers

  while(Wire.available() < 6); 
  //2 registers are read and stored in the same variable. 
  //accelX is a long variable which can save 2 bytes. 
  //Wire.read() reads 1 byte each time. 
  accelX = Wire.read()<<8 | Wire.read();  //Store first two bytes.
  accelY = Wire.read()<<8 | Wire.read();  //Store middle two bytes
  accelZ = Wire.read()<<8 | Wire.read();  //Store last two bytes

  //noise removal
  if (abs(accelX - AXO) < 24576 && abs(accelY - AYO) < 24576 && abs(accelZ - AZO) < 24576) {
    accelXDiff[count] = accelX - preAX;
    accelYDiff[count] = accelY - preAY;
    accelZDiff[count] = accelZ - preAZ;
    preAX = accelX;
    preAY = accelY;
    preAZ = accelZ;
    count += 1;

    //thresholding
    if (count >= 5) {
      for (int i = 0; i < SAMPLES; i++) {
        accelXDiffSum += abs(accelXDiff[i]);
        accelYDiffSum += abs(accelYDiff[i]);
        accelZDiffSum += abs(accelZDiff[i]);
      }
      if (accelXDiffSum >= 5000 || accelYDiffSum >= 5000 || accelZDiffSum >= 5000) {
        moving_count += 1;
        idling_count = 0;


        // Detect state of motion as moving
        if (moving_count >= 5) {
          moving = true;
          idling = false;
//          Serial.print("moving! ");
//          Serial.println(moving_count);
        }
      } else {
        idling_count += 1;
//        Serial.print("idling ");
//        Serial.println(idling_count);
      }
      // Detect state of motion as idling
      if (idling_count >= 10) {
        idling = true;
        moving = false;
        moving_count = 0;
//        Serial.print("stop moving! ");
      }
        
      count = 0;
      accelXDiffSum = 0;
      accelYDiffSum = 0;
      accelZDiffSum = 0;
    }
  }

  //process the moving data
  if (moving) {
    //process Accel Data
    //convert data to g. LSB per g = 16384.0 from the datasheet.
    //MPU6050 has the range of +-2g.
    gForceX = (accelX - AXO) / 16384.0; 
    gForceY = (accelY - AYO) / 16384.0; 
    gForceZ = (accelZ - AZO) / 16384.0;
    scaledgForceX = (round(gForceX * 100.0));
    scaledgForceY = (round(gForceY * 100.0));
    scaledgForceZ = (round(gForceZ * 100.0));

//    Serial.print("processed AccelX value:");
//    Serial.println(gForceX);
//    Serial.print("processed AccelY value:");
//    Serial.println(gForceY);
//    Serial.print("processed AccelZ value:");
//    Serial.println(gForceZ);
  } else { //process the dancing data
    gForceX = (accelX - AXO) / 16384.0; 
    gForceY = (accelY - AYO) / 16384.0; 
    gForceZ = (accelZ - AZO) / 16384.0;
    scaledgForceX = (round(gForceX * 100.0));
    scaledgForceY = (round(gForceY * 100.0));
    scaledgForceZ = (round(gForceZ * 100.0));

//    Serial.print("processed AccelX value:");
//    Serial.println(gForceX);
//    Serial.print("processed AccelY value:");
//    Serial.println(gForceY);
//    Serial.print("processed AccelZ value:");
//    Serial.println(gForceZ);
  }
  
}

void processGyroData() {
  Wire.beginTransmission(I2C_ADDR); //I2C address
  Wire.write(GYRO_OUT); 
  Wire.endTransmission();
  Wire.requestFrom(I2C_ADDR,6);  //Request 6 (43 - 48) gyro registers 

  while(Wire.available() < 6);
  gyroX = Wire.read()<<8 | Wire.read();  //Store first two bytes.
  gyroY = Wire.read()<<8 | Wire.read();  //Store middle two bytes 
  gyroZ = Wire.read()<<8 | Wire.read();  //Store last two bytes 

  //process the moving data
  if (moving && abs(gyroX - GXO) < 27852 && abs(gyroY - GYO) < 27852 && abs(gyroZ - GZO) < 27852) {
    //process Gyro Data
    //convert data to degrees. 
    //LSB per degrees per second = 131.0 according to the datasheet.
    //range is 250 deg/s from datasheet.
    rotX = (gyroX - GXO) / 131.0; 
    rotY = (gyroY - GYO) / 131.0; 
    rotZ = (gyroZ - GZO) / 131.0;
    scaledRotX = (round(rotX * 100.0));
    scaledRotY = (round(rotY * 100.0));
    scaledRotZ = (round(rotZ * 100.0));

//    Serial.print("processed GyroX value:");
//    Serial.println(rotX);
//    Serial.print("processed GyroY value:");
//    Serial.println(rotY);
//    Serial.print("processed GyroZ value:");
//    Serial.println(rotZ); 
  } else {
    //process the dancing data
    rotX = (gyroX - GXO) / 131.0; 
    rotY = (gyroY - GYO) / 131.0; 
    rotZ = (gyroZ - GZO) / 131.0;
    scaledRotX = (round(rotX * 100.0));
    scaledRotY = (round(rotY * 100.0));
    scaledRotZ = (round(rotZ * 100.0));

//    Serial.print("processed GyroX value:");
//    Serial.println(rotX);
//    Serial.print("processed GyroY value:");
//    Serial.println(rotY);
//    Serial.print("processed GyroZ value:");
//    Serial.println(rotZ);
  }
  
}
