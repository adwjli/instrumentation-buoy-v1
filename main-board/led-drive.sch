EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 4
Title "Main Board"
Date "2020-04-24"
Rev "C"
Comp "Project: Instrumentation Buoy V1"
Comment1 "Drawn by: Andrew Li"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	7300 4500 7300 4300
Wire Wire Line
	7300 3800 7300 3700
Connection ~ 7300 3700
Wire Wire Line
	8450 2800 8500 2800
Wire Wire Line
	8450 2250 8450 2800
Wire Wire Line
	8500 3000 8450 3000
Wire Wire Line
	3400 2250 3400 2850
Wire Wire Line
	3400 2850 3300 2850
Wire Wire Line
	3300 3050 3400 3050
Wire Wire Line
	3400 3050 3400 3700
Wire Wire Line
	3400 4650 3400 4250
Text Notes 9150 2900 0    50   ~ 0
Connect to\nLED circuit
Wire Wire Line
	7300 4500 8150 4500
Wire Wire Line
	8150 4650 8150 4500
Connection ~ 8150 4500
Text GLabel 2150 6800 0    50   Input ~ 0
LED_DRIVE_PWM
$Comp
L power:+BATT #PWR?
U 1 1 53A6B05B
P 8450 2250
F 0 "#PWR?" H 8450 2200 20  0001 C CNN
F 1 "+BATT" H 8450 2390 50  0000 C CNN
F 2 "" H 8450 2250 50  0001 C CNN
F 3 "" H 8450 2250 50  0001 C CNN
	1    8450 2250
	1    0    0    -1  
$EndComp
Text GLabel 2150 7050 0    50   Output ~ 0
LIGHT_DETECT_A/D
Wire Wire Line
	8450 3000 8450 3300
Wire Wire Line
	8450 4500 8450 3800
Wire Wire Line
	6500 3700 7300 3700
Wire Wire Line
	2150 7050 3400 7050
Wire Wire Line
	2150 6800 3400 6800
Text Label 3400 7050 2    50   ~ 0
LIGHT_DETECT_A/D
Text Label 3400 6800 2    50   ~ 0
LED_DRIVE_PWM
Text Label 5800 3700 2    50   ~ 0
LIGHT_DETECT_A/D
Text Label 6500 3700 0    50   ~ 0
LED_DRIVE_PWM
Wire Wire Line
	4650 4650 4650 4200
Wire Wire Line
	4650 3800 4650 3700
Connection ~ 4650 3700
$Comp
L power:VAA #PWR?
U 1 1 53ADFECC
P 3400 2250
F 0 "#PWR?" H 3400 2310 30  0001 C CNN
F 1 "VAA" H 3400 2400 50  0000 C CNN
F 2 "" H 3400 2250 50  0001 C CNN
F 3 "" H 3400 2250 50  0001 C CNN
	1    3400 2250
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 53AE09B6
P 3400 4650
F 0 "#PWR?" H 3400 4650 50  0001 C CNN
F 1 "GNDA" H 3400 4500 50  0000 C CNN
F 2 "" H 3400 4650 50  0001 C CNN
F 3 "" H 3400 4650 50  0001 C CNN
	1    3400 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 53AE09BE
P 8150 4650
F 0 "#PWR?" H 8150 4650 50  0001 C CNN
F 1 "GNDD" H 8150 4525 50  0000 C CNN
F 2 "" H 8150 4650 50  0001 C CNN
F 3 "" H 8150 4650 50  0001 C CNN
	1    8150 4650
	1    0    0    -1  
$EndComp
Text Notes 2750 2900 2    50   ~ 0
Photoresistor: VT90N1\n6K (light) - 200K (dark)
$Comp
L power:GNDA #PWR?
U 1 1 53B231BE
P 4650 4650
F 0 "#PWR?" H 4650 4650 50  0001 C CNN
F 1 "GNDA" H 4650 4500 50  0000 C CNN
F 2 "" H 4650 4650 50  0001 C CNN
F 3 "" H 4650 4650 50  0001 C CNN
	1    4650 4650
	1    0    0    -1  
$EndComp
$Comp
L Connectors:ECS00067 P?
U 1 1 53B8DD64
P 2950 2950
F 0 "P?" V 2900 2950 50  0000 C CNN
F 1 "ECS00067" H 2950 2700 50  0001 C CNN
F 2 "ECFootprints:ECS00067F" H 2800 2850 50  0001 C CNN
F 3 "${INTERNAL_PARTS_LIB}/Datasheets/Connectors/JST - PH Series.pdf" H 2900 2950 50  0001 C CNN
F 4 "2x1" H 2950 2600 50  0001 C CNN "Component Value"
F 5 "B2B-PH-SM4-TB(LF)(SN)" V 3100 2950 50  0001 C CNN "Manufacturer Part Number"
F 6 "JST" H 2950 3150 50  0001 C CNN "Manufacturer"
F 7 "PH Series" H 2950 2500 50  0001 C CNN "Series"
F 8 "2-way, header, 2mm pitch, vertical, SMD, PH Series" H 2950 2400 50  0001 C CNN "Part Description"
	1    2950 2950
	-1   0    0    -1  
$EndComp
$Comp
L Resistors:ECS00085 R?
U 1 1 53B8DDA8
P 3400 4000
F 0 "R?" H 3400 4080 50  0000 C CNN
F 1 "ECS00085" H 3400 4250 50  0001 C CNN
F 2 "ECFootprints:EC0603" H 3400 3930 30  0001 C CNN
F 3 "${INTERNAL_PARTS_LIB}/Datasheets/Resistors/Vishay - CRCW Series - Thick Film.pdf" H 3400 4000 30  0001 C CNN
F 4 "56K" H 3400 4000 50  0000 C CNN "Component Value"
F 5 "CRCW060356K0FKEAHP" H 3400 3900 50  0001 C CNN "Manufacturer Part Number"
F 6 "Vishay" H 3400 4150 50  0001 C CNN "Manufacturer"
F 7 "CRCW Series" H 3400 3800 50  0001 C CNN "Series"
F 8 "56K, 0603, 1%, 0.25W, Thick Film, High Power" H 3400 3700 50  0001 C CNN "Part Description"
	1    3400 4000
	0    -1   -1   0   
$EndComp
$Comp
L Resistors:ECS00045 R?
U 1 1 53B8DE1E
P 7300 4050
F 0 "R?" H 7300 4130 50  0000 C CNN
F 1 "ECS00045" H 7300 4300 50  0001 C CNN
F 2 "ECFootprints:EC0603" H 7300 3980 30  0001 C CNN
F 3 "${INTERNAL_PARTS_LIB}/Datasheets/Resistors/Panasonic - ERJ Series - Thick Film.pdf" H 7300 4050 30  0001 C CNN
F 4 "10K" H 7300 4050 50  0000 C CNN "Component Value"
F 5 "ERJ3GEYJ103V" H 7300 3950 50  0001 C CNN "Manufacturer Part Number"
F 6 "Panasonic" H 7300 4200 50  0001 C CNN "Manufacturer"
F 7 "ERJ Series" H 7300 3850 50  0001 C CNN "Series"
F 8 "10K, 0603, 5%, 0.1W, Thick Film" H 7300 3750 50  0001 C CNN "Part Description"
	1    7300 4050
	0    -1   -1   0   
$EndComp
$Comp
L Capacitors:ECS00075 C?
U 1 1 53B8DE4F
P 4650 4000
F 0 "C?" H 4650 4100 50  0000 L CNN
F 1 "ECS00075" V 4400 3850 40  0001 L CNN
F 2 "ECFootprints:EC0603_C" H 4688 3850 30  0001 C CNN
F 3 "${INTERNAL_PARTS_LIB}/Datasheets/Capacitors/Murata GRM Capacitors/GRM188R71C104KA01#.pdf" H 4650 4000 60  0001 C CNN
F 4 "100nF" H 4550 3900 40  0000 C CNN "Component Value"
F 5 "GRM188R71C104KA01D" V 4800 4000 40  0001 C CNN "Manfacturer Part Number"
F 6 "Murata" V 4500 4000 40  0001 C CNN "Manufacturer"
F 7 "GRM Series" V 4900 4000 40  0001 C CNN "Series"
F 8 "100nF, 0603, 10%, 16V, X7R, Ceramic" V 5000 3950 40  0001 C CNN "Part Description"
	1    4650 4000
	1    0    0    -1  
$EndComp
$Comp
L Connectors:ECS00067 P?
U 1 1 53B8DED5
P 8850 2900
F 0 "P?" V 8800 2900 50  0000 C CNN
F 1 "ECS00067" H 8850 2650 50  0001 C CNN
F 2 "ECFootprints:ECS00067F" H 8700 2800 50  0001 C CNN
F 3 "${INTERNAL_PARTS_LIB}/Datasheets/Connectors/JST - PH Series.pdf" H 8800 2900 50  0001 C CNN
F 4 "2x1" H 8850 2550 50  0001 C CNN "Component Value"
F 5 "B2B-PH-SM4-TB(LF)(SN)" V 9000 2900 50  0001 C CNN "Manufacturer Part Number"
F 6 "JST" H 8850 3100 50  0001 C CNN "Manufacturer"
F 7 "PH Series" H 8850 2450 50  0001 C CNN "Series"
F 8 "2-way, header, 2mm pitch, vertical, SMD, PH Series" H 8850 2350 50  0001 C CNN "Part Description"
	1    8850 2900
	1    0    0    -1  
$EndComp
$Comp
L Transistors:ECS00087 Q?
U 1 1 53B8DEFB
P 8350 3550
F 0 "Q?" H 8350 3451 50  0000 R CNN
F 1 "ECS00087" H 8200 3700 50  0001 R CNN
F 2 "ECFootprints:ECSOT416" H 8220 3702 50  0001 C CNN
F 3 "${INTERNAL_PARTS_LIB}/Datasheets/Transistors/On Semiconductor - NTA4153N - NMOS.pdf" H 8350 3600 50  0001 C CNN
F 4 "NTA4153NT1G" H 8050 3600 50  0001 C CNN "Manufacturer Part Number"
F 5 "On Semiconductor" H 8050 3800 50  0001 C CNN "Manufacturer"
F 6 "MOSFET, N-Channel, 0.915A, 0R127" H 8050 3900 50  0001 C CNN "Part Description"
	1    8350 3550
	1    0    0    -1  
$EndComp
Connection ~ 3400 3700
$Comp
L Resistors:ECS00083 R?
U 1 1 53D2EA70
P 4050 3700
F 0 "R?" H 4050 3780 50  0000 C CNN
F 1 "ECS00083" H 4050 3950 50  0001 C CNN
F 2 "ECFootprints:EC0603" H 4050 3630 30  0001 C CNN
F 3 "${INTERNAL_PARTS_LIB}/Datasheets/Resistors/Bourns - CR Series - Thick Film.pdf" H 4050 3700 30  0001 C CNN
F 4 "1K5" H 4050 3700 50  0000 C CNN "Component Value"
F 5 "CR0603-FX-1501ELF" H 4050 3600 50  0001 C CNN "Manufacturer Part Number"
F 6 "Bourns" H 4050 3850 50  0001 C CNN "Manufacturer"
F 7 "CR Series" H 4050 3500 50  0001 C CNN "Series"
F 8 "1K5, 0603, 1%,  0.1W, Thick Film" H 4050 3400 50  0001 C CNN "Part Description"
	1    4050 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 3700 3400 3700
Wire Wire Line
	4300 3700 4650 3700
$Comp
L Resistors:ECS00080 R?
U 1 1 53D76744
P 7750 3700
F 0 "R?" H 7750 3780 50  0000 C CNN
F 1 "ECS00080" H 7750 3950 50  0001 C CNN
F 2 "ECFootprints:EC0603" H 7750 3630 30  0001 C CNN
F 3 "${INTERNAL_PARTS_LIB}/Datasheets/Resistors/Vishay - CRCW Series - Thick Film.pdf" H 7750 3700 30  0001 C CNN
F 4 "36R" H 7750 3700 50  0000 C CNN "Component Value"
F 5 "CRCW060336R0FKEA" H 7750 3600 50  0001 C CNN "Manufacturer Part Number"
F 6 "Vishay" H 7750 3850 50  0001 C CNN "Manufacturer"
F 7 "CRCW Series" H 7750 3500 50  0001 C CNN "Series"
F 8 "36R, 0603, 0.1W,  Thick Film" H 7750 3400 50  0001 C CNN "Part Description"
	1    7750 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 3700 8050 3700
Wire Wire Line
	7300 3700 7500 3700
Wire Wire Line
	8150 4500 8450 4500
Wire Wire Line
	4650 3700 5800 3700
Wire Wire Line
	3400 3700 3400 3750
$EndSCHEMATC
