/*
*
********************************************************************************************************
* 			BQ32000.cpp 	 library for BQ32000 I2C rtc clock				*
********************************************************************************************************
*
* Created by D. Sjunnesson 1scale1.com d.sjunnesson (at) 1scale1.com
* Modified by bricofoy - bricofoy (at) free.fr
*
* Created with combined information from
*  http://www.arduino.cc/cgi-bin/yabb2/YaBB.pl?num=1180908809
*  http://www.arduino.cc/cgi-bin/yabb2/YaBB.pl?num=1191209057
*
* Big credit to  mattt (please contact me for a more correct name...) from the Arduino forum
* which has written the main part of the library which I have modified
*
* Rev history :
*
* ??-??-??	- mattt & dsjunnesson 	- creation
* 19-feb-2012	- bricofoy 		- added arduino 1.0 compatibility
* 20-feb-2012	- bricofoy 		- bugfix : time was not preserved when setting or stopping clock
* 21-feb-2012	- bricofoy 		- bugfix : preserve existing seconds when starting/stopping clock
* 06-sep-2014  - andrewli      - added functionality for 1Hz square wave output
*
*TODO: enable AM/PM
*	enable square wave output
*
*/
#include "BQ32000.h"
//#define DEBUG

BQ32000::BQ32000()
{
	Wire.begin();
	
	// This is a really dumb way of initializing all the addresses, but hey it's readable
	rtc_bcd_addresses[0] =  0x00;
	rtc_bcd_addresses[1] =  0x01;
	rtc_bcd_addresses[2] =  0x02;
	rtc_bcd_addresses[3] =  0x03;
	rtc_bcd_addresses[4] =  0x04;
	rtc_bcd_addresses[5] =  0x05;
	rtc_bcd_addresses[6] =  0x06;
	rtc_bcd_addresses[7] =  0x07;
	rtc_bcd_addresses[8] =  0x08;
	rtc_bcd_addresses[9] =  0x09;
	rtc_bcd_addresses[10] = 0x20;
	rtc_bcd_addresses[11] = 0x21;
	rtc_bcd_addresses[12] = 0x22;
	/*
	#ifdef DEBUG
		Serial.println("rtc_bcd_addresses[]:");
		for (int i = 0; i < NUMBER_OF_REGISTERS; i++) {
			Serial.println(rtc_bcd_addresses[i]);
		}
	#endif
	*/

}

BQ32000 RTC=BQ32000();

// PRIVATE FUNCTIONS

// Aquire data from the RTC chip in BCD format
// refresh the buffer
void BQ32000::read(void)
{
	int address_count = 0;

	// First read the values to the normal registers
	Wire.beginTransmission(BQ32000_CTRL_ID);

	// First set the register pointer to initial address
	//Wire.write(rtc_bcd_addresses[address_count]);// reset register pointer
	Wire.write(rtc_bcd_addresses[address_count]);
	Wire.endTransmission();
	
	#ifdef DEBUG
		Serial.print("address_count before for read loop = ");
		Serial.println(address_count);
	#endif
	
	// Now read the data
	Wire.requestFrom(BQ32000_CTRL_ID, NUMBER_OF_NORMAL_REGISTERS);
	
	#ifdef DEBUG
	Serial.println("Entering read loop");
	#endif
	
	for(int i=0; i<NUMBER_OF_NORMAL_REGISTERS; i++)
	{
		rtc_bcd[address_count] = Wire.read();
		
		#ifdef DEBUG
			Serial.print(rtc_bcd[address_count]);
			Serial.print(" - ");
			Serial.print(rtc_bcd_addresses[address_count]);
			Serial.print(" - ");
			Serial.println(address_count);
		#endif
		
		address_count++;
	}
	
	#ifdef DEBUG
		Serial.println("");
		Serial.print("address_count after for read loop = ");
		Serial.println(address_count);
	#endif

	// Now read from special registers
	Wire.beginTransmission(BQ32000_CTRL_ID);

	// Set the pointer to the start address of the special registers
	Wire.write(rtc_bcd_addresses[address_count]);// reset register pointer

	Wire.endTransmission();
	
	Wire.requestFrom(BQ32000_CTRL_ID, NUMBER_OF_SPECIAL_REGISTERS);
	// Now read the data
	#ifdef DEBUG
		Serial.println("Entering read loop - SR");
	#endif
	
	for(int i=0; i<NUMBER_OF_SPECIAL_REGISTERS; i++)
	{

		rtc_bcd[address_count] = Wire.read();
		
		#ifdef DEBUG
			Serial.print(rtc_bcd[address_count]);
			Serial.print(" - ");
			Serial.print(rtc_bcd_addresses[address_count]);
			Serial.print(" - ");
			Serial.println(address_count);
		#endif
		
		address_count++;
	}
	
	#ifdef DEBUG
		Serial.println("");
		Serial.println("");
	#endif
	

}

void BQ32000::save(void)
{
	int address_count = 0;
	
	// First save the values to the normal registers
	Wire.beginTransmission(BQ32000_CTRL_ID);
	
	// First set the register pointer to initial address
	//Wire.write(rtc_bcd_addresses[address_count]);// reset register pointer
	Wire.write(rtc_bcd_addresses[address_count]);

	
	// Now write the data
	#ifdef DEBUG
	Serial.println("Entering write loop");
	#endif
	
	for(int i=0; i<NUMBER_OF_NORMAL_REGISTERS; i++)
	{
		Wire.write(rtc_bcd[address_count]);
		
		#ifdef DEBUG
			Serial.print(rtc_bcd[address_count]);
			Serial.print(" - ");
			Serial.print(rtc_bcd_addresses[address_count]);
			Serial.print(" - ");
			Serial.println(address_count);
		#endif
		
		address_count++;
	}
	
	#ifdef DEBUG
		Serial.println("");
	#endif
	
	Wire.endTransmission();
	
	// Now save to the special registers
	Wire.beginTransmission(BQ32000_CTRL_ID);
	
	Wire.write(rtc_bcd_addresses[address_count]);// reset register pointer
	
	// Now write the data
	#ifdef DEBUG
	Serial.println("Entering write loop - SR");
	#endif
	
	for(int i=0; i<NUMBER_OF_SPECIAL_REGISTERS; i++)
	{
		Wire.write(rtc_bcd[address_count]);
		
		#ifdef DEBUG
			Serial.print(rtc_bcd[address_count]);
			Serial.print(" - ");
			Serial.print(rtc_bcd_addresses[address_count]);
			Serial.print(" - ");
			Serial.println(address_count);
		#endif
		
		address_count++;
	}
	
	#ifdef DEBUG
		Serial.println("");
		Serial.println("");
	#endif
	
	Wire.endTransmission();
	
}


// PUBLIC FUNCTIONS
void BQ32000::get(int *rtc, boolean refresh)   // Aquire data from buffer and convert to int, refresh buffer if required
{
	if(refresh) read();
	for(int i=0;i<NUMBER_OF_REGISTERS;i++)  // cycle through each component, create array of data
	{
		rtc[i]=get(i, 0);
	}
}

int BQ32000::get(int c, boolean refresh)  // aquire individual RTC item from buffer, return as int, refresh buffer if required
{
	if(refresh) read();
	int v=-1;
	switch(c)
	{
		case BQ32000_SEC:
		v=(10*((rtc_bcd[BQ32000_SEC] & BQ32000_HI_SEC)>>4))+(rtc_bcd[BQ32000_SEC] & BQ32000_LO_BCD);
		break;
		case BQ32000_MIN:
		v=(10*((rtc_bcd[BQ32000_MIN] & BQ32000_HI_MIN)>>4))+(rtc_bcd[BQ32000_MIN] & BQ32000_LO_BCD);
		break;
		case BQ32000_HR:
		v=(10*((rtc_bcd[BQ32000_HR] & BQ32000_HI_HR)>>4))+(rtc_bcd[BQ32000_HR] & BQ32000_LO_BCD);
		break;
		case BQ32000_DOW:
		v=rtc_bcd[BQ32000_DOW] & BQ32000_LO_DOW;
		break;
		case BQ32000_DATE:
		v=rtc_bcd[BQ32000_DATE]/16 * 10 +  rtc_bcd[BQ32000_DATE] % 16;
		break;
		case BQ32000_MTH:
		v=(10*((rtc_bcd[BQ32000_MTH] & BQ32000_HI_MTH)>>4))+(rtc_bcd[BQ32000_MTH] & BQ32000_LO_BCD);
		break;
		case BQ32000_YR:
		v=BQ32000_BASE_YR + rtc_bcd[BQ32000_YR]/16 * 10 + rtc_bcd[BQ32000_YR] % 16;
		break;
		case BQ32000_CFG1:
		v=rtc_bcd[BQ32000_CFG1];
		break;
		case BQ32000_TCH2:
		v=rtc_bcd[BQ32000_TCH2];
		break;
		case BQ32000_CHG2:
		v=rtc_bcd[BQ32000_CHG2];
		break;
		case BQ32000_SFK1:
		v=rtc_bcd[BQ32000_SFK1];
		break;
		case BQ32000_SFK2:
		v=rtc_bcd[BQ32000_SFK2];
		break;
		case BQ32000_SFR:
		v=rtc_bcd[BQ32000_SFR];
		break;
	} // end switch
	return v;
}

void BQ32000::set(int c, int v)  // Update buffer, then update the chip
{
	read(); //first read the buffer to preserve current time when writing modified values, as the function writes all values at the same time
	switch(c)
	{
		case BQ32000_SEC:
		if(v<60 && v>-1)
		{
			//preserve existing clock state (running/stopped)
			int state=rtc_bcd[BQ32000_SEC] & BQ32000_CLOCKHALT;
			rtc_bcd[BQ32000_SEC]=state | ((v / 10)<<4) + (v % 10);
		}
		break;
		case BQ32000_MIN:
		if(v<60 && v>-1)
		{
			rtc_bcd[BQ32000_MIN]=((v / 10)<<4) + (v % 10);
		}
		break;
		case BQ32000_HR:
		// TODO : AM/PM  12HR/24HR
		if(v<24 && v>-1)
		{
			rtc_bcd[BQ32000_HR]=((v / 10)<<4) + (v % 10);
		}
		break;
		case BQ32000_DOW:
		if(v<8 && v>-1)
		{
			rtc_bcd[BQ32000_DOW]=v;
		}
		break;
		case BQ32000_DATE:
		if(v<32 && v>-1)
		{
			rtc_bcd[BQ32000_DATE]=((v / 10)<<4) + (v % 10);
		}
		break;
		case BQ32000_MTH:
		if(v<13 && v>-1)
		{
			rtc_bcd[BQ32000_MTH]=((v / 10)<<4) + (v % 10);
		}
		break;
		case BQ32000_YR:
		if(v<50 && v>-1)
		{
			rtc_bcd[BQ32000_YR]=((v / 10)<<4) + (v % 10);
		}
		break;
	} // end switch
	save();
}

void BQ32000::stop(void)
{
	// set the ClockHalt bit high to stop the rtc
	// this bit is part of the seconds byte
	read(); 	//refresh buffer first to preserve existing time
	rtc_bcd[BQ32000_SEC]=rtc_bcd[BQ32000_SEC] | BQ32000_CLOCKHALT; //set the halt bit in the seconds value
	save(); //write register to the chip
}

void BQ32000::start(void)
{
	// unset the ClockHalt bit to start the rtc
	read();				 //refresh buffer to get existing time
	if (rtc_bcd[BQ32000_SEC] >> 7 == 1) {
		rtc_bcd[BQ32000_SEC]-=BQ32000_CLOCKHALT; //unset the halt bit in the seconds value
	}
	save(); //write register to the chip
}

void BQ32000::resetRegisters(void)
{
	read();
	rtc_bcd[BQ32000_SEC] =  B01010001; // (81) 59 seconds
	rtc_bcd[BQ32000_MIN] =  B00010001; // (17) 11 minutes
	rtc_bcd[BQ32000_HR] =   B00100010; // (34) 22 hours
	rtc_bcd[BQ32000_DOW] =  B00000010; // (2) Monday
	rtc_bcd[BQ32000_DATE] = B00001000; // (8) 08th
	rtc_bcd[BQ32000_MTH] =  B00001001; // (9) September
	rtc_bcd[BQ32000_YR] =   B00010100; // (20) 2014
	rtc_bcd[BQ32000_CFG1] = B11000000; // (192) Enable IRQ
	rtc_bcd[BQ32000_TCH2] = B00000000; // No trickle charge
	rtc_bcd[BQ32000_CHG2] = B00000000; //
	rtc_bcd[BQ32000_SFK1] = 0x5E; // 94
	rtc_bcd[BQ32000_SFK2] = 0xC7; // 199
	rtc_bcd[BQ32000_SFR] =  B00000001; // 1Hz Output
	save();
	read();
}

void BQ32000::enableIRQ(void)
{
	// Requires writing to special registers
	read(); // refresh buffer to get existing time
	rtc_bcd[BQ32000_SFK1] = 0x5E;
	rtc_bcd[BQ32000_SFK2] = 0xC7;
	rtc_bcd[BQ32000_SFR] = rtc_bcd[BQ32000_SFR] | BQ32000_FTF1HZ;
	rtc_bcd[BQ32000_CFG1]= rtc_bcd[BQ32000_CFG1] | BQ32000_IRQOUT;
	//Serial.println(rtc_bcd[BQ32000_SFR]);
	//Serial.println(rtc_bcd[BQ32000_CFG1]);
	save(); // write register to the chip
}

void BQ32000::outputRegisterValues(void) {
	read();
	for (int i=0; i<NUMBER_OF_REGISTERS; i++) {
		Serial.println(rtc_bcd[i]);
	}
}
