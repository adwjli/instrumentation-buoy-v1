EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 4
Title "Main Board"
Date "2020-04-24"
Rev "C"
Comp "Project: Instrumentation Buoy V1"
Comment1 "Drawn by: Andrew Li"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 1900 6650 0    50   Output ~ 0
AIR_PRESSURE_1_A/D
Text GLabel 1900 6800 0    50   Output ~ 0
WATER_DEPTH_A/D
Text Notes 2200 1300 0    50   ~ 0
Accelerometer
NoConn ~ 1750 1700
NoConn ~ 1750 1800
Text Label 3650 1500 2    50   ~ 0
SCL
Text Label 3650 1600 2    50   ~ 0
SDA
NoConn ~ 3350 2000
NoConn ~ 3350 2100
Text Notes 1900 2700 0    50   ~ 0
I2C address is 0x53\n(followed by the R/W bit)\nThis translates to 0xA6 for\na write and 0xA7 for a read.
Text Notes 6400 1800 0    50   ~ 0
Precision resistor\nmay be required
Text Notes 5550 2850 2    50   ~ 0
Water\nDepth\nSensor
Text Notes 6400 1500 0    50   ~ 0
Current = 22 mA
Text Notes 4350 1600 0    50   ~ 0
Vz = 1.8V
Text Label 10950 5300 2    50   ~ 0
AIR_PRESSURE_1_A/D
Text Label 10950 2150 2    50   ~ 0
WATER_DEPTH_A/D
Text Label 3450 3750 0    50   ~ 0
WATER_DEPTH_ON/OFF
Text GLabel 1900 6950 0    50   Output ~ 0
SCL
Text GLabel 1900 7100 0    50   Output ~ 0
SDA
Wire Wire Line
	7900 5750 7900 5700
Wire Wire Line
	8450 2650 8450 2550
Wire Wire Line
	6150 5200 7500 5200
Wire Wire Line
	7400 6000 8800 6000
Wire Wire Line
	7400 6000 7400 5400
Wire Wire Line
	8800 6000 8800 5300
Wire Wire Line
	8500 5300 8800 5300
Connection ~ 8800 5300
Wire Wire Line
	9400 5300 9500 5300
Wire Wire Line
	9500 5950 9500 5800
Wire Wire Line
	9500 5300 9500 5400
Connection ~ 9500 5300
Wire Wire Line
	7850 3050 8300 3050
Wire Wire Line
	9350 3050 8800 3050
Wire Wire Line
	10000 2150 10100 2150
Wire Wire Line
	10100 2800 10100 2650
Wire Wire Line
	10100 2150 10100 2250
Connection ~ 10100 2150
Wire Wire Line
	1600 1900 1600 2000
Wire Wire Line
	1600 1900 1750 1900
Wire Wire Line
	1750 2000 1600 2000
Connection ~ 1600 2000
Wire Wire Line
	1750 2100 1600 2100
Connection ~ 1600 2100
Wire Wire Line
	1600 1350 1600 1400
Wire Wire Line
	1600 1500 1750 1500
Wire Wire Line
	1600 1600 1750 1600
Connection ~ 1600 1500
Wire Wire Line
	1000 1450 1000 1400
Wire Wire Line
	1000 1400 1300 1400
Connection ~ 1600 1400
Wire Wire Line
	1300 1450 1300 1400
Connection ~ 1300 1400
Wire Wire Line
	1300 1850 1300 2000
Wire Wire Line
	1000 1850 1000 2000
Wire Wire Line
	3650 2200 3650 2150
Wire Wire Line
	3650 1850 3650 1700
Wire Wire Line
	3650 1700 3350 1700
Wire Wire Line
	3350 1800 3500 1800
Wire Wire Line
	3500 1800 3500 2200
Wire Wire Line
	7700 2050 7850 2050
Wire Wire Line
	7850 2050 7850 1900
Connection ~ 7850 2050
Wire Wire Line
	7850 1400 7850 1300
Wire Wire Line
	7850 1300 8100 1300
Wire Wire Line
	8100 1300 8100 1400
Wire Wire Line
	5000 1750 5000 2000
Wire Wire Line
	5950 2000 5000 2000
Connection ~ 5000 2000
Wire Wire Line
	5000 3100 5700 3100
Wire Wire Line
	6250 2800 6250 3100
Wire Wire Line
	5700 3350 5700 3100
Connection ~ 5700 3100
Wire Wire Line
	3450 3750 4550 3750
Wire Wire Line
	4550 4350 5400 4350
Connection ~ 4550 3750
Wire Wire Line
	4550 4350 4550 4250
Wire Wire Line
	3650 1600 3350 1600
Wire Wire Line
	3650 1500 3350 1500
Wire Wire Line
	3500 2200 3650 2200
Wire Wire Line
	5000 1200 5000 1350
Wire Wire Line
	5400 4500 5400 4350
Connection ~ 5400 4350
Wire Wire Line
	5700 4350 5700 3850
Wire Wire Line
	6250 2200 6250 2300
Wire Wire Line
	5000 3100 5000 2700
Wire Wire Line
	6250 1200 6250 1250
Wire Wire Line
	6250 1800 6250 1750
Wire Wire Line
	6250 2600 6200 2600
Wire Wire Line
	6200 2800 6250 2800
Wire Wire Line
	6950 3100 6950 2250
Wire Wire Line
	6950 2250 7200 2250
Connection ~ 6250 3100
Wire Wire Line
	6250 2300 6700 2300
Wire Wire Line
	6700 2300 6700 2050
Wire Wire Line
	6700 2050 7200 2050
Connection ~ 6250 2300
Wire Wire Line
	5000 1200 5700 1200
Wire Wire Line
	5700 1150 5700 1200
Connection ~ 5700 1200
Wire Wire Line
	1900 6650 3200 6650
Wire Wire Line
	1900 6950 3200 6950
Wire Wire Line
	1900 7100 3200 7100
Text Label 3200 6950 2    50   ~ 0
SCL
Text Label 3200 7100 2    50   ~ 0
SDA
Wire Wire Line
	1900 6800 3200 6800
Text Label 3200 6650 2    50   ~ 0
AIR_PRESSURE_1_A/D
Text Label 3200 6800 2    50   ~ 0
WATER_DEPTH_A/D
Text Label 6150 5200 0    50   ~ 0
AIR_PRESSURE_1
Wire Wire Line
	7900 4750 7900 4800
Wire Wire Line
	8000 4800 7900 4800
Connection ~ 7900 4800
Wire Wire Line
	8500 4950 8500 4800
Wire Wire Line
	8500 4800 8400 4800
Text GLabel 1900 6350 0    50   Input ~ 0
WATER_DEPTH_ON/OFF
Wire Wire Line
	1900 6350 3200 6350
Text Label 3200 6350 2    50   ~ 0
WATER_DEPTH_ON/OFF
Wire Wire Line
	2400 3800 1550 3800
Text Label 1550 3800 0    50   ~ 0
SDA
Wire Wire Line
	2400 3900 1550 3900
Text Label 1550 3900 0    50   ~ 0
SCL
Wire Wire Line
	2400 4000 1550 4000
Text Label 1550 4000 0    50   ~ 0
~FAULT
Wire Wire Line
	2400 4100 1550 4100
Text Label 1550 4100 0    50   ~ 0
~CHARGE
Wire Wire Line
	2400 4650 1550 4650
Text Label 1550 4650 0    50   ~ 0
AIR_PRESSURE_1
Text Notes 1550 5100 0    50   ~ 0
Output From Power Board
Text GLabel 1900 7250 0    50   Output ~ 0
~FAULT
Text GLabel 1900 7400 0    50   Output ~ 0
~CHARGE
Wire Wire Line
	1900 7250 3200 7250
Wire Wire Line
	1900 7400 3200 7400
Text Label 3200 7250 2    50   ~ 0
~FAULT
Text Label 3200 7400 2    50   ~ 0
~CHARGE
Text Notes 1550 5300 0    50   ~ 0
Pressure 1 = 100 PSI\nPressure 2 = 30 PSI (now I2C)
NoConn ~ 2400 4450
NoConn ~ 2400 4550
Wire Wire Line
	8450 1650 8450 1750
Text Notes 900  2750 0    50   ~ 0
Tant cap C12 must\nbe placed close\nto VS
Wire Wire Line
	7400 5400 7500 5400
NoConn ~ 2400 4750
Text Notes 5550 5400 0    50   ~ 0
Receives signal from\n100PSI pressure sensor
Text Notes 3300 7250 0    50   ~ 0
Not used anymore
Text Notes 3300 7400 0    50   ~ 0
Not used anymore
Text Notes 650  4000 0    50   ~ 0
Not used anymore
Text Notes 650  4100 0    50   ~ 0
Not used anymore
Wire Wire Line
	5250 3750 5300 3750
Wire Wire Line
	8800 5300 8900 5300
Wire Wire Line
	9500 5300 10950 5300
Wire Wire Line
	10100 2150 10950 2150
Wire Wire Line
	1600 2000 1600 2100
Wire Wire Line
	1600 2100 1600 2300
Wire Wire Line
	1600 1500 1600 1600
Wire Wire Line
	1600 1400 1600 1500
Wire Wire Line
	1300 1400 1600 1400
Wire Wire Line
	7850 2050 8050 2050
Wire Wire Line
	5000 2000 5000 2200
Wire Wire Line
	5700 3100 6250 3100
Wire Wire Line
	4550 3750 4750 3750
Wire Wire Line
	5400 4350 5700 4350
Wire Wire Line
	6250 3100 6950 3100
Wire Wire Line
	6250 2300 6250 2600
Wire Wire Line
	5700 1200 6250 1200
Wire Wire Line
	7900 4800 7900 4900
$Comp
L Resistors:ECS00083 R?
U 1 1 53BA3681
P 5000 2450
F 0 "R?" H 5000 2550 50  0000 C CNN
F 1 "ECS00083" H 5000 2700 50  0001 C CNN
F 2 "ECFootprints:EC0603" H 5000 2380 30  0001 C CNN
F 3 "${INTERNAL_PARTS_LIB}/Datasheets/Resistors/Bourns - CR Series - Thick Film.pdf" H 5000 2450 30  0001 C CNN
F 4 "1K5" H 5000 2450 50  0000 C CNN "Component Value"
F 5 "CR0603-FX-1501ELF" H 5000 2350 50  0001 C CNN "Manufacturer Part Number"
F 6 "Bourns" H 5000 2600 50  0001 C CNN "Manufacturer"
F 7 "CR Series" H 5000 2250 50  0001 C CNN "Series"
F 8 "1K5, 0603, 1%,  0.1W, Thick Film" H 5000 2150 50  0001 C CNN "Part Description"
	1    5000 2450
	0    -1   -1   0   
$EndComp
$Comp
L Resistors:ECS00080 R?
U 1 1 53D760C8
P 5000 3750
F 0 "R?" H 5000 3850 50  0000 C CNN
F 1 "ECS00080" H 5000 4000 50  0001 C CNN
F 2 "ECFootprints:EC0603" H 5000 3680 30  0001 C CNN
F 3 "${INTERNAL_PARTS_LIB}/Datasheets/Resistors/Vishay - CRCW Series - Thick Film.pdf" H 5000 3750 30  0001 C CNN
F 4 "36R" H 5000 3750 50  0000 C CNN "Component Value"
F 5 "CRCW060336R0FKEA" H 5000 3650 50  0001 C CNN "Manufacturer Part Number"
F 6 "Vishay" H 5000 3900 50  0001 C CNN "Manufacturer"
F 7 "CRCW Series" H 5000 3550 50  0001 C CNN "Series"
F 8 "36R, 0603, 0.1W,  Thick Film" H 5000 3450 50  0001 C CNN "Part Description"
	1    5000 3750
	1    0    0    -1  
$EndComp
$Comp
L Resistors:ECS00085 R?
U 1 1 53D31E56
P 7850 1650
F 0 "R?" H 7850 1750 50  0000 C CNN
F 1 "ECS00085" H 7850 1900 50  0001 C CNN
F 2 "ECFootprints:EC0603" H 7850 1580 30  0001 C CNN
F 3 "${INTERNAL_PARTS_LIB}/Datasheets/Resistors/Vishay - CRCW Series - Thick Film.pdf" H 7850 1650 30  0001 C CNN
F 4 "56K" H 7850 1650 50  0000 C CNN "Component Value"
F 5 "CRCW060356K0FKEAHP" H 7850 1550 50  0001 C CNN "Manufacturer Part Number"
F 6 "Vishay" H 7850 1800 50  0001 C CNN "Manufacturer"
F 7 "CRCW Series" H 7850 1450 50  0001 C CNN "Series"
F 8 "56K, 0603, 1%, 0.25W, Thick Film, High Power" H 7850 1350 50  0001 C CNN "Part Description"
	1    7850 1650
	0    -1   -1   0   
$EndComp
$Comp
L Resistors:ECS00085 R?
U 1 1 53D31E4B
P 8550 3050
F 0 "R?" H 8550 2950 50  0000 C CNN
F 1 "ECS00085" H 8550 3300 50  0001 C CNN
F 2 "ECFootprints:EC0603" H 8550 2980 30  0001 C CNN
F 3 "${INTERNAL_PARTS_LIB}/Datasheets/Resistors/Vishay - CRCW Series - Thick Film.pdf" H 8550 3050 30  0001 C CNN
F 4 "56K" H 8550 3050 50  0000 C CNN "Component Value"
F 5 "CRCW060356K0FKEAHP" H 8550 2950 50  0001 C CNN "Manufacturer Part Number"
F 6 "Vishay" H 8550 3200 50  0001 C CNN "Manufacturer"
F 7 "CRCW Series" H 8550 2850 50  0001 C CNN "Series"
F 8 "56K, 0603, 1%, 0.25W, Thick Film, High Power" H 8550 2750 50  0001 C CNN "Part Description"
	1    8550 3050
	1    0    0    -1  
$EndComp
$Comp
L Resistors:ECS00085 R?
U 1 1 53D31E40
P 7450 2250
F 0 "R?" H 7450 2350 50  0000 C CNN
F 1 "ECS00085" H 7450 2500 50  0001 C CNN
F 2 "ECFootprints:EC0603" H 7450 2180 30  0001 C CNN
F 3 "${INTERNAL_PARTS_LIB}/Datasheets/Resistors/Vishay - CRCW Series - Thick Film.pdf" H 7450 2250 30  0001 C CNN
F 4 "56K" H 7450 2250 50  0000 C CNN "Component Value"
F 5 "CRCW060356K0FKEAHP" H 7450 2150 50  0001 C CNN "Manufacturer Part Number"
F 6 "Vishay" H 7450 2400 50  0001 C CNN "Manufacturer"
F 7 "CRCW Series" H 7450 2050 50  0001 C CNN "Series"
F 8 "56K, 0603, 1%, 0.25W, Thick Film, High Power" H 7450 1950 50  0001 C CNN "Part Description"
	1    7450 2250
	1    0    0    -1  
$EndComp
$Comp
L Resistors:ECS00085 R?
U 1 1 53D31E0C
P 7450 2050
F 0 "R?" H 7450 2150 50  0000 C CNN
F 1 "ECS00085" H 7450 2300 50  0001 C CNN
F 2 "ECFootprints:EC0603" H 7450 1980 30  0001 C CNN
F 3 "${INTERNAL_PARTS_LIB}/Datasheets/Resistors/Vishay - CRCW Series - Thick Film.pdf" H 7450 2050 30  0001 C CNN
F 4 "56K" H 7450 2050 50  0000 C CNN "Component Value"
F 5 "CRCW060356K0FKEAHP" H 7450 1950 50  0001 C CNN "Manufacturer Part Number"
F 6 "Vishay" H 7450 2200 50  0001 C CNN "Manufacturer"
F 7 "CRCW Series" H 7450 1850 50  0001 C CNN "Series"
F 8 "56K, 0603, 1%, 0.25W, Thick Film, High Power" H 7450 1750 50  0001 C CNN "Part Description"
	1    7450 2050
	1    0    0    -1  
$EndComp
$Comp
L Opamps:ECS00030 U?
U 2 1 53D2EA5F
P 8550 2150
F 0 "U?" H 8500 2350 50  0000 L CNN
F 1 "ECS00030" H 8500 2450 50  0001 L CNN
F 2 "ECFootprints:ECMSOP-8" H 8550 2150 50  0001 C CNN
F 3 "${INTERNAL_PARTS_LIB}/Datasheets/Opamps/Microchip - MCP6042 - Dual Package.pdf" H 8550 2150 50  0001 C CNN
F 4 "MCP6042-E/MS" H 8750 1950 50  0000 C CNN "Manufacturer Part Number"
F 5 "Microchip" H 8700 1850 50  0001 C CNN "Manufacturer"
F 6 "Dual Package, 8-MSOP, Unity Gain Stable" H 9150 2550 50  0001 C CNN "Part Description"
	2    8550 2150
	1    0    0    -1  
$EndComp
$Comp
L Opamps:ECS00030 U?
U 1 1 53D2EA3E
P 8000 5300
F 0 "U?" H 7950 5500 50  0000 L CNN
F 1 "ECS00030" H 7950 5600 50  0001 L CNN
F 2 "ECFootprints:ECMSOP-8" H 8000 5300 50  0001 C CNN
F 3 "${INTERNAL_PARTS_LIB}/Datasheets/Opamps/Microchip - MCP6042 - Dual Package.pdf" H 8000 5300 50  0001 C CNN
F 4 "MCP6042-E/MS" H 8200 5100 50  0000 C CNN "Manufacturer Part Number"
F 5 "Microchip" H 8150 5000 50  0001 C CNN "Manufacturer"
F 6 "Dual Package, 8-MSOP, Unity Gain Stable" H 8600 5700 50  0001 C CNN "Part Description"
	1    8000 5300
	1    0    0    -1  
$EndComp
$Comp
L Transistors:ECS00073 Q?
U 1 1 53BBD9E2
P 6150 2000
F 0 "Q?" H 6150 1851 50  0000 R CNN
F 1 "ECS00073" H 6000 2200 50  0001 R CNN
F 2 "ECFootprints:ECSOT323" H 6050 2102 50  0001 C CNN
F 3 "${INTERNAL_PARTS_LIB}/Datasheets/Transistors/NXP - BC857W - PNP.pdf" H 6150 2000 50  0001 C CNN
F 4 "BC857BW,115" H 5850 2100 50  0001 C CNN "Manufacturer Part Number"
F 5 "NXP" H 5850 2300 50  0001 C CNN "Manufacturer"
F 6 "BJT, PNP, 45V, 0.1A" H 5850 2400 50  0001 C CNN "Part Description"
	1    6150 2000
	1    0    0    1   
$EndComp
$Comp
L Diodes:ECS00072 D?
U 1 1 53BBD9B1
P 5000 1550
F 0 "D?" H 5000 1650 50  0000 C CNN
F 1 "ECS00072" H 5000 1750 50  0001 C CNN
F 2 "ECFootprints:ECS00072F" H 5000 1550 50  0001 C CNN
F 3 "${INTERNAL_PARTS_LIB}/Datasheets/Diodes/On Semiconductor - MMSZ4xxxT1G Series - Zener.pdf" H 5000 1550 50  0001 C CNN
F 4 "1.8V" H 5000 1850 50  0001 C CNN "Component Value"
F 5 "MMSZ4678T1G" H 5000 1450 50  0001 C CNN "Manufacturer Part Number"
F 6 "On Semiconductor" H 5000 1350 50  0001 C CNN "Manufacturer"
F 7 "Zener, 1.8V, 0.25W, SMD" H 5000 1250 50  0001 C CNN "Part Description"
	1    5000 1550
	0    -1   -1   0   
$EndComp
$Comp
L Connectors:ECS00029 P?
U 1 1 53B8D81B
P 2750 4600
F 0 "P?" V 2700 4600 50  0000 C CNN
F 1 "ECS00029" V 2800 4600 50  0001 C CNN
F 2 "ECFootprints:ECS00029F" H 2600 4500 50  0001 C CNN
F 3 "${INTERNAL_PARTS_LIB}/Datasheets/Connectors/Global Connector Technology - BF040 Series - SMD Header.pdf" H 2700 4600 50  0001 C CNN
F 4 "4x1" H 2750 4250 50  0001 C CNN "Component Value"
F 5 "BF040-04A-B2-0400-0260-0483-LD" V 2900 4600 50  0001 C CNN "Manufacturer Part Number"
F 6 "Global Connector Technology" H 2750 4350 50  0001 C CNN "Manufacturer"
F 7 "4-way, header, 2mm pitch, 4mm height, vertical, SMD, BF040 Series" H 2800 4150 50  0001 C CNN "Part Description"
	1    2750 4600
	1    0    0    -1  
$EndComp
$Comp
L Connectors:ECS00029 P?
U 1 1 53B8D7D3
P 2750 3950
F 0 "P?" V 2700 3950 50  0000 C CNN
F 1 "ECS00029" V 2800 3950 50  0001 C CNN
F 2 "ECFootprints:ECS00029F" H 2600 3850 50  0001 C CNN
F 3 "${INTERNAL_PARTS_LIB}/Datasheets/Connectors/Global Connector Technology - BF040 Series - SMD Header.pdf" H 2700 3950 50  0001 C CNN
F 4 "4x1" H 2750 3600 50  0001 C CNN "Component Value"
F 5 "BF040-04A-B2-0400-0260-0483-LD" V 2900 3950 50  0001 C CNN "Manufacturer Part Number"
F 6 "Global Connector Technology" H 2750 3700 50  0001 C CNN "Manufacturer"
F 7 "4-way, header, 2mm pitch, 4mm height, vertical, SMD, BF040 Series" H 2800 3500 50  0001 C CNN "Part Description"
	1    2750 3950
	1    0    0    -1  
$EndComp
$Comp
L Transistors:ECS00087 Q?
U 1 1 53B8D257
P 5600 3600
F 0 "Q?" H 5600 3501 50  0000 R CNN
F 1 "ECS00087" H 5450 3750 50  0001 R CNN
F 2 "ECFootprints:ECSOT416" H 5470 3752 50  0001 C CNN
F 3 "${INTERNAL_PARTS_LIB}/Datasheets/Transistors/On Semiconductor - NTA4153N - NMOS.pdf" H 5600 3650 50  0001 C CNN
F 4 "NTA4153NT1G" H 5300 3650 50  0001 C CNN "Manufacturer Part Number"
F 5 "On Semiconductor" H 5300 3850 50  0001 C CNN "Manufacturer"
F 6 "MOSFET, N-Channel, 0.915A, 0R127" H 5300 3950 50  0001 C CNN "Part Description"
	1    5600 3600
	1    0    0    -1  
$EndComp
$Comp
L Connectors:ECS00067 P?
U 1 1 53B8CCE2
P 5850 2700
F 0 "P?" V 5800 2700 50  0000 C CNN
F 1 "ECS00067" H 5850 2450 50  0001 C CNN
F 2 "ECFootprints:ECS00067F" H 5700 2600 50  0001 C CNN
F 3 "${INTERNAL_PARTS_LIB}/Datasheets/Connectors/JST - PH Series.pdf" H 5800 2700 50  0001 C CNN
F 4 "2x1" H 5850 2350 50  0001 C CNN "Component Value"
F 5 "B2B-PH-SM4-TB(LF)(SN)" V 6000 2700 50  0001 C CNN "Manufacturer Part Number"
F 6 "JST" H 5850 2900 50  0001 C CNN "Manufacturer"
F 7 "PH Series" H 5850 2250 50  0001 C CNN "Series"
F 8 "2-way, header, 2mm pitch, vertical, SMD, PH Series" H 5850 2150 50  0001 C CNN "Part Description"
	1    5850 2700
	-1   0    0    1   
$EndComp
$Comp
L Capacitors:ECS00075 C?
U 1 1 53B8C35B
P 1300 1650
F 0 "C?" H 1300 1750 50  0000 L CNN
F 1 "ECS00075" V 1050 1500 40  0001 L CNN
F 2 "ECFootprints:EC0603_C" H 1338 1500 30  0001 C CNN
F 3 "${INTERNAL_PARTS_LIB}/Datasheets/Capacitors/Murata GRM Capacitors/GRM188R71C104KA01#.pdf" H 1300 1650 60  0001 C CNN
F 4 "100nF" H 1200 1550 40  0000 C CNN "Component Value"
F 5 "GRM188R71C104KA01D" V 1450 1650 40  0001 C CNN "Manfacturer Part Number"
F 6 "Murata" V 1150 1650 40  0001 C CNN "Manufacturer"
F 7 "GRM Series" V 1550 1650 40  0001 C CNN "Series"
F 8 "100nF, 0603, 10%, 16V, X7R, Ceramic" V 1650 1600 40  0001 C CNN "Part Description"
	1    1300 1650
	1    0    0    -1  
$EndComp
$Comp
L Sensors:ECS00016 U?
U 1 1 53B8C2CE
P 2550 1800
F 0 "U?" H 1950 2250 50  0000 C CNN
F 1 "ECS00016" H 2550 2250 50  0001 C CNN
F 2 "ECFootprints:ECS00016F" H 2300 1900 50  0001 C CNN
F 3 "${INTERNAL_PARTS_LIB}/Datasheets/Sensors/Analog Devices - ADXL343, 3 Axis Accelerometer.pdf" H 2300 1900 50  0001 C CNN
F 4 "ADXL343BCCZ" H 2550 1350 50  0000 C CNN "Manufacturer Part Number"
F 5 "Analog Device" H 2550 1250 50  0001 C CNN "Manufacturer"
F 6 "Accelerometer, 3 axis" H 2550 1150 50  0001 C CNN "Part Description"
	1    2550 1800
	1    0    0    -1  
$EndComp
$Comp
L Resistors:ECS00045 R?
U 1 1 53B8C2A2
P 4550 4000
F 0 "R?" H 4550 4100 50  0000 C CNN
F 1 "ECS00045" H 4550 4250 50  0001 C CNN
F 2 "ECFootprints:EC0603" H 4550 3930 30  0001 C CNN
F 3 "${INTERNAL_PARTS_LIB}/Datasheets/Resistors/Panasonic - ERJ Series - Thick Film.pdf" H 4550 4000 30  0001 C CNN
F 4 "10K" H 4550 4000 50  0000 C CNN "Component Value"
F 5 "ERJ3GEYJ103V" H 4550 3900 50  0001 C CNN "Manufacturer Part Number"
F 6 "Panasonic" H 4550 4150 50  0001 C CNN "Manufacturer"
F 7 "ERJ Series" H 4550 3800 50  0001 C CNN "Series"
F 8 "10K, 0603, 5%, 0.1W, Thick Film" H 4550 3700 50  0001 C CNN "Part Description"
	1    4550 4000
	0    -1   -1   0   
$EndComp
$Comp
L Capacitors:ECS00075 C?
U 1 1 53B8C231
P 10100 2450
F 0 "C?" H 10100 2550 50  0000 L CNN
F 1 "ECS00075" V 9850 2300 40  0001 L CNN
F 2 "ECFootprints:EC0603_C" H 10138 2300 30  0001 C CNN
F 3 "${INTERNAL_PARTS_LIB}/Datasheets/Capacitors/Murata GRM Capacitors/GRM188R71C104KA01#.pdf" H 10100 2450 60  0001 C CNN
F 4 "100nF" H 10000 2350 40  0000 C CNN "Component Value"
F 5 "GRM188R71C104KA01D" V 10250 2450 40  0001 C CNN "Manfacturer Part Number"
F 6 "Murata" V 9950 2450 40  0001 C CNN "Manufacturer"
F 7 "GRM Series" V 10350 2450 40  0001 C CNN "Series"
F 8 "100nF, 0603, 10%, 16V, X7R, Ceramic" V 10450 2400 40  0001 C CNN "Part Description"
	1    10100 2450
	-1   0    0    1   
$EndComp
$Comp
L Capacitors:ECS00075 C?
U 1 1 53B8C1CB
P 9500 5600
F 0 "C?" H 9500 5700 50  0000 L CNN
F 1 "ECS00075" V 9250 5450 40  0001 L CNN
F 2 "ECFootprints:EC0603_C" H 9538 5450 30  0001 C CNN
F 3 "${INTERNAL_PARTS_LIB}/Datasheets/Capacitors/Murata GRM Capacitors/GRM188R71C104KA01#.pdf" H 9500 5600 60  0001 C CNN
F 4 "100nF" H 9400 5500 40  0000 C CNN "Component Value"
F 5 "GRM188R71C104KA01D" V 9650 5600 40  0001 C CNN "Manfacturer Part Number"
F 6 "Murata" V 9350 5600 40  0001 C CNN "Manufacturer"
F 7 "GRM Series" V 9750 5600 40  0001 C CNN "Series"
F 8 "100nF, 0603, 10%, 16V, X7R, Ceramic" V 9850 5550 40  0001 C CNN "Part Description"
	1    9500 5600
	-1   0    0    1   
$EndComp
$Comp
L Capacitors:ECS00075 C?
U 1 1 53B8C198
P 8200 4800
F 0 "C?" H 8200 4900 50  0000 L CNN
F 1 "ECS00075" V 7950 4650 40  0001 L CNN
F 2 "ECFootprints:EC0603_C" H 8238 4650 30  0001 C CNN
F 3 "${INTERNAL_PARTS_LIB}/Datasheets/Capacitors/Murata GRM Capacitors/GRM188R71C104KA01#.pdf" H 8200 4800 60  0001 C CNN
F 4 "100nF" H 8100 4700 40  0000 C CNN "Component Value"
F 5 "GRM188R71C104KA01D" V 8350 4800 40  0001 C CNN "Manfacturer Part Number"
F 6 "Murata" V 8050 4800 40  0001 C CNN "Manufacturer"
F 7 "GRM Series" V 8450 4800 40  0001 C CNN "Series"
F 8 "100nF, 0603, 10%, 16V, X7R, Ceramic" V 8550 4750 40  0001 C CNN "Part Description"
	1    8200 4800
	0    -1   -1   0   
$EndComp
$Comp
L Resistors:ECS00083 R?
U 1 1 53B8C0FB
P 9150 5300
F 0 "R?" H 9150 5400 50  0000 C CNN
F 1 "ECS00083" H 9150 5550 50  0001 C CNN
F 2 "ECFootprints:EC0603" H 9150 5230 30  0001 C CNN
F 3 "${INTERNAL_PARTS_LIB}/Datasheets/Resistors/Bourns - CR Series - Thick Film.pdf" H 9150 5300 30  0001 C CNN
F 4 "1K5" H 9150 5300 50  0000 C CNN "Component Value"
F 5 "CR0603-FX-1501ELF" H 9150 5200 50  0001 C CNN "Manufacturer Part Number"
F 6 "Bourns" H 9150 5450 50  0001 C CNN "Manufacturer"
F 7 "CR Series" H 9150 5100 50  0001 C CNN "Series"
F 8 "1K5, 0603, 1%,  0.1W, Thick Film" H 9150 5000 50  0001 C CNN "Part Description"
	1    9150 5300
	1    0    0    -1  
$EndComp
$Comp
L Resistors:ECS00083 R?
U 1 1 53B8C0BC
P 9750 2150
F 0 "R?" H 9750 2250 50  0000 C CNN
F 1 "ECS00083" H 9750 2400 50  0001 C CNN
F 2 "ECFootprints:EC0603" H 9750 2080 30  0001 C CNN
F 3 "${INTERNAL_PARTS_LIB}/Datasheets/Resistors/Bourns - CR Series - Thick Film.pdf" H 9750 2150 30  0001 C CNN
F 4 "1K5" H 9750 2150 50  0000 C CNN "Component Value"
F 5 "CR0603-FX-1501ELF" H 9750 2050 50  0001 C CNN "Manufacturer Part Number"
F 6 "Bourns" H 9750 2300 50  0001 C CNN "Manufacturer"
F 7 "CR Series" H 9750 1950 50  0001 C CNN "Series"
F 8 "1K5, 0603, 1%,  0.1W, Thick Film" H 9750 1850 50  0001 C CNN "Part Description"
	1    9750 2150
	1    0    0    -1  
$EndComp
$Comp
L Resistors:ECS00080 R?
U 1 1 53B8C08B
P 6250 1500
F 0 "R?" H 6250 1600 50  0000 C CNN
F 1 "ECS00080" H 6250 1750 50  0001 C CNN
F 2 "ECFootprints:EC0603" H 6250 1430 30  0001 C CNN
F 3 "${INTERNAL_PARTS_LIB}/Datasheets/Resistors/Vishay - CRCW Series - Thick Film.pdf" H 6250 1500 30  0001 C CNN
F 4 "36R" H 6250 1500 50  0000 C CNN "Component Value"
F 5 "CRCW060336R0FKEA" H 6250 1400 50  0001 C CNN "Manufacturer Part Number"
F 6 "Vishay" H 6250 1650 50  0001 C CNN "Manufacturer"
F 7 "CRCW Series" H 6250 1300 50  0001 C CNN "Series"
F 8 "36R, 0603, 0.1W,  Thick Film" H 6250 1200 50  0001 C CNN "Part Description"
	1    6250 1500
	0    -1   -1   0   
$EndComp
$Comp
L Capacitors:ECS00052 C?
U 1 1 53B8BC6E
P 1000 1650
F 0 "C?" H 1000 1750 50  0000 L CNN
F 1 "ECS00052" V 750 1500 40  0001 L CNN
F 2 "ECFootprints:EC0603_C" H 1038 1500 30  0001 C CNN
F 3 "${INTERNAL_PARTS_LIB}/Datasheets/Capacitors/Murata GRM Capacitors/GRM188R61H105KAAL#.pdf" H 1000 1650 60  0001 C CNN
F 4 "1uF" H 900 1550 40  0000 C CNN "Component Value"
F 5 "GRM188R61H105KAALD" V 1150 1650 40  0001 C CNN "Manfacturer Part Number"
F 6 "Murata" V 850 1650 40  0001 C CNN "Manufacturer"
F 7 "GRM Series" V 1250 1650 40  0001 C CNN "Series"
F 8 "1uF, 0603, 10%, 50V, X5R, Ceramic" V 1350 1600 40  0001 C CNN "Part Description"
	1    1000 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 53AE0C4B
P 8100 1400
F 0 "#PWR?" H 8100 1400 50  0001 C CNN
F 1 "GNDA" H 8100 1250 50  0000 C CNN
F 2 "" H 8100 1400 50  0001 C CNN
F 3 "" H 8100 1400 50  0001 C CNN
	1    8100 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 53AE03DB
P 1600 2300
F 0 "#PWR?" H 1600 2300 50  0001 C CNN
F 1 "GNDD" H 1600 2175 50  0000 C CNN
F 2 "" H 1600 2300 50  0001 C CNN
F 3 "" H 1600 2300 50  0001 C CNN
	1    1600 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 53AE03CB
P 8450 2650
F 0 "#PWR?" H 8450 2650 50  0001 C CNN
F 1 "GNDA" H 8450 2500 50  0000 C CNN
F 2 "" H 8450 2650 50  0001 C CNN
F 3 "" H 8450 2650 50  0001 C CNN
	1    8450 2650
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 53AE03BB
P 10100 2800
F 0 "#PWR?" H 10100 2800 50  0001 C CNN
F 1 "GNDA" H 10100 2650 50  0000 C CNN
F 2 "" H 10100 2800 50  0001 C CNN
F 3 "" H 10100 2800 50  0001 C CNN
	1    10100 2800
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 53AE03AB
P 5400 4500
F 0 "#PWR?" H 5400 4500 50  0001 C CNN
F 1 "GNDA" H 5400 4350 50  0000 C CNN
F 2 "" H 5400 4500 50  0001 C CNN
F 3 "" H 5400 4500 50  0001 C CNN
	1    5400 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 53AE03A5
P 3650 1850
F 0 "#PWR?" H 3650 1850 50  0001 C CNN
F 1 "GNDD" H 3650 1725 50  0000 C CNN
F 2 "" H 3650 1850 50  0001 C CNN
F 3 "" H 3650 1850 50  0001 C CNN
	1    3650 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 53AE039F
P 1300 2000
F 0 "#PWR?" H 1300 2000 50  0001 C CNN
F 1 "GNDD" H 1300 1875 50  0000 C CNN
F 2 "" H 1300 2000 50  0001 C CNN
F 3 "" H 1300 2000 50  0001 C CNN
	1    1300 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 53AE038F
P 1000 2000
F 0 "#PWR?" H 1000 2000 50  0001 C CNN
F 1 "GNDD" H 1000 1875 50  0000 C CNN
F 2 "" H 1000 2000 50  0001 C CNN
F 3 "" H 1000 2000 50  0001 C CNN
	1    1000 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 53AE0359
P 7900 5750
F 0 "#PWR?" H 7900 5750 50  0001 C CNN
F 1 "GNDA" H 7900 5600 50  0000 C CNN
F 2 "" H 7900 5750 50  0001 C CNN
F 3 "" H 7900 5750 50  0001 C CNN
	1    7900 5750
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 53AE0333
P 9500 5950
F 0 "#PWR?" H 9500 5950 50  0001 C CNN
F 1 "GNDA" H 9500 5800 50  0000 C CNN
F 2 "" H 9500 5950 50  0001 C CNN
F 3 "" H 9500 5950 50  0001 C CNN
	1    9500 5950
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR?
U 1 1 53ADFEDF
P 3650 2150
F 0 "#PWR?" H 3650 2250 30  0001 C CNN
F 1 "VDD" H 3650 2300 50  0000 C CNN
F 2 "" H 3650 2150 50  0001 C CNN
F 3 "" H 3650 2150 50  0001 C CNN
	1    3650 2150
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR?
U 1 1 53ADFEAE
P 1600 1350
F 0 "#PWR?" H 1600 1450 30  0001 C CNN
F 1 "VDD" H 1600 1500 50  0000 C CNN
F 2 "" H 1600 1350 50  0001 C CNN
F 3 "" H 1600 1350 50  0001 C CNN
	1    1600 1350
	1    0    0    -1  
$EndComp
$Comp
L power:VAA #PWR?
U 1 1 53ADFE92
P 5700 1150
F 0 "#PWR?" H 5700 1210 30  0001 C CNN
F 1 "VAA" H 5700 1300 50  0000 C CNN
F 2 "" H 5700 1150 50  0001 C CNN
F 3 "" H 5700 1150 50  0001 C CNN
	1    5700 1150
	1    0    0    -1  
$EndComp
$Comp
L power:VAA #PWR?
U 1 1 53ADFE82
P 8450 1650
F 0 "#PWR?" H 8450 1710 30  0001 C CNN
F 1 "VAA" H 8450 1800 50  0000 C CNN
F 2 "" H 8450 1650 50  0001 C CNN
F 3 "" H 8450 1650 50  0001 C CNN
	1    8450 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 53AE035F
P 8500 4950
F 0 "#PWR?" H 8500 4950 50  0001 C CNN
F 1 "GNDA" H 8500 4800 50  0000 C CNN
F 2 "" H 8500 4950 50  0001 C CNN
F 3 "" H 8500 4950 50  0001 C CNN
	1    8500 4950
	1    0    0    -1  
$EndComp
$Comp
L power:VAA #PWR?
U 1 1 53ADFE65
P 7900 4750
F 0 "#PWR?" H 7900 4810 30  0001 C CNN
F 1 "VAA" H 7900 4900 50  0000 C CNN
F 2 "" H 7900 4750 50  0001 C CNN
F 3 "" H 7900 4750 50  0001 C CNN
	1    7900 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 2150 9350 2150
Wire Wire Line
	7700 2250 7850 2250
Wire Wire Line
	7850 2250 7850 3050
Connection ~ 7850 2250
Wire Wire Line
	7850 2250 8050 2250
Wire Wire Line
	9350 2150 9350 3050
Connection ~ 9350 2150
Wire Wire Line
	9350 2150 9500 2150
$EndSCHEMATC
