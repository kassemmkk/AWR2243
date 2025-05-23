EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr B 17000 11000
encoding utf-8
Sheet 1 1
Title "PROC099B_LP Connector-SchDoc"
Date "22 05 2025"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 15300 10600 0    60   ~ 0
11
Text Notes 15550 10600 0    60   ~ 0
16
Text Notes 13610 10500 0    60   ~ 0
LP Connector
Text Notes 15200 10300 0    60   ~ 0
Not shown in title block
Text Notes 13320 10700 0    60   ~ 0
Not shown in title block
Wire Notes Line
	15700 10500 13100 10500
Wire Notes Line
	13100 10700 16800 10700
Text Notes 13130 10500 0    60   ~ 0
Sheet Title:
Text Notes 15230 10700 0    60   ~ 0
Size:
Text Notes 14720 10300 0    60   ~ 0
Mod. Date:
Text Notes 13130 10700 0    60   ~ 0
File:
Text Notes 15030 10600 0    60   ~ 0
Sheet:
Text Notes 15420 10600 0    60   ~ 0
of
Text Notes 15450 10700 0    60   ~ 0
B
Wire Notes Line
	15700 10500 13100 10500
Wire Notes Line
	11600 10500 4100 10500
Wire Notes Line
	13100 10600 15700 10600
Text Notes 15900 10700 0    60   ~ 0
http://www.ti.com
Text Notes 13130 10800 0    60   ~ 0
Contact:
Text Notes 13500 10800 0    60   ~ 0
=TechSupport
Wire Notes Line
	14700 10300 14700 10200
Wire Notes Line
	15700 10400 13100 10400
Text Notes 13650 10400 0    60   ~ 0
=PRJ_Title
Text Notes 13130 10400 0    60   ~ 0
Project Title:
Wire Notes Line
	13100 10200 13100 10800
Wire Notes Line
	16800 10200 13100 10200
Text Notes 13130 10300 0    60   ~ 0
Designed for:
Text Notes 13680 10300 0    60   ~ 0
=PRJ_Customer
Wire Notes Line
	15000 10600 15000 10500
Text Notes 13130 10600 0    60   ~ 0
Assembly Variant:
Text Notes 13870 10600 0    60   ~ 0
=variantName
Text Notes 15800 10800 0    48   ~ 0
© Texas Instruments
Text Notes 16500 10800 0    48   ~ 0
=CopyrightYear
Text Notes 11630 10700 0    60   ~ 0
Drawn By:
Text Notes 11630 10800 0    60   ~ 0
Engineer:
Text Notes 12050 10700 0    60   ~ 0
Adrian Ozer
Text Notes 12050 10800 0    60   ~ 0
=PRJ_Engineer
Wire Notes Line
	15700 10200 15700 10700
Text Label 4150 10500 0 60 ~
Texas Instruments and/or its licensors do not warrant the accuracy or completeness of this specification or any information contained therein. Texas Instruments and/or its licensors do not warrant that this design will meet the specifications, will be suitable for your application or fit for any particular purpose, or will operate in an implementation. Texas Instruments and/or its licensors do not warrant that the design is production worthy. You should completely validate and test your design implementation to confirm the system functionality for your application.
Wire Notes Line
	11600 10200 11600 10800
Wire Notes Line
	13100 10700 11600 10700
Wire Notes Line
	11600 10600 13100 10600
Wire Notes Line
	15200 10700 15200 10600
Wire Notes Line
	15700 10300 13100 10300
Wire Notes Line
	13100 10500 11600 10500
Wire Notes Line
	4100 10800 4100 10500
Text Notes 12100 10600 0    60   ~ 0
=VersionControl_RevNumber
Text Notes 11630 10600 0    60   ~ 0
SVN Rev:
Text Notes 12000 10500 0    60   ~ 0
=PRJ_Number
Text Notes 11630 10500 0    60   ~ 0
Number:
Wire Notes Line
	13100 10400 11600 10400
Text Notes 12630 10500 0    60   ~ 0
Rev:
Wire Notes Line
	12600 10500 12600 10400
Text Notes 12900 10500 0    60   ~ 0
=SCH_Rev
Wire Notes Line
	13100 10300 11600 10300
Text Notes 11630 10400 0    60   ~ 0
TID #:
Text Notes 12100 10350 0    60   ~ 0
=TID
Wire Notes Line
	13100 10200 11600 10200
Text Notes 11630 10300 0    60   ~ 0
Orderable:
Text Notes 12100 10250 0    60   ~ 0
=EVM_orderable
$Comp
L power:+MCU_3V3 #PWR?682F98C4
U 1 1 682F98C4
P 4400 2600
F 0 "MCU_3V3_4" H 4400 2600 20  0000 C CNN
F 1 "MCU_3V3" H 4400 2530 30  0000 C CNN
F 2 "" H 4400 2600 70  0000 C CNN
F 3 "" H 4400 2600 70  0000 C CNN
	1    4400 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 2400 5900 2800
$Comp
L power:+MCU_5V #PWR?682F98C3
U 1 1 682F98C3
P 5900 2400
F 0 "MCU_5V_3" H 5900 2400 20  0000 C CNN
F 1 "MCU_5V" H 5900 2330 30  0000 C CNN
F 2 "" H 5900 2400 70  0000 C CNN
F 3 "" H 5900 2400 70  0000 C CNN
	1    5900 2400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V_IN #PWR?682F98C2
U 1 1 682F98C2
P 7700 2200
F 0 "5V_IN_12" H 7700 2200 20  0000 C CNN
F 1 "5V_IN" H 7700 2130 30  0000 C CNN
F 2 "" H 7700 2200 70  0000 C CNN
F 3 "" H 7700 2200 70  0000 C CNN
	1    7700 2200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?682F98C1
U 1 1 682F98C1
P 8700 3400
F 0 "GND_155" H 8700 3540 20  0000 C CNN
F 1 "GND" H 8700 3510 30  0000 C CNN
F 2 "" H 8700 3400 70  0000 C CNN
F 3 "" H 8700 3400 70  0000 C CNN
	1    8700 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 3000 8700 3400
Wire Wire Line
	5500 3000 8700 3000
Wire Wire Line
	5900 2800 5500 2800
Wire Wire Line
	6300 2800 5900 2800
Wire Wire Line
	7700 2800 6700 2800
Wire Wire Line
	7700 2200 7700 2800
Wire Wire Line
	6300 3600 6200 3600
Wire Wire Line
	5500 3400 6300 3400
Wire Wire Line
	7300 3400 6700 3400
Wire Wire Line
	7300 3600 6700 3600
Wire Wire Line
	7300 3800 6700 3800
Wire Wire Line
	7300 4000 6700 4000
Wire Wire Line
	7300 4200 6700 4200
Wire Wire Line
	7300 4400 6700 4400
Wire Wire Line
	7300 4600 6700 4600
Wire Wire Line
	7300 4800 6700 4800
Text GLabel 7300 3400 2 60 BiDi ~
AR_ANATEST1
Text GLabel 7300 3600 2 60 BiDi ~
AR_ANATEST2
Text GLabel 7300 3800 2 60 BiDi ~
AR_ANATEST3
Text GLabel 7300 4000 2 60 BiDi ~
AR_ANATEST4
Text GLabel 7300 4200 2 60 BiDi ~
PGOOD
Text GLabel 7300 4400 2 60 BiDi ~
PMIC_EN1
Text GLabel 7300 4600 2 60 BiDi ~
AR_SYNC_OUT_SOP1
Text GLabel 7300 4800 2 60 BiDi ~
AR_PMIC_CLKOUT_SOP2
Wire Wire Line
	4400 3200 4400 2600
Wire Wire Line
	3600 3400 4500 3400
Wire Wire Line
	3100 3400 3600 3400
Wire Wire Line
	3300 3600 3100 3600
Wire Wire Line
	4200 4200 3100 4200
Wire Wire Line
	4500 4600 3100 4600
Wire Wire Line
	3100 4800 4500 4800
Wire Wire Line
	1600 1300 1600 1600
Wire Wire Line
	1900 1600 1900 2200
$Comp
L power:+3.3V #PWR?682F98C0
U 1 1 682F98C0
P 1600 1300
F 0 "+3.3VD_26" H 1600 1300 20  0000 C CNN
F 1 "3.3V" H 1600 1230 30  0000 C CNN
F 2 "" H 1600 1300 70  0000 C CNN
F 3 "" H 1600 1300 70  0000 C CNN
	1    1600 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 4200 2700 4200
Wire Wire Line
	1200 3800 2700 3800
Wire Wire Line
	1200 4400 2700 4400
Wire Wire Line
	1600 3400 1600 2600
Wire Wire Line
	2700 3600 1900 3600
Text GLabel 400 3400 2 60 BiDi ~
AR_RS232TX
Text GLabel 400 3600 2 60 BiDi ~
AR_RS232RX
Text GLabel 400 3800 2 60 BiDi ~
AR_SYNC_IN
Text GLabel 400 4200 2 60 BiDi ~
SPICLK1
Text GLabel 400 4400 2 60 BiDi ~
AR_GPIO_0
Wire Wire Line
	1200 4600 2700 4600
Text GLabel 400 4600 2 60 BiDi ~
AR_SCL
Wire Wire Line
	1200 4800 2700 4800
Text GLabel 400 4800 2 60 BiDi ~
AR_SDA
Wire Wire Line
	1900 3600 1200 3600
Wire Wire Line
	1900 2600 1900 3600
Wire Wire Line
	11900 4600 11500 4600
Wire Wire Line
	11900 4800 11500 4800
Wire Wire Line
	10100 3000 11100 3000
Wire Wire Line
	10100 3400 11100 3400
Wire Wire Line
	10100 3200 10300 3200
Wire Wire Line
	10100 3800 10900 3800
Wire Wire Line
	10100 4000 10800 4000
Wire Wire Line
	10100 4200 11100 4200
Wire Wire Line
	10100 4400 11100 4400
Wire Wire Line
	10100 4600 11100 4600
Text GLabel 9300 3000 2 60 BiDi ~
AR_NERR_OUT
Text GLabel 9300 3200 2 60 BiDi ~
AR_NERRIN
Text GLabel 9300 3400 2 60 BiDi ~
AR_MCUCLKOUT
Text GLabel 9200 3800 2 60 BiDi ~
AR_MSS_LOGGER
Text GLabel 9300 4000 2 60 BiDi ~
AR_WARMRST
Text GLabel 9200 4200 2 60 BiDi ~
AR_BSS_LOGGER
Text GLabel 9300 4400 2 60 BiDi ~
MCU_SOP2
Text GLabel 9300 4600 2 60 BiDi ~
MCU_SOP1
Text GLabel 9300 4800 2 60 BiDi ~
MCU_SOP0
Wire Wire Line
	10100 4800 11100 4800
Wire Wire Line
	13700 5000 13700 4600
Wire Wire Line
	14800 5000 13700 5000
Wire Wire Line
	15500 3200 15200 3200
Wire Wire Line
	15500 3500 15200 3500
Wire Wire Line
	15500 4100 15200 4100
Wire Wire Line
	15500 4400 15200 4400
Wire Wire Line
	15500 4700 15200 4700
Wire Wire Line
	15500 5000 15200 5000
$Comp
L power:GND #PWR?682F98BF
U 1 1 682F98BF
P 13300 2800
F 0 "GND_156" H 13300 2940 20  0000 C CNN
F 1 "GND" H 13300 2910 30  0000 C CNN
F 2 "" H 13300 2800 70  0000 C CNN
F 3 "" H 13300 2800 70  0000 C CNN
	1    13300 2800
	1    0    0    -1  
$EndComp
Text GLabel 15500 3200 2 60 BiDi ~
AR_GPIO_1
Text GLabel 15500 3500 2 60 BiDi ~
AR_NRST_MCU
Text GLabel 15500 4100 2 60 BiDi ~
MOSI1
Text GLabel 15500 4400 2 60 BiDi ~
MISO1
Text GLabel 15500 4700 2 60 BiDi ~
AR_HOSTINTR1
Text GLabel 15500 5000 2 60 BiDi ~
AR_GPIO_2
Text GLabel 15500 2900 2 60 BiDi ~
CS1
Text Notes 7400 700 0    168   ~ 12
BP/LP CONNECTOR
$Comp
L power:GND #PWR?682F98BE
U 1 1 682F98BE
P 11900 7100
F 0 "GND_157" H 11900 7240 20  0000 C CNN
F 1 "GND" H 11900 7210 30  0000 C CNN
F 2 "" H 11900 7100 70  0000 C CNN
F 3 "" H 11900 7100 70  0000 C CNN
	1    11900 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	11900 7000 11400 7000
Wire Wire Line
	11900 7100 11900 7000
Wire Wire Line
	11400 7100 11900 7100
Wire Wire Line
	12400 7700 11300 7700
Wire Wire Line
	12400 6900 12400 7700
$Comp
L power:+MCU_5V #PWR?682F98BD
U 1 1 682F98BD
P 12400 6900
F 0 "MCU_5V_4" H 12400 6900 20  0000 C CNN
F 1 "MCU_5V" H 12400 6830 30  0000 C CNN
F 2 "" H 12400 6900 70  0000 C CNN
F 3 "" H 12400 6900 70  0000 C CNN
	1    12400 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 7700 3800 7700
Wire Wire Line
	5200 7800 3800 7800
Wire Wire Line
	5200 8000 5200 7800
Wire Wire Line
	4200 7900 3800 7900
Text GLabel 4200 7700 2 60 BiDi ~
AR_VSENSE
Text GLabel 4200 7900 2 60 BiDi ~
AR_ANAMUX
Text Notes 3600 7400 0    108   ~ 0
ANALOG SIGNALS
$Comp
L power:GND #PWR?682F98BC
U 1 1 682F98BC
P 5200 8000
F 0 "GND_158" H 5200 8140 20  0000 C CNN
F 1 "GND" H 5200 8110 30  0000 C CNN
F 2 "" H 5200 8000 70  0000 C CNN
F 3 "" H 5200 8000 70  0000 C CNN
	1    5200 8000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?682F98BB
U 1 1 682F98BB
P 11900 8600
F 0 "GND_159" H 11900 8740 20  0000 C CNN
F 1 "GND" H 11900 8710 30  0000 C CNN
F 2 "" H 11900 8600 70  0000 C CNN
F 3 "" H 11900 8600 70  0000 C CNN
	1    11900 8600
	1    0    0    -1  
$EndComp
Wire Wire Line
	11900 8500 11500 8500
Wire Wire Line
	11900 8600 11900 8500
Wire Wire Line
	11500 8600 11900 8600
Wire Wire Line
	11400 8900 11400 8800
Wire Wire Line
	12400 8900 11400 8900
Wire Wire Line
	12400 8200 12400 8900
$Comp
L power:+MCU_3V3 #PWR?682F98BA
U 1 1 682F98BA
P 12400 8200
F 0 "MCU_3V3_5" H 12400 8200 20  0000 C CNN
F 1 "MCU_3V3" H 12400 8130 30  0000 C CNN
F 2 "" H 12400 8200 70  0000 C CNN
F 3 "" H 12400 8200 70  0000 C CNN
	1    12400 8200
	1    0    0    -1  
$EndComp
Text Label 12900 3500 0 60 ~
D_LOGGER
Wire Wire Line
	1600 3400 2700 3400
Wire Wire Line
	1200 3400 1600 3400
Wire Wire Line
	11100 8500 11500 8500
Wire Wire Line
	11500 8600 11100 8600
Wire Wire Line
	11400 8700 11400 8800
Wire Wire Line
	11100 8700 11400 8700
Wire Wire Line
	11100 7000 11400 7000
Wire Wire Line
	11400 7100 11100 7100
Wire Wire Line
	11300 7200 11100 7200
Wire Wire Line
	11300 7700 11300 7200
Wire Wire Line
	11600 3500 12000 3500
Wire Wire Line
	11600 3400 11600 3500
Wire Wire Line
	11500 3400 11600 3400
Wire Wire Line
	11700 3400 12000 3400
Wire Wire Line
	11700 3200 11700 3400
Wire Wire Line
	11500 3200 11700 3200
Wire Wire Line
	11900 3300 12000 3300
Wire Wire Line
	11900 3000 11900 3300
Wire Wire Line
	11500 3000 11900 3000
Wire Wire Line
	11500 3700 11800 3700
Wire Wire Line
	11500 3800 11500 3700
Wire Wire Line
	11300 3800 11500 3800
Wire Wire Line
	11600 3800 12000 3800
Wire Wire Line
	11600 4000 11600 3800
Wire Wire Line
	12000 3700 11800 3700
Wire Wire Line
	11600 4000 11500 4000
Wire Wire Line
	11700 3900 12000 3900
Wire Wire Line
	11700 4200 11700 3900
Wire Wire Line
	11500 4200 11700 4200
Wire Wire Line
	11800 4000 12000 4000
Wire Wire Line
	11800 4400 11800 4000
Wire Wire Line
	11700 4400 11800 4400
Wire Wire Line
	11700 4400 11500 4400
Wire Wire Line
	11900 4100 12000 4100
Wire Wire Line
	11900 4600 11900 4100
Wire Wire Line
	12000 4800 12000 4200
Wire Wire Line
	11900 4800 12000 4800
Wire Wire Line
	13900 4400 14800 4400
Wire Wire Line
	13900 4200 13900 4400
Wire Wire Line
	13800 4700 13800 4400
Wire Wire Line
	14800 4700 13800 4700
Wire Wire Line
	13800 3500 12800 3500
Wire Wire Line
	13800 3300 13800 3500
Wire Wire Line
	13900 3200 14800 3200
Wire Wire Line
	13900 3600 13900 3200
Wire Wire Line
	14000 3700 14000 3500
Wire Wire Line
	13900 3700 14000 3700
Wire Wire Line
	13900 4200 13900 3900
Wire Wire Line
	4400 3200 4600 3200
Wire Wire Line
	4500 3400 4600 3400
Wire Wire Line
	3800 3500 3300 3500
Wire Wire Line
	4600 3500 3800 3500
Wire Wire Line
	3300 3600 3300 3500
Wire Wire Line
	4300 4400 3100 4400
Wire Wire Line
	4200 3600 4600 3600
Wire Wire Line
	4200 3800 4200 3600
Wire Wire Line
	3100 3800 4200 3800
Wire Wire Line
	4600 3800 4500 3800
Wire Wire Line
	4300 4200 4200 4200
Wire Wire Line
	4300 3800 4300 4200
Wire Wire Line
	4500 3800 4300 3800
Wire Wire Line
	4600 3900 4500 3900
Wire Wire Line
	4400 3900 4500 3900
Wire Wire Line
	4400 4400 4400 3900
Wire Wire Line
	4300 4400 4400 4400
Wire Wire Line
	4500 4000 4600 4000
Wire Wire Line
	4500 4600 4500 4000
Wire Wire Line
	4600 4800 4600 4100
Wire Wire Line
	4500 4800 4600 4800
Wire Wire Line
	5400 2800 5500 2800
Wire Wire Line
	5400 3200 5400 2800
Wire Wire Line
	5500 3300 5500 3000
Wire Wire Line
	5400 3300 5500 3300
Wire Wire Line
	5400 3400 5500 3400
Wire Wire Line
	6200 3500 6200 3600
Wire Wire Line
	5400 3500 6200 3500
Wire Wire Line
	6100 3600 5400 3600
Wire Wire Line
	6100 3800 6100 3600
Wire Wire Line
	6100 3800 6300 3800
Wire Wire Line
	6000 3700 5400 3700
Wire Wire Line
	6000 4000 6000 3700
Wire Wire Line
	6300 4000 6000 4000
Wire Wire Line
	5900 3800 5400 3800
Wire Wire Line
	5900 4200 5900 3800
Wire Wire Line
	6300 4200 5900 4200
Wire Wire Line
	5800 3900 5400 3900
Wire Wire Line
	5800 4400 5800 3900
Wire Wire Line
	6300 4400 5800 4400
Wire Wire Line
	5700 4000 5400 4000
Wire Wire Line
	5700 4600 5700 4000
Wire Wire Line
	6300 4600 5700 4600
Wire Wire Line
	5600 4100 5400 4100
Wire Wire Line
	5600 4800 5600 4100
Wire Wire Line
	6300 4800 5600 4800
Text Label 14800 2900 0 70 ~
0
Text Label 14800 3500 0 70 ~
0
Text Label 14800 4100 0 70 ~
0
Text Label 14800 4400 0 70 ~
0
Text Label 14800 4700 0 70 ~
0
Text Label 11120 4010 0 70 ~
0
Text Label 11120 3010 0 70 ~
0
Text Label 11120 3210 0 70 ~
0
Text Label 11120 3410 0 70 ~
0
Text Label 11120 4210 0 70 ~
0
Text Label 11120 4410 0 70 ~
0
Text Label 11120 4610 0 70 ~
0
Text Label 11120 4810 0 70 ~
0
Text Label 2720 4210 0 70 ~
0
Text Label 6320 3610 0 70 ~
0
Text Label 6320 3410 0 70 ~
0
Text Label 6320 3810 0 70 ~
0
Text Label 6320 4010 0 70 ~
0
Text Label 2720 4810 0 70 ~
0
Text Label 2720 4610 0 70 ~
0
Text Label 6300 4200 0 70 ~
0
Text Label 1930 2490 0 70 ~
100k
Text Label 1630 2490 0 70 ~
100k
Text Label 14800 5000 0 70 ~
0
Text Label 14800 3200 0 70 ~
0
Text Label 10900 3800 0 70 ~
0
Text Label 6300 4400 0 70 ~
0
Text Label 6300 4600 0 70 ~
0
Text Label 6300 4800 0 70 ~
0
Text Label 2700 4400 0 70 ~
0
Text Label 2700 3800 0 70 ~
0
Text Label 2700 3600 0 70 ~
0
Text Label 2700 3400 0 70 ~
0
Text Label 6390 2930 0 70 ~
0
Wire Wire Line
	13300 2700 13300 2800
Wire Wire Line
	12900 2700 13300 2700
Wire Wire Line
	12900 3300 12900 2700
Wire Wire Line
	12800 3300 12900 3300
Text Label 3000 3200 1 70 ~
Net Class
Text Label 5900 4800 3 70 ~
Net Class
Text Label 11500 5000 3 70 ~
Net Class
Text Label 5900 2600 2 70 ~
Net Class
Text Label 4400 2800 0 70 ~
Net Class
Text Label 11600 3500 2 70 ~
Net Class
Text Label 12100 2900 0 70 ~
Net Class
Text Label 14300 2900 1 70 ~
Net Class
Text Label 13000 4800 2 70 ~
Net Class
Text Label 14300 5000 1 70 ~
Net Class
Text Label 14300 3500 1 70 ~
Net Class
Text Label 4100 4200 1 70 ~
Net Class
Text Label 4700 4700 0 70 ~
Net Class
Text Label 6400 3200 0 70 ~
Net Class
NoConn ~ 4600 3300
NoConn ~ 4600 3700
NoConn ~ 12000 3600
NoConn ~ 12800 3400
Text Label 13390 5330 0 70 ~
0
Text Label 13390 5630 0 70 ~
0
Wire Wire Line
	12800 3700 13900 3700
Wire Wire Line
	12800 3600 13900 3600
Wire Wire Line
	13100 3900 13900 3900
Wire Wire Line
	12800 3900 13100 3900
Wire Wire Line
	13100 5200 13100 3900
Wire Wire Line
	13300 5200 13100 5200
Wire Wire Line
	13000 5500 13000 3800
Wire Wire Line
	13300 5500 13000 5500
Wire Wire Line
	14000 5200 13700 5200
Wire Wire Line
	14000 5500 13700 5500
Text Label 2720 5210 0 70 ~
0
Text Label 2720 5510 0 70 ~
0
Wire Wire Line
	3600 5200 3600 3400
Wire Wire Line
	3100 5200 3600 5200
Wire Wire Line
	3800 5500 3800 3500
Wire Wire Line
	3100 5500 3800 5500
Wire Wire Line
	1900 5200 2700 5200
Wire Wire Line
	1900 5500 2700 5500
NoConn ~ 2500 5200
NoConn ~ 1600 2700
Text GLabel 1100 5500 2 60 BiDi ~
AR_RS232TX
Text GLabel 1100 5200 2 60 BiDi ~
AR_RS232RX
Text GLabel 14000 5200 2 60 BiDi ~
MISO1
Text GLabel 14000 5500 2 60 BiDi ~
MOSI1
NoConn ~ 12800 4200
Wire Wire Line
	11100 3200 10300 3200
Wire Wire Line
	11100 4000 10800 4000
Wire Wire Line
	1600 2200 1600 1600
Wire Wire Line
	1600 1600 1900 1600
Text Label 3900 3200 1 70 ~
Net Class
Wire Wire Line
	13700 4100 12800 4100
Wire Wire Line
	13700 4600 13700 4100
Wire Wire Line
	13800 4000 12800 4000
Wire Wire Line
	13800 4400 13800 4000
Wire Wire Line
	13000 3800 12800 3800
Wire Wire Line
	14000 3800 13000 3800
Wire Wire Line
	14000 4100 14000 3800
Wire Wire Line
	14800 4100 14000 4100
Text Label 13100 4800 0 70 ~
Net Class
Wire Wire Line
	13800 2900 13800 3300
Wire Wire Line
	14800 2900 13800 2900
Text Label 14300 3200 1 70 ~
Net Class
Text Label 14300 4700 1 70 ~
Net Class
Text Label 14300 4400 1 70 ~
Net Class
Wire Wire Line
	14800 3500 14000 3500
Wire Wire Line
	15500 2900 15200 2900
Text Label 14300 4100 1 70 ~
Net Class
Connection ~ 1600 3400
Connection ~ 1600 1600
Connection ~ 1900 3600
Connection ~ 3600 3400
Connection ~ 3800 3500
Connection ~ 5900 2800
Connection ~ 11900 8600
Connection ~ 11900 7100
Connection ~ 13000 3800
Connection ~ 13100 3900
$Comp
L CMP-0078183-1 J4_2
U 1 1 682F98B9
P 10800 8600
F 0 "J4_2" H 10900 8800 60  0000 R BNN
	1    10800 8600
	-1    0    0    -1
$EndComp
$Comp
L Resistor R18_2
U 1 1 682F98B8
P 11300 4000
F 0 "R18_2" H 11400 4000 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    11300 4000
	1    0    0    -1
$EndComp
$Comp
L Resistor R19_2
U 1 1 682F98B7
P 11300 3000
F 0 "R19_2" H 11400 3000 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    11300 3000
	1    0    0    -1
$EndComp
$Comp
L Resistor R24_2
U 1 1 682F98B6
P 11300 3200
F 0 "R24_2" H 11400 3200 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    11300 3200
	1    0    0    -1
$EndComp
$Comp
L Resistor R25_2
U 1 1 682F98B5
P 11300 3400
F 0 "R25_2" H 11400 3400 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    11300 3400
	1    0    0    -1
$EndComp
$Comp
L Resistor R31_2
U 1 1 682F98B4
P 11300 4200
F 0 "R31_2" H 11400 4200 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    11300 4200
	1    0    0    -1
$EndComp
$Comp
L Resistor R32_2
U 1 1 682F98B3
P 11300 4400
F 0 "R32_2" H 11400 4400 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    11300 4400
	1    0    0    -1
$EndComp
$Comp
L Resistor R35_2
U 1 1 682F98B2
P 11300 4600
F 0 "R35_2" H 11400 4600 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    11300 4600
	1    0    0    -1
$EndComp
$Comp
L Resistor R36_2
U 1 1 682F98B1
P 11300 4800
F 0 "R36_2" H 11400 4800 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    11300 4800
	1    0    0    -1
$EndComp
$Comp
L CMP-0027008-4 R76_2
U 1 1 682F98B0
P 2900 4200
F 0 "R76_2" H 3000 4200 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    2900 4200
	1    0    0    -1
$EndComp
$Comp
L Resistor R94_2
U 1 1 682F98AF
P 6500 3600
F 0 "R94_2" H 6600 3600 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    6500 3600
	1    0    0    -1
$EndComp
$Comp
L CMP-0078183-1 J7_2
U 1 1 682F98AE
P 10800 7100
F 0 "J7_2" H 10900 7300 60  0000 R BNN
	1    10800 7100
	-1    0    0    -1
$EndComp
$Comp
L CMP-0027008-4 R104_2
U 1 1 682F98AD
P 6500 3400
F 0 "R104_2" H 6600 3400 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    6500 3400
	1    0    0    -1
$EndComp
$Comp
L Resistor R105_2
U 1 1 682F98AC
P 6500 3800
F 0 "R105_2" H 6600 3800 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    6500 3800
	1    0    0    -1
$EndComp
$Comp
L Resistor R106_2
U 1 1 682F98AB
P 6500 4000
F 0 "R106_2" H 6600 4000 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    6500 4000
	1    0    0    -1
$EndComp
$Comp
L Resistor R162_2
U 1 1 682F98AA
P 2900 4800
F 0 "R162_2" H 3000 4800 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    2900 4800
	1    0    0    -1
$EndComp
$Comp
L Resistor R163_2
U 1 1 682F98A9
P 2900 4600
F 0 "R163_2" H 3000 4600 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    2900 4600
	1    0    0    -1
$EndComp
$Comp
L Resistor R107_2
U 1 1 682F98A8
P 6500 4200
F 0 "R107_2" H 6600 4200 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    6500 4200
	1    0    0    -1
$EndComp
$Comp
L Resistor R172_2
U 1 1 682F98A7
P 1900 2400
F 0 "R172_2" V 1910 2370 60  0000 R TNN
F 4 "100k" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    1900 2400
	0    -1   -1   0
$EndComp
$Comp
L Resistor R173_2
U 1 1 682F98A6
P 1600 2400
F 0 "R173_2" V 1610 2370 60  0000 R TNN
F 4 "100k" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    1600 2400
	0    -1   -1   0
$EndComp
$Comp
L Resistor R8_2
U 1 1 682F98A5
P 15000 5000
F 0 "R8_2" H 15100 5000 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    15000 5000
	1    0    0    -1
$EndComp
$Comp
L Resistor R9_2
U 1 1 682F98A4
P 15000 3200
F 0 "R9_2" H 15100 3200 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    15000 3200
	1    0    0    -1
$EndComp
$Comp
L CMP-0078182-1 J6_2
U 1 1 682F98A3
P 12400 3800
F 0 "J6_2" H 12610 4400 60  0000 R BNN
	1    12400 3800
	-1    0    0    -1
$EndComp
$Comp
L Resistor R26_2
U 1 1 682F98A2
P 11100 3800
F 0 "R26_2" H 11200 3800 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    11100 3800
	1    0    0    -1
$EndComp
$Comp
L Resistor R102_2
U 1 1 682F98A1
P 6500 4400
F 0 "R102_2" H 6600 4400 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    6500 4400
	1    0    0    -1
$EndComp
$Comp
L Resistor R108_2
U 1 1 682F98A0
P 6500 4600
F 0 "R108_2" H 6600 4600 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    6500 4600
	1    0    0    -1
$EndComp
$Comp
L Resistor R109_2
U 1 1 682F989F
P 6500 4800
F 0 "R109_2" H 6600 4800 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    6500 4800
	1    0    0    -1
$EndComp
$Comp
L Resistor R164_2
U 1 1 682F989E
P 2900 4400
F 0 "R164_2" H 3000 4400 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    2900 4400
	1    0    0    -1
$EndComp
$Comp
L Resistor R165_2
U 1 1 682F989D
P 2900 3800
F 0 "R165_2" H 3000 3800 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    2900 3800
	1    0    0    -1
$EndComp
$Comp
L Resistor R166_2
U 1 1 682F989C
P 2900 3600
F 0 "R166_2" H 3000 3600 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    2900 3600
	1    0    0    -1
$EndComp
$Comp
L Resistor R169_2
U 1 1 682F989B
P 2900 3400
F 0 "R169_2" H 3000 3400 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    2900 3400
	1    0    0    -1
$EndComp
$Comp
L Resistor R115_2
U 1 1 682F989A
P 6500 2800
F 0 "R115_2" H 6390 2830 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    6500 2800
	1    0    0    -1
$EndComp
$Comp
L Header_3x1 P1_2
U 1 1 682F9899
P 3600 7700
F 0 "P1_2" H 3800 7800 60  0000 R BNN
	1    3600 7700
	-1    0    0    -1
$EndComp
$Comp
L CMP-0078182-1 J5_2
U 1 1 682F9898
P 5000 3700
F 0 "J5_2" H 5210 4300 60  0000 R BNN
	1    5000 3700
	-1    0    0    -1
$EndComp
$Comp
L Resistor R3_2
U 1 1 682F9897
P 13500 5200
F 0 "R3_2" H 13390 5230 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    13500 5200
	1    0    0    -1
$EndComp
$Comp
L Resistor R5_2
U 1 1 682F9896
P 13500 5500
F 0 "R5_2" H 13390 5530 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    13500 5500
	1    0    0    -1
$EndComp
$Comp
L Resistor R168_2
U 1 1 682F9895
P 2900 5200
F 0 "R168_2" H 3000 5200 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    2900 5200
	1    0    0    -1
$EndComp
$Comp
L Resistor R167_2
U 1 1 682F9894
P 2900 5500
F 0 "R167_2" H 3000 5500 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    2900 5500
	1    0    0    -1
$EndComp
$Comp
L Resistor R1_2
U 1 1 682F9893
P 15000 2900
F 0 "R1_2" H 15100 2900 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    15000 2900
	1    0    0    -1
$EndComp
$Comp
L Resistor R2_2
U 1 1 682F9892
P 15000 3500
F 0 "R2_2" H 15100 3500 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    15000 3500
	1    0    0    -1
$EndComp
$Comp
L Resistor R4_2
U 1 1 682F9891
P 15000 4100
F 0 "R4_2" H 15100 4100 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    15000 4100
	1    0    0    -1
$EndComp
$Comp
L Resistor R6_2
U 1 1 682F9890
P 15000 4400
F 0 "R6_2" H 15100 4400 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    15000 4400
	1    0    0    -1
$EndComp
$Comp
L Resistor R10_2
U 1 1 682F988F
P 15000 4700
F 0 "R10_2" H 15100 4700 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    15000 4700
	1    0    0    -1
$EndComp
$EndSCHEMATC