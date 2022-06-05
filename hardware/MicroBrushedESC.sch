EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_ST_STM8:STM8S003F3P U1
U 1 1 5F8A76CB
P 1900 1850
F 0 "U1" H 1900 3031 50  0000 C CNN
F 1 "STM8S003F3P" H 1900 2940 50  0000 C CNN
F 2 "Package_SO:TSSOP-20_4.4x6.5mm_P0.65mm" H 1950 2950 50  0001 L CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00024550.pdf" H 1850 1450 50  0001 C CNN
	1    1900 1850
	1    0    0    -1  
$EndComp
Text GLabel 2500 1950 2    50   Input ~ 0
UART1_TX
Text GLabel 2500 2050 2    50   Input ~ 0
AIN6
Text GLabel 1300 2450 0    50   Input ~ 0
NRST
Text GLabel 1300 1150 0    50   Input ~ 0
PA1
Text GLabel 1300 1250 0    50   Input ~ 0
PA2
Text GLabel 1900 850  0    50   Input ~ 0
V_Filt+
Text GLabel 1300 2550 0    50   Input ~ 0
VCAP
Text GLabel 1300 1350 0    50   Input ~ 0
TIM2_CH3
Text GLabel 1300 1650 0    50   Input ~ 0
PB5
Text GLabel 1300 1550 0    50   Input ~ 0
PB4
Text GLabel 1300 1850 0    50   Input ~ 0
TIM1_CH3
Text GLabel 1300 1950 0    50   Input ~ 0
TIM1_CH4
Text GLabel 1300 2150 0    50   Input ~ 0
TIM1_CH1
Text GLabel 1300 2250 0    50   Input ~ 0
TIM1_CH2
Text GLabel 2500 1550 2    50   Input ~ 0
SWIM
Text GLabel 2500 1650 2    50   Input ~ 0
AIN3
Text GLabel 2500 1750 2    50   Input ~ 0
TIM2_CH2
Text GLabel 1300 2050 0    50   Input ~ 0
TIM2_CH1
$Comp
L Transistor_FET:AO3401A Q3
U 1 1 5F8A9EF0
P 6250 1200
F 0 "Q3" H 6455 1246 50  0000 L CNN
F 1 "AO3401A" H 6455 1155 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 6450 1125 50  0001 L CIN
F 3 "http://www.aosmd.com/pdfs/datasheet/AO3401A.pdf" H 6250 1200 50  0001 L CNN
	1    6250 1200
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0101
U 1 1 5F8AE126
P 6350 1700
F 0 "#PWR0101" H 6350 1550 50  0001 C CNN
F 1 "VCC" V 6365 1827 50  0000 L CNN
F 2 "" H 6350 1700 50  0001 C CNN
F 3 "" H 6350 1700 50  0001 C CNN
	1    6350 1700
	0    1    1    0   
$EndComp
Wire Wire Line
	6350 750  6350 1000
$Comp
L power:GND #PWR0102
U 1 1 5F8B1A2E
P 5350 1850
F 0 "#PWR0102" H 5350 1600 50  0001 C CNN
F 1 "GND" H 5355 1677 50  0000 C CNN
F 2 "" H 5350 1850 50  0001 C CNN
F 3 "" H 5350 1850 50  0001 C CNN
	1    5350 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 1600 5350 1800
$Comp
L Device:R_Small R4
U 1 1 5F8B1CE1
P 5050 1700
F 0 "R4" H 5109 1746 50  0000 L CNN
F 1 "10k" H 5109 1655 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 5050 1700 50  0001 C CNN
F 3 "~" H 5050 1700 50  0001 C CNN
	1    5050 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 1400 5050 1600
Wire Wire Line
	5050 1800 5350 1800
Connection ~ 5350 1800
Wire Wire Line
	5350 1800 5350 1850
$Comp
L Device:R_Small R2
U 1 1 5F8B273A
P 4800 1400
F 0 "R2" V 4604 1400 50  0000 C CNN
F 1 "100" V 4695 1400 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 4800 1400 50  0001 C CNN
F 3 "~" H 4800 1400 50  0001 C CNN
	1    4800 1400
	0    1    1    0   
$EndComp
Wire Wire Line
	4900 1400 5050 1400
Text GLabel 4550 1400 0    50   Input ~ 0
TIM2_CH1
Wire Wire Line
	4550 1400 4700 1400
$Comp
L Transistor_FET:2N7002 Q1
U 1 1 5F8B88A3
P 5250 1400
F 0 "Q1" H 5454 1446 50  0000 L CNN
F 1 "2N7002" H 5454 1355 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5450 1325 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 5250 1400 50  0001 L CNN
	1    5250 1400
	1    0    0    -1  
$EndComp
Connection ~ 5050 1400
Text Notes 5450 1750 0    50   ~ 0
1:Gate\n2:Source\n3:Drain
Text Notes 6450 1550 0    50   ~ 0
1:Gate\n2:Source\n3:Drain
Wire Wire Line
	6100 1500 6100 1700
Wire Wire Line
	6100 1700 6350 1700
Connection ~ 6350 1700
Wire Wire Line
	6350 1400 6350 1700
Wire Wire Line
	6100 1300 6050 1300
Wire Wire Line
	6050 1300 6050 1200
Text GLabel 6350 750  2    50   Input ~ 0
MOTOR1
Wire Wire Line
	5350 1200 6050 1200
Connection ~ 6050 1200
$Comp
L Transistor_FET:AO3401A Q4
U 1 1 5F8CDB35
P 6250 2800
F 0 "Q4" H 6455 2846 50  0000 L CNN
F 1 "AO3401A" H 6455 2755 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 6450 2725 50  0001 L CIN
F 3 "http://www.aosmd.com/pdfs/datasheet/AO3401A.pdf" H 6250 2800 50  0001 L CNN
	1    6250 2800
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0103
U 1 1 5F8CDB3B
P 6350 3300
F 0 "#PWR0103" H 6350 3150 50  0001 C CNN
F 1 "VCC" V 6365 3427 50  0000 L CNN
F 2 "" H 6350 3300 50  0001 C CNN
F 3 "" H 6350 3300 50  0001 C CNN
	1    6350 3300
	0    1    1    0   
$EndComp
Wire Wire Line
	6350 2350 6350 2600
$Comp
L power:GND #PWR0104
U 1 1 5F8CDB48
P 5350 3450
F 0 "#PWR0104" H 5350 3200 50  0001 C CNN
F 1 "GND" H 5355 3277 50  0000 C CNN
F 2 "" H 5350 3450 50  0001 C CNN
F 3 "" H 5350 3450 50  0001 C CNN
	1    5350 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 3200 5350 3400
$Comp
L Device:R_Small R5
U 1 1 5F8CDB4F
P 5050 3300
F 0 "R5" H 5109 3346 50  0000 L CNN
F 1 "10k" H 5109 3255 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 5050 3300 50  0001 C CNN
F 3 "~" H 5050 3300 50  0001 C CNN
	1    5050 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 3000 5050 3200
Wire Wire Line
	5050 3400 5350 3400
Connection ~ 5350 3400
Wire Wire Line
	5350 3400 5350 3450
$Comp
L Device:R_Small R3
U 1 1 5F8CDB59
P 4800 3000
F 0 "R3" V 4604 3000 50  0000 C CNN
F 1 "100" V 4695 3000 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 4800 3000 50  0001 C CNN
F 3 "~" H 4800 3000 50  0001 C CNN
	1    4800 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	4900 3000 5050 3000
Text GLabel 4550 3000 0    50   Input ~ 0
TIM2_CH2
Wire Wire Line
	4550 3000 4700 3000
$Comp
L Transistor_FET:2N7002 Q2
U 1 1 5F8CDB62
P 5250 3000
F 0 "Q2" H 5454 3046 50  0000 L CNN
F 1 "2N7002" H 5454 2955 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5450 2925 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 5250 3000 50  0001 L CNN
	1    5250 3000
	1    0    0    -1  
$EndComp
Connection ~ 5050 3000
Text Notes 5450 3350 0    50   ~ 0
1:Gate\n2:Source\n3:Drain
Text Notes 6450 3150 0    50   ~ 0
1:Gate\n2:Source\n3:Drain
Wire Wire Line
	6100 3100 6100 3300
Wire Wire Line
	6100 3300 6350 3300
Connection ~ 6350 3300
Wire Wire Line
	6350 3000 6350 3300
Wire Wire Line
	6100 2900 6050 2900
Wire Wire Line
	6050 2900 6050 2800
Text GLabel 6350 2350 2    50   Input ~ 0
MOTOR2
Wire Wire Line
	5350 2800 6050 2800
Connection ~ 6050 2800
$Comp
L Connector:Conn_01x02_Female J1
U 1 1 5F8CE106
P 9250 3100
F 0 "J1" H 9278 3076 50  0000 L CNN
F 1 "MOTOR1" H 9278 2985 50  0000 L CNN
F 2 "Connector_Molex:Molex_PicoBlade_53047-0210_1x02_P1.25mm_Vertical" H 9250 3100 50  0001 C CNN
F 3 "~" H 9250 3100 50  0001 C CNN
	1    9250 3100
	1    0    0    -1  
$EndComp
Text GLabel 8900 3100 0    50   Input ~ 0
MOTOR1
$Comp
L power:GND #PWR0105
U 1 1 5F8CF619
P 8900 3200
F 0 "#PWR0105" H 8900 2950 50  0001 C CNN
F 1 "GND" V 8905 3072 50  0000 R CNN
F 2 "" H 8900 3200 50  0001 C CNN
F 3 "" H 8900 3200 50  0001 C CNN
	1    8900 3200
	0    1    1    0   
$EndComp
Wire Wire Line
	8900 3200 9000 3200
Wire Wire Line
	8900 3100 9050 3100
$Comp
L Connector:Conn_01x02_Female J2
U 1 1 5F8D3E3E
P 9250 4200
F 0 "J2" H 9278 4176 50  0000 L CNN
F 1 "MOTOR2" H 9278 4085 50  0000 L CNN
F 2 "Connector_Molex:Molex_PicoBlade_53047-0210_1x02_P1.25mm_Vertical" H 9250 4200 50  0001 C CNN
F 3 "~" H 9250 4200 50  0001 C CNN
	1    9250 4200
	1    0    0    -1  
$EndComp
Text GLabel 8900 4200 0    50   Input ~ 0
MOTOR2
$Comp
L power:GND #PWR0106
U 1 1 5F8D3E45
P 8900 4300
F 0 "#PWR0106" H 8900 4050 50  0001 C CNN
F 1 "GND" V 8905 4172 50  0000 R CNN
F 2 "" H 8900 4300 50  0001 C CNN
F 3 "" H 8900 4300 50  0001 C CNN
	1    8900 4300
	0    1    1    0   
$EndComp
Wire Wire Line
	8900 4300 9000 4300
Wire Wire Line
	8900 4200 9050 4200
$Comp
L Device:LED_Small D1
U 1 1 5F8D4483
P 5450 4750
F 0 "D1" H 5450 4543 50  0000 C CNN
F 1 "LED_Small" H 5450 4634 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric" V 5450 4750 50  0001 C CNN
F 3 "~" V 5450 4750 50  0001 C CNN
	1    5450 4750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R1
U 1 1 5F8D58C6
P 5100 4750
F 0 "R1" V 4904 4750 50  0000 C CNN
F 1 "5k" V 4995 4750 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 5100 4750 50  0001 C CNN
F 3 "~" H 5100 4750 50  0001 C CNN
	1    5100 4750
	0    1    1    0   
$EndComp
Wire Wire Line
	4850 4750 5000 4750
Wire Wire Line
	5200 4750 5350 4750
$Comp
L Connector:Conn_01x04_Female J3
U 1 1 5F8D769C
P 9250 1000
F 0 "J3" H 9278 976 50  0000 L CNN
F 1 "CONTROL" H 9278 885 50  0000 L CNN
F 2 "Connector_Molex:Molex_PicoBlade_53047-0410_1x04_P1.25mm_Vertical" H 9250 1000 50  0001 C CNN
F 3 "~" H 9250 1000 50  0001 C CNN
	1    9250 1000
	1    0    0    -1  
$EndComp
Text GLabel 8750 1400 0    50   Input ~ 0
VDD
$Comp
L power:GND #PWR0108
U 1 1 5F8D9BB5
P 8900 1550
F 0 "#PWR0108" H 8900 1300 50  0001 C CNN
F 1 "GND" V 8905 1422 50  0000 R CNN
F 2 "" H 8900 1550 50  0001 C CNN
F 3 "" H 8900 1550 50  0001 C CNN
	1    8900 1550
	0    1    1    0   
$EndComp
Text GLabel 9050 1000 0    50   Input ~ 0
V_Filt+
Text GLabel 9050 1100 0    50   Input ~ 0
TIM1_CH1
Text GLabel 9050 1200 0    50   Input ~ 0
TIM1_CH3
Text GLabel 750  4150 1    50   Input ~ 0
VCAP
$Comp
L Device:C_Small C1
U 1 1 5F8DB95F
P 750 4450
F 0 "C1" H 842 4496 50  0000 L CNN
F 1 "1uF" H 842 4405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 750 4450 50  0001 C CNN
F 3 "~" H 750 4450 50  0001 C CNN
	1    750  4450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 5F8DC2AE
P 750 4800
F 0 "#PWR0110" H 750 4550 50  0001 C CNN
F 1 "GND" H 755 4627 50  0000 C CNN
F 2 "" H 750 4800 50  0001 C CNN
F 3 "" H 750 4800 50  0001 C CNN
	1    750  4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	750  4150 750  4350
Wire Wire Line
	750  4550 750  4800
$Comp
L Connector:Conn_01x04_Female J5
U 1 1 5F8DF528
P 9250 1850
F 0 "J5" H 9278 1826 50  0000 L CNN
F 1 "REPROG" H 9278 1735 50  0000 L CNN
F 2 "Connector_Molex:Molex_PicoBlade_53047-0410_1x04_P1.25mm_Vertical" H 9250 1850 50  0001 C CNN
F 3 "~" H 9250 1850 50  0001 C CNN
	1    9250 1850
	1    0    0    -1  
$EndComp
Text GLabel 9050 1850 0    50   Input ~ 0
SWIM
Text GLabel 9050 2050 0    50   Input ~ 0
NRST
$Comp
L power:GND #PWR0111
U 1 1 5F8E0AF9
P 9050 1950
F 0 "#PWR0111" H 9050 1700 50  0001 C CNN
F 1 "GND" V 9055 1822 50  0000 R CNN
F 2 "" H 9050 1950 50  0001 C CNN
F 3 "" H 9050 1950 50  0001 C CNN
	1    9050 1950
	0    1    1    0   
$EndComp
Text GLabel 9050 1750 0    50   Input ~ 0
VDD
Text GLabel 2250 4100 1    50   Input ~ 0
V_Filt+
$Comp
L Device:C_Small C4
U 1 1 5F8E2697
P 2250 4400
F 0 "C4" H 2342 4446 50  0000 L CNN
F 1 "100nF" H 2342 4355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2250 4400 50  0001 C CNN
F 3 "~" H 2250 4400 50  0001 C CNN
	1    2250 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 4100 2250 4300
Wire Wire Line
	2250 4500 2250 4750
Wire Wire Line
	2600 4100 2600 4300
$Comp
L power:GND #PWR0112
U 1 1 5F8E5BFA
P 2250 4950
F 0 "#PWR0112" H 2250 4700 50  0001 C CNN
F 1 "GND" H 2255 4777 50  0000 C CNN
F 2 "" H 2250 4950 50  0001 C CNN
F 3 "" H 2250 4950 50  0001 C CNN
	1    2250 4950
	1    0    0    -1  
$EndComp
Connection ~ 2250 4750
Wire Wire Line
	2250 4750 2250 4950
Wire Wire Line
	2250 4100 2600 4100
Text GLabel 3550 4550 0    50   Input ~ 0
VSS
$Comp
L power:GND #PWR0113
U 1 1 5F8EB7EB
P 3700 4550
F 0 "#PWR0113" H 3700 4300 50  0001 C CNN
F 1 "GND" V 3705 4422 50  0000 R CNN
F 2 "" H 3700 4550 50  0001 C CNN
F 3 "" H 3700 4550 50  0001 C CNN
	1    3700 4550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3550 4550 3700 4550
$Comp
L Device:R_Small R6
U 1 1 5F8AF4A9
P 6100 1400
F 0 "R6" H 6041 1354 50  0000 R CNN
F 1 "10k" H 6041 1445 50  0000 R CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 6100 1400 50  0001 C CNN
F 3 "~" H 6100 1400 50  0001 C CNN
	1    6100 1400
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R7
U 1 1 5F8CDB42
P 6100 3000
F 0 "R7" H 6041 2954 50  0000 R CNN
F 1 "10k" H 6041 3045 50  0000 R CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 6100 3000 50  0001 C CNN
F 3 "~" H 6100 3000 50  0001 C CNN
	1    6100 3000
	-1   0    0    1   
$EndComp
Text GLabel 3550 4700 0    50   Input ~ 0
VDD
$Comp
L power:VCC #PWR0114
U 1 1 5F8EF416
P 3750 4700
F 0 "#PWR0114" H 3750 4550 50  0001 C CNN
F 1 "VCC" V 3765 4828 50  0000 L CNN
F 2 "" H 3750 4700 50  0001 C CNN
F 3 "" H 3750 4700 50  0001 C CNN
	1    3750 4700
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x01_Female J4
U 1 1 5F93E8AC
P 9100 1400
F 0 "J4" H 9128 1426 50  0000 L CNN
F 1 "VBAT+" H 9128 1335 50  0000 L CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x01_P1.27mm_Vertical" H 9100 1400 50  0001 C CNN
F 3 "~" H 9100 1400 50  0001 C CNN
	1    9100 1400
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Female J6
U 1 1 5F93FC7E
P 9100 1550
F 0 "J6" H 9128 1576 50  0000 L CNN
F 1 "VBAT-" H 9128 1485 50  0000 L CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x01_P1.27mm_Vertical" H 9100 1550 50  0001 C CNN
F 3 "~" H 9100 1550 50  0001 C CNN
	1    9100 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D2
U 1 1 5F9543E3
P 9000 2900
F 0 "D2" V 8954 2980 50  0000 L CNN
F 1 "D_Schottky" V 9045 2980 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-123" H 9000 2900 50  0001 C CNN
F 3 "~" H 9000 2900 50  0001 C CNN
	1    9000 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	9000 3200 9000 3050
Connection ~ 9000 3200
Wire Wire Line
	9000 3200 9050 3200
Wire Wire Line
	8900 3100 8900 2750
Wire Wire Line
	8900 2750 9000 2750
$Comp
L Device:D_Schottky D3
U 1 1 5F957F58
P 9000 4000
F 0 "D3" V 8950 4150 50  0000 C CNN
F 1 "D_Schottky" V 9050 4300 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123" H 9000 4000 50  0001 C CNN
F 3 "~" H 9000 4000 50  0001 C CNN
	1    9000 4000
	0    1    1    0   
$EndComp
Wire Wire Line
	9000 4300 9000 4150
Connection ~ 9000 4300
Wire Wire Line
	9000 4300 9050 4300
Wire Wire Line
	8900 4200 8900 3850
Wire Wire Line
	8900 3850 9000 3850
$Comp
L pspice:CAP C7
U 1 1 5F96A9DE
P 1500 4200
F 0 "C7" V 1185 4200 50  0000 C CNN
F 1 "100uF" V 1276 4200 50  0000 C CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-3528-21_Kemet-B" H 1500 4200 50  0001 C CNN
F 3 "~" H 1500 4200 50  0001 C CNN
	1    1500 4200
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5F96BBAF
P 1250 4200
F 0 "#PWR01" H 1250 3950 50  0001 C CNN
F 1 "GND" V 1255 4072 50  0000 R CNN
F 2 "" H 1250 4200 50  0001 C CNN
F 3 "" H 1250 4200 50  0001 C CNN
	1    1250 4200
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR02
U 1 1 5F96C841
P 1750 4200
F 0 "#PWR02" H 1750 4050 50  0001 C CNN
F 1 "VCC" V 1765 4328 50  0000 L CNN
F 2 "" H 1750 4200 50  0001 C CNN
F 3 "" H 1750 4200 50  0001 C CNN
	1    1750 4200
	0    1    1    0   
$EndComp
Wire Wire Line
	8900 1400 8750 1400
Wire Notes Line
	8350 2500 8350 4500
Wire Notes Line
	8350 4500 9850 4500
Wire Notes Line
	9850 4500 9850 2500
Wire Notes Line
	9850 2500 8350 2500
Wire Notes Line
	8350 3500 9850 3500
Wire Notes Line
	8350 750  8350 2200
Wire Notes Line
	8350 2200 9850 2200
Wire Notes Line
	9850 2200 9850 750 
Wire Notes Line
	9850 750  8350 750 
Wire Notes Line
	4000 650  4000 2100
Wire Notes Line
	4000 2100 6850 2100
Wire Notes Line
	6850 2100 6850 650 
Wire Notes Line
	6850 650  4000 650 
Wire Notes Line
	4000 2250 4000 3700
Wire Notes Line
	4000 3700 6850 3700
Wire Notes Line
	6850 3700 6850 2250
Wire Notes Line
	6850 2250 4000 2250
Wire Notes Line
	3250 4300 4150 4300
Wire Notes Line
	4150 4300 4150 5050
Wire Notes Line
	4150 5050 3250 5050
Wire Notes Line
	3250 5050 3250 4300
Wire Notes Line
	4550 4350 5900 4350
Wire Notes Line
	5900 4350 5900 5000
Wire Notes Line
	5900 5000 4550 5000
Wire Notes Line
	4550 5000 4550 4350
Wire Notes Line
	750  600  3000 600 
Wire Notes Line
	3000 600  3000 3150
Wire Notes Line
	3000 3150 750  3150
Wire Notes Line
	750  3150 750  600 
Text Notes 2800 3100 0    50   ~ 0
MCU
Text Notes 2350 6300 0    50   ~ 0
Power Management
Text Notes 3450 5000 0    50   ~ 0
Power Definitions
Text Notes 4600 4450 0    50   ~ 0
Status LED
Text Notes 6200 3650 0    50   ~ 0
Motor 2 Control
Text Notes 6200 2050 0    50   ~ 0
Motor 1 Control
Text Notes 9400 2150 0    50   ~ 0
Connectors
Text Notes 8850 3450 0    50   ~ 0
Motor 1 Diode/Connector
Text Notes 8850 4450 0    50   ~ 0
Motor 2 Diode/Connector
Wire Wire Line
	3550 4700 3750 4700
Text GLabel 2500 1850 2    50   Input ~ 0
PD4
Text GLabel 4850 4750 0    50   Input ~ 0
PB4
Text GLabel 3500 5400 0    50   Input ~ 0
AIN3
Text GLabel 3850 5400 2    50   Input ~ 0
VDD
$Comp
L Device:R_Small R8
U 1 1 6003C696
P 3650 5400
F 0 "R8" V 3454 5400 50  0000 C CNN
F 1 "100k" V 3545 5400 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 3650 5400 50  0001 C CNN
F 3 "~" H 3650 5400 50  0001 C CNN
	1    3650 5400
	0    1    1    0   
$EndComp
Wire Wire Line
	3750 5400 3850 5400
Wire Notes Line
	4150 5150 4150 5650
Wire Notes Line
	4150 5650 3250 5650
Wire Notes Line
	3250 5650 3250 5150
Wire Notes Line
	3250 5150 4150 5150
Wire Wire Line
	3500 5400 3550 5400
Text Notes 3600 5600 0    50   ~ 0
Battery Meas\n
$Comp
L Device:R_Small R10
U 1 1 60BC505F
P 5200 5300
F 0 "R10" V 5004 5300 50  0000 C CNN
F 1 "100k" V 5095 5300 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 5200 5300 50  0001 C CNN
F 3 "~" H 5200 5300 50  0001 C CNN
	1    5200 5300
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R11
U 1 1 60BC6110
P 5200 5600
F 0 "R11" V 5004 5600 50  0000 C CNN
F 1 "100k" V 5095 5600 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 5200 5600 50  0001 C CNN
F 3 "~" H 5200 5600 50  0001 C CNN
	1    5200 5600
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 60BC7B61
P 5650 5300
F 0 "#PWR0107" H 5650 5050 50  0001 C CNN
F 1 "GND" V 5655 5172 50  0000 R CNN
F 2 "" H 5650 5300 50  0001 C CNN
F 3 "" H 5650 5300 50  0001 C CNN
	1    5650 5300
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 60BC8F6D
P 5650 5600
F 0 "#PWR0115" H 5650 5350 50  0001 C CNN
F 1 "GND" V 5655 5472 50  0000 R CNN
F 2 "" H 5650 5600 50  0001 C CNN
F 3 "" H 5650 5600 50  0001 C CNN
	1    5650 5600
	0    -1   -1   0   
$EndComp
Text GLabel 4950 5300 0    50   Input ~ 0
TIM1_CH1
Text GLabel 4950 5600 0    50   Input ~ 0
TIM1_CH3
Wire Wire Line
	4950 5300 5100 5300
Wire Wire Line
	5300 5300 5650 5300
Wire Wire Line
	4950 5600 5100 5600
Wire Wire Line
	5300 5600 5650 5600
Text GLabel 5550 4750 2    50   Input ~ 0
V_Filt+
Text Notes 5100 4450 0    50   ~ 0
PB4 is a True Drain
Wire Wire Line
	2250 4750 2600 4750
Wire Wire Line
	2600 4500 2600 4750
$Comp
L Device:C_Small C5
U 1 1 5F8E2E20
P 2600 4400
F 0 "C5" H 2692 4446 50  0000 L CNN
F 1 "1uF" H 2692 4355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2600 4400 50  0001 C CNN
F 3 "~" H 2600 4400 50  0001 C CNN
	1    2600 4400
	1    0    0    -1  
$EndComp
Text GLabel 2800 5300 2    50   Input ~ 0
V_Filt+
Text GLabel 800  5300 0    50   Input ~ 0
VDD
Wire Notes Line
	550  3800 550  6350
Wire Notes Line
	550  6350 3150 6350
Wire Notes Line
	3150 3800 3150 6350
Wire Notes Line
	550  3800 3150 3800
$Comp
L Device:LED_Small D4
U 1 1 60CEA175
P 6900 4750
F 0 "D4" H 6900 4543 50  0000 C CNN
F 1 "LED_Small" H 6900 4634 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric" V 6900 4750 50  0001 C CNN
F 3 "~" V 6900 4750 50  0001 C CNN
	1    6900 4750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R12
U 1 1 60CEA17B
P 6550 4750
F 0 "R12" V 6354 4750 50  0000 C CNN
F 1 "5k" V 6445 4750 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 6550 4750 50  0001 C CNN
F 3 "~" H 6550 4750 50  0001 C CNN
	1    6550 4750
	0    1    1    0   
$EndComp
Wire Wire Line
	6300 4750 6450 4750
Wire Wire Line
	6650 4750 6800 4750
Wire Notes Line
	6000 4350 7350 4350
Wire Notes Line
	7350 4350 7350 5000
Wire Notes Line
	7350 5000 6000 5000
Wire Notes Line
	6000 5000 6000 4350
Text Notes 6050 4450 0    50   ~ 0
Status LED
Text GLabel 6300 4750 0    50   Input ~ 0
PD4
Text GLabel 7000 4750 2    50   Input ~ 0
V_Filt+
Text Notes 6550 4450 0    50   ~ 0
PD4 is a True Drain
$Comp
L Custom:TPS6123x U2
U 1 1 612AD057
P 1850 5350
F 0 "U2" H 1825 5415 50  0000 C CNN
F 1 "TPS6123x" H 1825 5324 50  0000 C CNN
F 2 "digikey-footprints:VSON-10-1EP_3x3mm" H 1850 5350 50  0001 C CNN
F 3 "" H 1850 5350 50  0001 C CNN
	1    1850 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:L_Small L1
U 1 1 612BD622
P 1800 5200
F 0 "L1" V 1619 5200 50  0000 C CNN
F 1 "1u" V 1710 5200 50  0000 C CNN
F 2 "Inductor_SMD:L_Vishay_IHLP-1616" H 1800 5200 50  0001 C CNN
F 3 "~" H 1800 5200 50  0001 C CNN
	1    1800 5200
	0    1    1    0   
$EndComp
Wire Wire Line
	2150 5550 2200 5550
Wire Wire Line
	2200 5550 2200 5200
Wire Wire Line
	2200 5200 1900 5200
Wire Wire Line
	1500 5550 1350 5550
Wire Wire Line
	1000 5550 1000 5300
Wire Wire Line
	1000 5300 800  5300
Wire Wire Line
	1700 5200 1350 5200
Wire Wire Line
	1350 5200 1350 5550
Connection ~ 1350 5550
Wire Wire Line
	1350 5550 1000 5550
Wire Wire Line
	1350 5550 1350 5650
Wire Wire Line
	1350 5650 1500 5650
$Comp
L Device:C_Small C2
U 1 1 612C805D
P 1000 5750
F 0 "C2" H 1092 5796 50  0000 L CNN
F 1 "22u" H 1092 5705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1000 5750 50  0001 C CNN
F 3 "~" H 1000 5750 50  0001 C CNN
	1    1000 5750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 612C8788
P 1000 5850
F 0 "#PWR03" H 1000 5600 50  0001 C CNN
F 1 "GND" H 1005 5677 50  0000 C CNN
F 2 "" H 1000 5850 50  0001 C CNN
F 3 "" H 1000 5850 50  0001 C CNN
	1    1000 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 5650 1000 5550
Connection ~ 1000 5550
$Comp
L power:GND #PWR04
U 1 1 612CB740
P 1350 6150
F 0 "#PWR04" H 1350 5900 50  0001 C CNN
F 1 "GND" H 1355 5977 50  0000 C CNN
F 2 "" H 1350 6150 50  0001 C CNN
F 3 "" H 1350 6150 50  0001 C CNN
	1    1350 6150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 612CC1B6
P 1350 5950
F 0 "C3" H 1150 6000 50  0000 L CNN
F 1 "10n" H 1150 5900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1350 5950 50  0001 C CNN
F 3 "~" H 1350 5950 50  0001 C CNN
	1    1350 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 6050 1350 6100
Wire Wire Line
	1500 5950 1450 5950
Wire Wire Line
	1450 5950 1450 6100
Wire Wire Line
	1450 6100 1350 6100
Connection ~ 1350 6100
Wire Wire Line
	1350 6100 1350 6150
Wire Wire Line
	1350 5850 1500 5850
Wire Wire Line
	2150 5650 2200 5650
Wire Wire Line
	2200 5650 2200 5550
Connection ~ 2200 5550
Wire Wire Line
	2150 5850 2250 5850
Wire Wire Line
	2250 5850 2250 5750
Wire Wire Line
	2250 5750 2150 5750
Connection ~ 2250 5850
$Comp
L Device:C_Small C6
U 1 1 612DDABA
P 2550 5650
F 0 "C6" H 2642 5696 50  0000 L CNN
F 1 "22u" H 2642 5605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2550 5650 50  0001 C CNN
F 3 "~" H 2550 5650 50  0001 C CNN
	1    2550 5650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C8
U 1 1 612DE581
P 2700 5650
F 0 "C8" H 2792 5696 50  0000 L CNN
F 1 "22u" H 2792 5605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2700 5650 50  0001 C CNN
F 3 "~" H 2700 5650 50  0001 C CNN
	1    2700 5650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C9
U 1 1 612DE782
P 2850 5650
F 0 "C9" H 2942 5696 50  0000 L CNN
F 1 "22u" H 2942 5605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2850 5650 50  0001 C CNN
F 3 "~" H 2850 5650 50  0001 C CNN
	1    2850 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 5550 2700 5550
Connection ~ 2700 5550
Wire Wire Line
	2700 5550 2850 5550
Wire Wire Line
	2550 5750 2700 5750
Connection ~ 2700 5750
Wire Wire Line
	2700 5750 2850 5750
Wire Wire Line
	2250 5850 2400 5850
Wire Wire Line
	2400 5850 2400 5450
Wire Wire Line
	2400 5450 2700 5450
Wire Wire Line
	2700 5450 2700 5300
Wire Wire Line
	2700 5300 2800 5300
Wire Wire Line
	2700 5450 2700 5550
Connection ~ 2700 5450
$Comp
L power:GND #PWR05
U 1 1 612EC7FF
P 2700 5850
F 0 "#PWR05" H 2700 5600 50  0001 C CNN
F 1 "GND" H 2705 5677 50  0000 C CNN
F 2 "" H 2700 5850 50  0001 C CNN
F 3 "" H 2700 5850 50  0001 C CNN
	1    2700 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 5750 2700 5850
$Comp
L Device:R_Small R9
U 1 1 612F0C42
P 2400 6050
F 0 "R9" V 2500 6050 50  0000 C CNN
F 1 "1M" V 2550 6050 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 2400 6050 50  0001 C CNN
F 3 "~" H 2400 6050 50  0001 C CNN
	1    2400 6050
	0    1    1    0   
$EndComp
Wire Wire Line
	2150 6050 2300 6050
Wire Wire Line
	2500 6050 2550 6050
Wire Wire Line
	2550 6050 2550 5850
Wire Wire Line
	2550 5850 2400 5850
Connection ~ 2400 5850
$Comp
L power:GND #PWR0109
U 1 1 612CAF66
P 9050 900
F 0 "#PWR0109" H 9050 650 50  0001 C CNN
F 1 "GND" V 9055 772 50  0000 R CNN
F 2 "" H 9050 900 50  0001 C CNN
F 3 "" H 9050 900 50  0001 C CNN
	1    9050 900 
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 612FCB53
P 1900 2850
F 0 "#PWR0116" H 1900 2600 50  0001 C CNN
F 1 "GND" H 1905 2677 50  0000 C CNN
F 2 "" H 1900 2850 50  0001 C CNN
F 3 "" H 1900 2850 50  0001 C CNN
	1    1900 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R13
U 1 1 6138CAF5
P 3000 5900
F 0 "R13" H 3059 5946 50  0000 L CNN
F 1 "402k" H 3059 5855 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 3000 5900 50  0001 C CNN
F 3 "~" H 3000 5900 50  0001 C CNN
	1    3000 5900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R14
U 1 1 6138D61D
P 3000 6100
F 0 "R14" H 3059 6146 50  0000 L CNN
F 1 "100k" H 3059 6055 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 3000 6100 50  0001 C CNN
F 3 "~" H 3000 6100 50  0001 C CNN
	1    3000 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 6000 2500 6000
Wire Wire Line
	2500 6000 2500 5950
Wire Wire Line
	2500 5950 2150 5950
Connection ~ 3000 6000
$Comp
L power:GND #PWR06
U 1 1 613934C8
P 3000 6200
F 0 "#PWR06" H 3000 5950 50  0001 C CNN
F 1 "GND" H 3005 6027 50  0000 C CNN
F 2 "" H 3000 6200 50  0001 C CNN
F 3 "" H 3000 6200 50  0001 C CNN
	1    3000 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 5800 2600 5850
Wire Wire Line
	2600 5850 2550 5850
Wire Wire Line
	2600 5800 3000 5800
Connection ~ 2550 5850
$EndSCHEMATC