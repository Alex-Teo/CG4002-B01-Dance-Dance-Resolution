#define DATA_THRESHOLD 50
#define TIME_THRESHOLD 10000

struct EMG_Packet {
  char type;
  int mean;
  int rms;
  int emax;
  byte timestamp[4];
  long padding1;
  int padding2;
  char padding3;
  int checksum;
};

struct IMU_Packet {
  char type;
  int accx;
  int accy;
  int accz;
  int gyrox;
  int gyroy;
  int gyroz;
  byte timestamp[4];
  char padding;
  int checksum;
};

struct Time_Packet {
  char type;
  byte timestamp[4];
  long padding1;
  long padding2;
  long padding3;
  char padding4;
  int checksum;
};

bool handshake_completed = false;
unsigned long current_time;
unsigned long previous_dpacket_time = 0;
unsigned long previous_tpacket_time = 0;

void(* resetFunc) (void) = 0;

int calcEMGChecksum(EMG_Packet packet) {
  return packet.type ^ packet.mean ^ packet.rms ^ packet.emax ^ packet.timestamp[0] ^ packet.timestamp[1] ^ packet.timestamp[2] ^ packet.timestamp[3] ^ 
         packet.padding1 ^ packet.padding2 ^ packet.padding3;
}

int calcIMUChecksum(IMU_Packet packet) {
  return packet.type ^ packet.accx ^ packet.accy ^ packet.accz ^ packet.gyrox ^ packet.gyroy ^ packet.gyroz ^ packet.timestamp[0] ^ packet.timestamp[1] ^ 
         packet.timestamp[2] ^ packet.timestamp[3] ^ packet.padding;
}

int calcTimeChecksum(Time_Packet packet) {
  return packet.type ^ packet.timestamp[0] ^ packet.timestamp[1] ^ packet.timestamp[2] ^ packet.timestamp[3] ^ packet.padding1 ^ packet.padding2 ^ 
         packet.padding3 ^ packet.padding4;
}

void sendEMGData() {
  EMG_Packet epacket;
  epacket.type = 'E';
  epacket.mean = random(1000);
  epacket.rms = random(1000);
  epacket.emax = random(1000);
  unsigned long a_time = millis();
  epacket.timestamp[0] = a_time >> 24;
  epacket.timestamp[1] = a_time >> 16;  
  epacket.timestamp[2] = a_time >> 8;
  epacket.timestamp[3] = a_time;
  epacket.padding1 = 0;
  epacket.padding2 = 0;
  epacket.padding3 = '\0';
  epacket.checksum = calcEMGChecksum(epacket);

  Serial.write((uint8_t *)&epacket, sizeof(epacket));
}

void sendIMUData() {
  IMU_Packet ipacket;
  ipacket.type = 'I';
  ipacket.accx = random(1000);
  ipacket.accy = random(1000);
  ipacket.accz = random(1000);
  ipacket.gyrox = random(1000);
  ipacket.gyroy = random(1000);
  ipacket.gyroz = random(1000);
  unsigned long a_time = millis();
  ipacket.timestamp[0] = a_time >> 24;
  ipacket.timestamp[1] = a_time >> 16;  
  ipacket.timestamp[2] = a_time >> 8;
  ipacket.timestamp[3] = a_time;
  ipacket.padding = '\0';
  ipacket.checksum = calcIMUChecksum(ipacket);

  Serial.write((uint8_t *)&ipacket, sizeof(ipacket));
}
  
void sendTimeData() {
  Time_Packet tpacket;
  tpacket.type = 'T';
  unsigned long a_time = millis();
  tpacket.timestamp[0] = a_time >> 24;
  tpacket.timestamp[1] = a_time >> 16;  
  tpacket.timestamp[2] = a_time >> 8;
  tpacket.timestamp[3] = a_time;
  tpacket.padding1 = 0;
  tpacket.padding2 = 0;
  tpacket.padding3 = 0;
  tpacket.padding4 = '\0';
  tpacket.checksum = calcTimeChecksum(tpacket);

  Serial.write((uint8_t *)&tpacket, sizeof(tpacket));
}

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
}

void loop() {
  // put your main code here, to run repeatedly:
  if (Serial.available()) {
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
      sendIMUData();
      previous_dpacket_time = current_time;
//      sendEMGData(); // Only for the 1 beetle that is connected to the EMG sensor
    }
    if (current_time - previous_tpacket_time > TIME_THRESHOLD) {
      sendTimeData();
      previous_tpacket_time = current_time;
    }
  }
}
