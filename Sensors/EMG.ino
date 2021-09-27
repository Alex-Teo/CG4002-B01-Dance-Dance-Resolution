#include <math.h>

#define SAMPLES 140 //No. of sample in the window period

void setup() {
  Serial.begin(115200);
}

void loop() {
  double totalValue = 0; 
  double squareValue = 0;
  float meanAmplitude = 0;
  float rmsAmplitude = 0;
  float maxAmplitude = 0;

  //140 samples with 1kHz frequency
  //140ms window period
  for (int i = 0; i < SAMPLES; i++) {
    float sensorValue = analogRead(A0); //read the analog value
    Serial.print("Sensor Value: ");  Serial.println(sensorValue);
    float convertedValue = (sensorValue / 1024.0) * 5; //convert into voltage range
    Serial.print("Converted Value: ");  Serial.println(convertedValue);
    
    totalValue += convertedValue;
    squareValue += (convertedValue * convertedValue);

    //update max amplitude
    if (convertedValue > maxAmplitude) {
      maxAmplitude = convertedValue;
    }

    delay(1);
  }

  meanAmplitude = totalValue / (SAMPLES * 1.0);
  rmsAmplitude = sqrt(squareValue / (SAMPLES * 1.0));

  Serial.print("mean amp: "); Serial.println(meanAmplitude);
  Serial.print("rms amp: "); Serial.println(rmsAmplitude);
  Serial.print("max amp: "); Serial.println(maxAmplitude);

  delay(99999999);
}
