#include <Wire.h>

#include <SSC.h>



//  create an SSC sensor with I2C address 0x78 and power pin 8.

SSC ssc(0x28, 5);



void setup() 

{

  Serial.begin(9600);

  Wire.begin();



  //  set min / max reading and pressure, see datasheet for the values for your sensor

  ssc.setMinRaw(0);

  ssc.setMaxRaw(16383);

  ssc.setMinPressure(0.0);

  ssc.setMaxPressure(30);



  //  start the sensor

  Serial.print("start()\t\t");

  Serial.println(ssc.start());

}



void loop() 

{
  digitalWrite(6, digitalRead(6) ^ 1);
  //  update pressure / temperature

  Serial.print("update()\t");

  Serial.println(ssc.update());



  // print pressure

  Serial.print("pressure()\t");

  Serial.println(ssc.pressure());



  // print temperature

  Serial.print("temperature()\t");

  Serial.println(ssc.temperature());



  delay(1000);
  

}
