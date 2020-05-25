/*
*
********************************************************************************************************
* 			BQ32000.h 	 library for BQ32000 I2C rtc clock				*
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


// ensure this library description is only included once
#ifndef BQ32000_h
#define BQ32000_h

// include types & constants of Wiring core API
// this "if" is for compatibility with both arduino 1.0 and previous versions
#if defined(ARDUINO) && ARDUINO >= 100
#include "Arduino.h"
#else
#include "WProgram.h"
#endif

// include types & constants of Wire ic2 lib
#include <../Wire/Wire.h>

#define BQ32000_SEC 0
#define BQ32000_MIN 1
#define BQ32000_HR 2
#define BQ32000_DOW 3
#define BQ32000_DATE 4
#define BQ32000_MTH 5
#define BQ32000_YR 6
#define BQ32000_CFG1 7   // Calibration and configuration 1
#define BQ32000_TCH2 8   // Trickle charge enable
#define BQ32000_CHG2 9   // Configuration 2

// Special function registers
#define BQ32000_SFK1 10  // Special function key 1 (address: 0x20)
#define BQ32000_SFK2 11  // Special function key 2 (address: 0x21)
#define BQ32000_SFR 12   // Special function register (address: 0x22)


#define BQ32000_BASE_YR 2000

#define BQ32000_CTRL_ID B1101000  //BQ32000

// Define register bit masks
#define BQ32000_CLOCKHALT B10000000
#define BQ32000_FTF1HZ B00000001
#define BQ32000_IRQOUT B11000000

#define BQ32000_LO_BCD  B00001111
#define BQ32000_HI_BCD  B11110000

#define BQ32000_HI_SEC  B01110000
#define BQ32000_HI_MIN  B01110000
#define BQ32000_HI_HR   B00110000
#define BQ32000_LO_DOW  B00000111
#define BQ32000_HI_DATE B00110000
#define BQ32000_HI_MTH  B00110000
#define BQ32000_HI_YR   B11110000

#define NUMBER_OF_NORMAL_REGISTERS 10
#define NUMBER_OF_SPECIAL_REGISTERS 3
#define NUMBER_OF_REGISTERS 13

// library interface description
class BQ32000
{
	// user-accessible "public" interface
	public:
	BQ32000();
	void get(int *, boolean);
	int get(int, boolean);
	void set(int, int);
	void start(void);
	void stop(void);
	void enableIRQ(void);
	void resetRegisters(void);
	void outputRegisterValues(void);
	

	// library-accessible "private" interface
	private:
	byte rtc_bcd[NUMBER_OF_REGISTERS]; // used prior to read/set BQ32000 registers;
	byte rtc_bcd_addresses[NUMBER_OF_REGISTERS]; // this holds the address to the registers.
	void read(void);
	void save(void);
};

extern BQ32000 RTC;

#endif


