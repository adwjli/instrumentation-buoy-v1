/*
Ocean Buoy Data Logger - Arduino Firmware
Rev 1.0
Author: Andrew Li
Year: 2014

*/

void initialiseAccel() {
	ADXL.powerOn();
	ADXL.setFullResBit(1);
	ADXL.setRangeSetting(16);
}

int readAccelerationX() {
	return ADXL.readAccelX();
}

int readAccelerationY() {
	return ADXL.readAccelY();
}

int readAccelerationZ() {
	return ADXL.readAccelZ();
}
