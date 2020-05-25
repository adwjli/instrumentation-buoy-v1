void enableDepthSensor() {
  digitalWrite(pin_current_source_drive, HIGH);
}

void disableDepthSensor() {
  digitalWrite(pin_current_source_drive, LOW);
}

unsigned int measureWaterDepth() {
	enableDepthSensor();
	delay(1); // Wait 1ms for current source to start up.
	
	unsigned int sum = 0;
	for (uint8_t i = 0; i < 60; i++) { // Take 60 readings and average. 60 was chosen as anything higher can potentially overflow the size of int (65535 max)
		sum += analogRead(pin_water_depth);
	}
	disableDepthSensor();
	
	return sum/60; // We will keep it as int, don't worry about decimals.
	
}