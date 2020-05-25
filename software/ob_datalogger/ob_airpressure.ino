// 30 PSI Sensor
void initialisePressureSensor30SPI() {
	SSCSensor.setMinRaw(0); // Minimum pressure (raw) is 0
	SSCSensor.setMaxRaw(16383); // Maximum pressure (raw) is 0x3FFF
	
	//  start the sensor
	SSCSensor.start();
}

unsigned int measureAirPressure30PSI() {
	SSCSensor.update();
	return SSCSensor.pressure_Raw();
}

// 100 PSI Sensor
unsigned int measureAirPressure100PSI() {
	return analogRead(pin_air_pressure_1);
}

unsigned int measureTemperature() {
	SSCSensor.update();
	return SSCSensor.temperature_Raw();
}
