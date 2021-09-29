struct Data_Packet {
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
  unsigned long timestamp;
  long checksum;
};

bool handshake_completed = false;
void(* resetFunc) (void) = 0;


void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
//  sendData();
}

int count = 0;
void loop() {
  // put your main code here, to run repeatedly:
  if (Serial.available()) {
    byte cmd = Serial.read();
    switch(char(cmd)) {
      case 'H':
        Serial.write('A');
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
    sendData();
    delay(50); //20Hz
//      delay(500);
//      count += 1;
//      }
  }
  
//  while (count < 4){
//    if (handshake_completed) {
//      sendData();
//      
//  //    delay(50); //20Hz
//      delay(500);
//      count += 1;
//      }
//  }
}
//
int calcChecksum(Data_Packet packet)
{
  return packet.type ^ packet.accx ^ packet.accy ^ packet.accz ^ packet.gyrox ^ packet.gyroy ^ packet.gyroz ^ packet.timestamp[0] ^ packet.timestamp[1] ^ packet.timestamp[2] ^ packet.timestamp[3];
}


void sendData() {
  Data_Packet dpacket;
  dpacket.type = 'D';
  dpacket.accx = 1000;
  dpacket.accy = 2000;
  dpacket.accz = 3000;
  dpacket.gyrox = 4000;
  dpacket.gyroy = 5000;
  dpacket.gyroz = 6000;
  unsigned long a_time = 429496729;
  dpacket.timestamp[0] = a_time >> 24;
  dpacket.timestamp[0] = (uint8_t)dpacket.timestamp[0];
  dpacket.timestamp[1] = a_time >> 16;  
  dpacket.timestamp[1] = (uint8_t)dpacket.timestamp[1];
  dpacket.timestamp[2] = a_time >> 8;
  dpacket.timestamp[2] = (uint8_t)dpacket.timestamp[2];
  dpacket.timestamp[3] = a_time;
  dpacket.timestamp[3] = (uint8_t)dpacket.timestamp[3];
//  Serial.println(dpacket.timestamp[0]);
//  Serial.println(dpacket.timestamp[1]);
//  Serial.println(dpacket.timestamp[2]);
//  Serial.println(dpacket.timestamp[3]);
  dpacket.padding = '\0';

  dpacket.checksum = calcChecksum(dpacket);
//  Serial.println(dpacket.checksum);

//  dpacket.checksum = calcChecksum1(dpacket);

  Serial.write((uint8_t *)&dpacket, sizeof(dpacket));
}
