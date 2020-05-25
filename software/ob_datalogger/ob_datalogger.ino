/*
Ocean Buoy Data Logger - Arduino Firmware
Rev 1.0
Author: Andrew Li
Year: 2014

*/

// DEFINES
//#define DEBUG // Code will not work with debug defined as Serial.print cause SRAM to run out, which in turn stops SD card functions to work properly
#define LED_PULSE
//#define SAFETY_LIGHT_ACTIVE
#define COMMAND_SIZE 4
#define SERIAL_BR 57600 // Communication baud rate for UART serial
#define SAMPLING_FREQ 2
#define LEN_HEADER_STRING 160

// EEPROM ADDRESS MAPPING
#define START_YEAR 0
#define START_MONTH 1
#define START_DAY 2
#define START_HOUR 3
#define START_MINUTE 4
#define START_SECOND 5

#define END_YEAR 6
#define END_MONTH 7
#define END_DAY 8
#define END_HOUR 9
#define END_MINUTE 10
#define END_SECOND 11

//#define LIGHT_THRESHOLD_LOW 12
//#define LIGHT_THRESHOLD_HIGH 13

// LIGHT THRESHOLD VALUES. These must be between 0 and 255 (8 bits)
#define LIGHT_THRESHOLD_VALUE_LOW 200
#define LIGHT_THRESHOLD_VALUE_HIGH 210

// INCLUDES
#include "Arduino.h"
#include <EEPROM.h>
#include "Wire.h"
#include <BQ32000.h>
#include <SD.h> // For handling SD card functions.
#include <ADXL345.h> // This library can also be used with ADXL343. It is address compatible.
#include <SSC.h> // for 30PSI pressure sensor
#include <avr/pgmspace.h>

// PIN ASSIGNMENTS

// Interrupt pins
const uint8_t isr_rtc = 0;
const uint8_t isr_xrf = 1;

// Analog pins
const uint8_t pin_water_depth = A0;
const uint8_t pin_air_pressure_1 = A1;
const uint8_t pin_light_detect = A2;
const uint8_t pin_vmeasure = A3;

// LED drive
const uint8_t pin_led_drive = 9;

// Current source drive for water depth measurement
const uint8_t pin_current_source_drive = 8;

// Output LEDs for development
const uint8_t pin_led_ind_1 = 5;
const uint8_t pin_led_ind_2 = 6;

// Chip select pin for SD MISO
const uint8_t pin_chip_select = 10;

// XRF Wireless Comms
const uint8_t pin_wireless_comms_shutdown = 4;
const uint8_t pin_wireless_comms_heartbeat = 3;

// GLOBALS
unsigned int water_depth = 0;
unsigned int air_pressure_1 = 0; // From 100PSI analog pressure sensor
unsigned int air_pressure_2 = 0; // From 30PSI digital I2C pressure sensor
unsigned int temperature = 0;
unsigned int light_level = 0;
unsigned int voltage_measurement = 0; // This can be either the battery voltage or the voltage of the solar panels.
int accel_x,accel_y,accel_z; // The X, Y and Z acceleration. Acceleration can have negative values, hence using int.
unsigned int time[6]; // An array for storing the time. The order for time[6] is YY MM DD HH MM SS

// OBJECTS
ADXL345 ADXL; // Variable ADXL is an instance of the ADXL345 library
SSC SSCSensor(0x28); // Variable SSCSensor is the handle to access the SSC 30PSI Pressure Sensor. 0x28 is the I2C address

// STORING DATA. Data should be stored in this order. This string is long, so store in program memory
//const prog_char header_string[] PROGMEM = {"Data Point Counter, Water Depth, Air Pressure (100PSI), Air Pressure (30PSI), Temperature, Light Level, Voltage, Acceleration X, Acceleration Y, Acceleration Z"};
const prog_char header_string[] PROGMEM = {"dpc,wd,ap100,ap30,tmp,llvl,v,ax,ay,az"};
String filename = ""; // String for holding the filename of the datafile

// FLAGS
bool flag_create_new_file = 0;
bool flag_error = 0;
bool flag_flashSafetyLight = 0;
bool flag_start = 0;

// COUNTERS
uint8_t isr_count = 0;
unsigned int write_count = 1;

// LED Drive Variables
uint8_t counter1;
uint8_t counter2;
bool led_switch;
bool led_state;

// We are using uint8_t (BYTE) because we want to be able to store these values in EEPROM
uint8_t lightThresholdLow;
uint8_t lightThresholdHigh;
const uint8_t duty_cycle = 50; // Should be a value between 0 and 100
const uint8_t nunber_of_flashes = 5;

void setup() {
	
	// Initialise the serial port
	Serial.begin(SERIAL_BR);
	
	// Initialise peripherals
	initialisePins();
	initialiseAccel();
	initialisePressureSensor30SPI();
	initialiseSD(); // This will also set the flag_create_new_file = 1
	initialiseRTC();
	initialiseSafetyLight();
	attachInterrupt(isr_rtc, rtcISR, CHANGE); // A CHANGE interrupt triggers every 500ms
}

void loop() {
	// The code is design to be interrupt driven, hence no code here
}

// This ISR is triggered every 500ms by the square wave output from RTC
void rtcISR() {
	
	#ifdef SAFETY_LIGHT_ACTIVE
	
	if (flag_flashSafetyLight) {
		activateSafetyLight();
	}
	
	#endif
	
	interrupts();
	mainRoutine();
	noInterrupts();
}

// This function executes when there is data recevied from serial port
void serialEvent() {
	
	delay(50); // Give sufficient time for data to stream to Arduino
	String query = retrieveSerial();
	Serial.print("Query is: ");
	Serial.println(query);
	interpretCommand(query);
}

// The bulk of the code will reside here. This routine must complete within 500ms
void mainRoutine() {
	
	// To signal the start of the main routine
	#ifdef LED_PULSE
	digitalWrite(pin_led_ind_2, HIGH);
	#endif
	
	switch (flag_error) {
		
		case 0:
		// Analog measurements
		water_depth = measureWaterDepth();
		air_pressure_1 = measureAirPressure100PSI();
		light_level = measureLightLevel();
		flag_flashSafetyLight = doesSafetyLightNeedToSwitchOn(light_level);
		voltage_measurement = measureVoltage();

		// IC2 DEVICES - Digital measurements
		accel_x = readAccelerationX(); // measure X acceleration
		accel_y = readAccelerationY(); // measure Y acceleration
		accel_z = readAccelerationZ(); // measure Z acceleration
		
		air_pressure_2 = measureAirPressure30PSI();
		temperature = measureTemperature();
		
		if (!flag_create_new_file) {
			flag_create_new_file = isStartOfNewHour();
		}

		saveData(); // Save data to SD
		
		write_count++;
		
		break;
		
		case 1:
		displayError();
		break; // Not needed but good practice
	}
	
	#ifdef LED_PULSE
	digitalWrite(pin_led_ind_2, LOW);
	#endif
}

void displayError() {
	digitalWrite(pin_led_ind_1, digitalRead(pin_led_ind_1) ^ 1);
}

// Initialise drive pins
void initialisePins () {
	
	// Output pins
	pinMode(pin_led_ind_1, OUTPUT);
	pinMode(pin_led_ind_2, OUTPUT);
	pinMode(pin_led_drive, OUTPUT);
	pinMode(pin_current_source_drive, OUTPUT);
	
	// Input pins. These pins are not used in this revision of the firmware
	pinMode(pin_wireless_comms_heartbeat, INPUT);
	pinMode(pin_wireless_comms_shutdown, INPUT); // For now
}

unsigned int measureVoltage() {
	return analogRead(pin_vmeasure);
}

unsigned int measureLightLevel() {
	return analogRead(pin_light_detect);
}
