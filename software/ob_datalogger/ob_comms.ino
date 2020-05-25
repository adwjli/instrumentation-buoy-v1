/*
Ocean Buoy Data Logger - Arduino Firmware
Rev 1.0
Author: Andrew Li
Year: 2014

*/

String retrieveSerial() {
	
	String cmd = "";
	char current_byte;
	while(Serial.available() > 0) {
		current_byte = Serial.read();
		cmd += String(current_byte);
	}
	return cmd;
}


void interpretCommand(String cmdString) {
	
	char cmdStringChar[cmdString.length()+1];
	cmdString.toCharArray(cmdStringChar,sizeof(cmdStringChar));

	char cmd[] = "0000";
	for (uint8_t i = 0; i < COMMAND_SIZE; i++) {
		cmd[i] = cmdStringChar[i];
	}

	if (!strcmp(cmd,"RTRV")) {
		
		setEndTime();

		char fromDate[] = "00000000";
		char toDate[] = "00000000";

		// Each parameter is 8 characters long seperated by a space
		if (sizeof(cmdStringChar) == COMMAND_SIZE+1) {
			setFromDateAsDefaultStartTime(fromDate);
			setToDateAsDefaultEndTime(toDate);
			Serial.println(fromDate);
			Serial.println(toDate);

		}
		// else if one parameter has been passed
		else if (sizeof(cmdStringChar) == 13+1) { // example: RTRV 14092320
			for (uint8_t i = 0; i < 8; i++) {
				fromDate[i] = cmdStringChar[COMMAND_SIZE+1+i];
			}
			setToDateAsDefaultEndTime(toDate);

		}
		// else if two parameters have been passed
		else if (sizeof(cmdStringChar) == 22+1) { // example: RTRV 14092320 14092420
			for (uint8_t i = 0; i < 8; i++) {
				fromDate[i] = cmdStringChar[5+i];
				toDate[i] = cmdStringChar[14+i];
			}
		}
		
		detachInterrupt(isr_rtc);
		retrieveData(fromDate, toDate);
	}
	if (!strcmp(cmd,"ECHO")) {
		if (!flag_error) {
			Serial.println("OK");
		}
	}
}

void retrieveData(char fd[], char td[]) {
	
	// Parsing
	char yearChar[] = "00";
	char monthChar[] = "00";
	char dayChar[] = "00";
	char hourChar[] = "00";
	
	// Value holders
	int fdYear;
	int fdMonth;
	int fdDay;
	int fdHour;

	int tdYear;
	int tdMonth;
	int tdDay;
	int tdHour;

	// Parsing From Date
	for (uint8_t i = 0; i < 2; i++) {
		yearChar[i] = fd[0+i];
		monthChar[i] = fd[2+i];
		dayChar[i] = fd[4+i];
		hourChar[i] = fd[6+i];
	}
	
	// Converting chars to ints
	fdYear = int(((int(yearChar[0])-48)*10) + ((int(yearChar[1])-48)*1));
	fdMonth = int(((int(monthChar[0])-48)*10) + ((int(monthChar[1])-48)*1));
	fdDay = int(((int(dayChar[0])-48)*10) + ((int(dayChar[1])-48)*1));
	fdHour = int(((int(hourChar[0])-48)*10) + ((int(hourChar[1])-48)*1));

	// Parsing To Date
	for (uint8_t i = 0; i < 2; i++) {
		yearChar[i] = td[0+i];
		monthChar[i] = td[2+i];
		dayChar[i] = td[4+i];
		hourChar[i] = td[6+i];
	}
	
	// Converting chars to ints
	tdYear = int(((int(yearChar[0])-48)*10) + ((int(yearChar[1])-48)*1));
	tdMonth = int(((int(monthChar[0])-48)*10) + ((int(monthChar[1])-48)*1));
	tdDay = int(((int(dayChar[0])-48)*10) + ((int(dayChar[1])-48)*1));
	tdHour = int(((int(hourChar[0])-48)*10) + ((int(hourChar[1])-48)*1));
	
	if ((tdYear == 0) && (tdMonth == 0) && (tdDay == 0) && (tdHour == 0)) {
		tdYear = EEPROM.read(6);
		tdMonth = EEPROM.read(7);
		tdDay = EEPROM.read(8);
		tdHour = EEPROM.read(9);
	}
	
	if ((fdYear == 0) && (fdMonth == 0) && (fdDay == 0) && (fdHour == 0)) {
		fdYear = EEPROM.read(0);
		fdMonth = EEPROM.read(1);
		fdDay = EEPROM.read(2);
		fdHour = EEPROM.read(3);
	}

	unsigned long filenameIntFrom = 0;
	unsigned long filenameIntTo = constructFilename(tdYear,tdMonth,tdDay,tdHour);
	
	String filenameString = "";
	char filenameCharFrom[] = "00000000.CSV";
	
	File dataFile;

	do {
		filenameIntFrom = constructFilename(fdYear,fdMonth,fdDay,fdHour);
		filenameString = String(filenameIntFrom) + ".CSV";
		filenameString.toCharArray(filenameCharFrom,sizeof(filenameCharFrom));
		
		dataFile = SD.open(filenameCharFrom);
		if (dataFile) {
			
			Serial.print("file: ");
			Serial.println(filenameCharFrom);

			// read from the file until there's nothing else in it:
			while (dataFile.available()) {
				Serial.write(dataFile.read());
				delay(1); // To give sufficient time for the serial to transmit
			}
			// close the file:
			dataFile.close();
		}
		else {
			// if the file didn't open, print an error:
			Serial.print("Cannot open: ");
			Serial.println(filenameCharFrom);
		}
		
		updateTime(&fdYear, &fdMonth, &fdDay, &fdHour);
		
	} while (filenameIntFrom < filenameIntTo);
	
	Serial.println("Transmission complete!");
	flag_create_new_file = 1; // We want to restart logging to a new file.
	attachInterrupt(isr_rtc, rtcISR, CHANGE); // A CHANGE interrupt triggers every 500ms
}


unsigned long constructFilename(int fdYear, int fdMonth, int fdDay, int fdHour) {
	unsigned long result;
	result = (unsigned long)fdYear*1000000 + (unsigned long)fdMonth*10000 + (unsigned long)fdDay*100 + (unsigned long)fdHour*1;
	return result;
}

void updateTime(int* fdYear, int* fdMonth, int* fdDay, int* fdHour) {
	(*fdHour)++;
	if (*fdHour > 23) {
		(*fdHour) = 0;
		(*fdDay)++;
		if (*fdDay > daysInMonth(*fdMonth)){
			(*fdDay) = 1;
			(*fdMonth)++;
			if (*fdMonth > 12) {
				(*fdMonth) = 1;
				(*fdYear)++;
				if ((*fdYear) > 99) {
					(*fdYear) = 0;
				}
			}
		}
	}
}

int daysInMonth(int month) {
	if ((month == 1) || (month == 3) || (month == 5) || (month == 7) || (month == 8) || (month == 10) || (month == 12)) {
		return 31;
	}
	else if  ((month == 4) || (month == 6) || (month == 9) || (month == 11)) {
		return 30;
	}
	else {
		return 28; // February. Leap years are not considered in this version of the firmware
	}
}
