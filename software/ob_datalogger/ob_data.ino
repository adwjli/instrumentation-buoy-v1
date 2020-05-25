void initialiseSD() {
	if (!SD.begin(pin_chip_select)) {
		flag_error = 1;
		#ifdef DEBUG
			Serial.println("Initialisation of SD card failed");
		#endif
	}
	else {
		flag_create_new_file = 1;
		#ifdef DEBUG
			Serial.println("SD card initialised");
		#endif
		pinMode(pin_chip_select, OUTPUT);
	}
}



void saveData() {
	
	String dataString = "";
	
	if (flag_create_new_file) {
		#ifdef DEBUG
			Serial.println("Creating new data file...");
		#endif
		
		// Get the time
		getTime(); // Refresh the time variable
		
		#ifdef DEBUG
			Serial.print("Retrieving the time: ");
			printTime();
		#endif

		// Update the filename
		// Filename must conform with 8.3 filename convention for FAT32 filesystem (8 characters or less)
		filename = timeToString(time[0]-BQ32000_BASE_YR) + timeToString(time[1]) + timeToString(time[2]) + timeToString(time[3]) + ".csv";		
		
		#ifdef DEBUG
			Serial.print("Filename is: ");
			Serial.println(filename);
			Serial.print("header_string is: ");
			Serial.println(header_string);
		#endif
		
		writeToFile(filename, "Freq:," + String(SAMPLING_FREQ) + ",Hz"); // The first call to writeToFile will create the file
		writeToFile(filename, "Time:," + timeToString(time[0]) + "-" + timeToString(time[1]) + "-" + timeToString(time[2]) + " " + timeToString(time[3]) + ":" + timeToString(time[4]) + ":" + timeToString(time[5]));
		writeToFile(filename, header_string);

		#ifdef DEBUG
			Serial.println("");
		#endif
		
		flag_create_new_file = 0;
		write_count = 1; // Reset the data point counter
	}
	
	/*
	
	Construct the dataString.
	Data should be stored in this order:
	
	Data Point Counter
	Water Depth
	Air Pressure (100PSI)
	Air Pressure (30PSI)
	Temperature
	Light Level
	Voltage
	Acceleration X
	Acceleration Y
	Acceleration Z
	
	*/
	
	dataString += String(write_count);
	dataString += ",";
	dataString += String(water_depth);
	dataString += ",";
	dataString += String(air_pressure_1);
	dataString += ",";
	dataString += String(air_pressure_2);
	dataString += ",";
	dataString += String(temperature);
	dataString += ",";
	dataString += String(light_level);
	dataString += ",";
	dataString += String(voltage_measurement);
	dataString += ",";
	dataString += String(accel_x);
	dataString += ",";
	dataString += String(accel_y);
	dataString += ",";
	dataString += String(accel_z);
	
	writeToFile(filename, dataString);
}

void writeToFile(const String& fn, const String& ds) {
	
	// Convert the fn String into the char fnChar
	char fnChar[fn.length()+1];
	fn.toCharArray(fnChar,sizeof(fnChar));
		
	char dsChar[ds.length()+1];
	ds.toCharArray(dsChar,sizeof(dsChar));
	
	writeToFile(fnChar, dsChar);
}

// This version of the function is to write the header string into the data files
void writeToFile(const String& fn, const prog_char hs[]) {
	
	char fnChar[fn.length()+1];
	fn.toCharArray(fnChar,sizeof(fnChar));
	
	char hsChar[LEN_HEADER_STRING]; // This i the length of the header_string
	
	for (uint8_t i = 0; i < LEN_HEADER_STRING; i++) {
		hsChar[i] = pgm_read_byte_near(hs + i);
	}
	
	writeToFile(fnChar, hsChar);
}


void writeToFile(char fnChar[], char dsChar[]) {
	
	File dataFile = SD.open(fnChar, FILE_WRITE);
	
	// if the file is available, write to it:
	if (dataFile) {
		dataFile.println(dsChar);
		dataFile.close();
	}
	
	// if the file isn't open, pop up an error:
	else {
		flag_error = 1;
		//Serial.print("Cannot write file: ");
		//Serial.println(fnChar);
	}
}