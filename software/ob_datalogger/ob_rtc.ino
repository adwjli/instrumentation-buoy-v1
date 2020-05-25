/*
Ocean Buoy Data Logger - Arduino Firmware
Rev 1.0
Author: Andrew Li
Year: 2014

*/

void initialiseRTC() {
	RTC.enableIRQ(); // Enables the 1Hz output from IRQ pin
	RTC.start();
	setStartTime();
}

void getTime() { //  Update time
	time[0] = RTC.get(BQ32000_YR,true); // We pass true to refresh the clock
	time[1] = RTC.get(BQ32000_MTH,false); // No need to refresh the clock twice, hence false
	time[2] = RTC.get(BQ32000_DATE,false);
	time[3] = RTC.get(BQ32000_HR,false);
	time[4] = RTC.get(BQ32000_MIN,false);
	time[5] = RTC.get(BQ32000_SEC,false);
}

bool isStartOfNewHour() {
	
	unsigned int oldHour = time[3];
	getTime();
	if (time[3] != oldHour) {
		return 1;
	}
	else {
		return 0;
	}
}

void setTime(int timeToSet[]) {
	
	// value has to be in the form YYMMDDhhmmss where:
	// YY 0-99
	// MM 0-12
	// DD 0-31
	// hh 0-23
	// mm 0-59
	// ss 0-59
	
	// Need to implement error checking here...
	
	
	RTC.set(BQ32000_YR, timeToSet[0]);
	RTC.set(BQ32000_MTH, timeToSet[1]);
	RTC.set(BQ32000_DATE, timeToSet[2]);
	RTC.set(BQ32000_HR, timeToSet[3]);
	RTC.set(BQ32000_MIN, timeToSet[4]);
	RTC.set(BQ32000_SEC, timeToSet[5]);
	
}


void setStartTime() {
	getTime();
	EEPROM.write(START_YEAR,(time[0]-BQ32000_BASE_YR));
	EEPROM.write(START_MONTH,time[1]);
	EEPROM.write(START_DAY,time[2]);
	EEPROM.write(START_HOUR,time[3]);
	EEPROM.write(START_MINUTE,time[4]);
	EEPROM.write(START_SECOND,time[5]);
}

void setEndTime() {
	getTime();
	EEPROM.write(END_YEAR,(time[0]-BQ32000_BASE_YR));
	EEPROM.write(END_MONTH,time[1]);
	EEPROM.write(END_DAY,time[2]);
	EEPROM.write(END_HOUR,time[3]);
	EEPROM.write(END_MINUTE,time[4]);
	EEPROM.write(END_SECOND,time[5]);
}

String timeToString(unsigned int t) {
	if (t < 10) {
		return ("0"+String(t));
	}
	else {
		return String(t);
	}
}

void setToDateAsDefaultEndTime(char* td) {
	String strtd = timeToString(EEPROM.read(6))+timeToString(EEPROM.read(7))+timeToString(EEPROM.read(8))+timeToString(EEPROM.read(9));
	for (uint8_t i = 0; i < 8; i++) {
		*(td+i) = strtd[i];
	}
}

void setFromDateAsDefaultStartTime(char* fd) {
	String strfd = timeToString(EEPROM.read(0))+timeToString(EEPROM.read(1))+timeToString(EEPROM.read(2))+timeToString(EEPROM.read(3));
	for (uint8_t i = 0; i < 8; i++) {
		*(fd+i) = strfd[i];
	}
}
