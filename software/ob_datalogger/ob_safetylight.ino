/*
Ocean Buoy Data Logger - Arduino Firmware
Rev 1.0
Author: Andrew Li
Year: 2014

*/

void initialiseSafetyLight() {
	counter1 = 1;
	counter2 = 1;
	led_switch = 1;
	led_state = 1;
	
	lightThresholdHigh = LIGHT_THRESHOLD_VALUE_HIGH;
	lightThresholdLow = LIGHT_THRESHOLD_VALUE_LOW;
}


void activateSafetyLight() {
	
	// This routines flashes the safety light 5 times, period = 2s, 50% duty and off for 10 seconds
	analogWrite(pin_led_drive, (led_switch & led_state) * uint8_t(duty_cycle*255/100));
	
	if (counter1 == 2) {
		counter1 = 1;
		counter2++;
		led_state = !led_state;
	}
	else {
		counter1++;
	}
	
	if (counter2 == 2*nunber_of_flashes+1) {
		counter2 = 1;
		led_switch = !led_switch;
	}
}

bool doesSafetyLightNeedToSwitchOn(unsigned int llvl) {
	
	uint8_t lightlvl = map(llvl, 0, 1023, 0, 255);
	
	if ((lightlvl < lightThresholdLow) && (flag_flashSafetyLight == 0)) {
		initialiseSafetyLight();
		return 1;
	}
	else if ((lightlvl > lightThresholdHigh) && (flag_flashSafetyLight == 1)) {
		digitalWrite(pin_led_drive, LOW); // Force turn OFF Safety Light
		return 0;
	}
	else {
		return flag_flashSafetyLight;
	}
}
