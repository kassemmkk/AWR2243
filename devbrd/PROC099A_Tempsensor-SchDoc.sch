EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr B 17000 11000
encoding utf-8
Sheet 1 1
Title "PROC099A_Tempsensor-SchDoc"
Date "22 05 2025"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 15300 10600 0    60   ~ 0
15
Text Notes 15550 10600 0    60   ~ 0
16
Text Notes 13610 10500 0    60   ~ 0
Tempsensor
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
Text Notes 6900 600 0    168   ~ 12
ONBOARD TEMP SENSORS
Wire Wire Line
	9800 5500 9900 5500
Wire Wire Line
	8700 5500 9300 5500
Wire Wire Line
	8700 5400 8700 5500
Wire Wire Line
	11100 5700 11300 5700
Wire Wire Line
	12200 5700 11700 5700
Text GLabel 12200 5700 2 60 BiDi ~
AR_SDA
Wire Wire Line
	13100 5300 13100 6000
Wire Wire Line
	11100 5300 13100 5300
$Comp
L power:+3V3_BRD #PWR?682F9A4B
U 1 1 682F9A4B
P 13900 6400
F 0 "3V3_BRD" H 13900 6400 20  0000 C CNN
F 1 "3V3_BRD" H 13900 6330 30  0000 C CNN
F 2 "" H 13900 6400 70  0000 C CNN
F 3 "" H 13900 6400 70  0000 C CNN
	1    13900 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	13100 6700 13900 6700
Wire Wire Line
	13100 6400 13100 6700
Wire Wire Line
	11100 5500 11500 5500
Wire Wire Line
	12200 5500 11900 5500
Text GLabel 12200 5500 2 60 BiDi ~
AR_SCL
$Comp
L power:GND #PWR?682F9A4A
U 1 1 682F9A4A
P 9400 5000
F 0 "GND_79" H 9400 5140 20  0000 C CNN
F 1 "GND" H 9400 5110 30  0000 C CNN
F 2 "" H 9400 5000 70  0000 C CNN
F 3 "" H 9400 5000 70  0000 C CNN
	1    9400 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 5300 9900 5300
Wire Wire Line
	9700 5200 9700 5300
Text Notes 2200 4600 0    108   ~ 0
TEMP SENSOR CLOSE TO PMIC
Text Notes 2400 4300 0    108   ~ 0
DEFAULT I2C ADDRESS 0X48
Wire Wire Line
	4700 5500 4500 5500
Wire Wire Line
	4700 5700 4500 5700
Wire Wire Line
	5400 5700 5100 5700
Wire Wire Line
	5400 5500 5100 5500
Text GLabel 5400 5700 2 60 BiDi ~
AR_SDA
Text GLabel 5400 5500 2 60 BiDi ~
AR_SCL
Wire Wire Line
	6400 6500 6400 6200
Wire Wire Line
	6400 5300 6400 5800
Wire Wire Line
	4500 5300 6400 5300
$Comp
L power:+3V3_BRD #PWR?682F9A49
U 1 1 682F9A49
P 6700 6400
F 0 "3V3_BRD_2" H 6700 6400 20  0000 C CNN
F 1 "3V3_BRD" H 6700 6330 30  0000 C CNN
F 2 "" H 6700 6400 70  0000 C CNN
F 3 "" H 6700 6400 70  0000 C CNN
	1    6700 6400
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3_BRD #PWR?682F9A48
U 1 1 682F9A48
P 3500 7300
F 0 "3V3_BRD_3" H 3500 7300 20  0000 C CNN
F 1 "3V3_BRD" H 3500 7230 30  0000 C CNN
F 2 "" H 3500 7300 70  0000 C CNN
F 3 "" H 3500 7300 70  0000 C CNN
	1    3500 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 7100 3200 7400
Wire Wire Line
	2700 5500 2700 6700
Wire Wire Line
	3300 5500 2700 5500
Wire Wire Line
	3200 6400 3200 6700
Wire Wire Line
	4000 6400 3200 6400
Wire Wire Line
	4600 6400 4000 6400
Wire Wire Line
	4600 5900 4600 6400
Wire Wire Line
	4500 5900 4600 5900
Wire Wire Line
	5100 7000 5100 6700
Wire Wire Line
	4000 7000 5100 7000
Wire Wire Line
	4000 6400 4000 7000
Text Notes 8500 4600 0    108   ~ 0
TEMP SENSOR AWAY FROM PMIC
Text Notes 8600 4300 0    108   ~ 0
DEFAULT I2C ADDRESS 0X49
Text Label 11800 5600 0 70 ~
0
Text Label 9490 5630 0 70 ~
0
Text Label 11390 5830 0 70 ~
0
Text Label 5100 5500 0 70 ~
0
Text Label 4790 5830 0 70 ~
0
Text Label 2730 6990 0 70 ~
0
Text Label 10490 6830 0 70 ~
0
Text Label 3230 6990 0 70 ~
0
Text Label 13130 6290 0 70 ~
10.0k
Text Label 6430 6090 0 70 ~
10.0k
Text Label 11700 7300 0 70 ~
0.1µF
$Comp
L power:GND #PWR?682F9A47
U 1 1 682F9A47
P 5700 6100
F 0 "GND_80" H 5700 6240 20  0000 C CNN
F 1 "GND" H 5700 6210 30  0000 C CNN
F 2 "" H 5700 6100 70  0000 C CNN
F 3 "" H 5700 6100 70  0000 C CNN
	1    5700 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 5900 5700 6100
Wire Wire Line
	5100 5900 5700 5900
Wire Wire Line
	5100 6300 5100 5900
$Comp
L power:GND #PWR?682F9A46
U 1 1 682F9A46
P 2100 5700
F 0 "GND_81" H 2100 5840 20  0000 C CNN
F 1 "GND" H 2100 5810 30  0000 C CNN
F 2 "" H 2100 5700 70  0000 C CNN
F 3 "" H 2100 5700 70  0000 C CNN
	1    2100 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 6400 5100 6300
Text Label 5200 6700 0 70 ~
0.1µF
Wire Wire Line
	13900 6700 13900 6400
Wire Wire Line
	3500 7400 3200 7400
Wire Wire Line
	3500 7300 3500 7400
Wire Wire Line
	6700 6500 6400 6500
Wire Wire Line
	6700 6400 6700 6500
Wire Wire Line
	9700 5000 9700 5200
Wire Wire Line
	9400 5000 9700 5000
Wire Wire Line
	2100 5300 3300 5300
Wire Wire Line
	2100 5700 2100 5300
$Comp
L power:+3V3_BRD #PWR?682F9A45
U 1 1 682F9A45
P 8700 5400
F 0 "3V3_BRD_4" H 8700 5400 20  0000 C CNN
F 1 "3V3_BRD" H 8700 5330 30  0000 C CNN
F 2 "" H 8700 5400 70  0000 C CNN
F 3 "" H 8700 5400 70  0000 C CNN
	1    8700 5400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?682F9A44
U 1 1 682F9A44
P 2700 7100
F 0 "GND_82" H 2700 7240 20  0000 C CNN
F 1 "GND" H 2700 7210 30  0000 C CNN
F 2 "" H 2700 7100 70  0000 C CNN
F 3 "" H 2700 7100 70  0000 C CNN
	1    2700 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	11600 6700 10800 6700
Wire Wire Line
	11600 5900 11600 6700
Wire Wire Line
	11100 5900 11600 5900
Wire Wire Line
	9900 6700 10400 6700
Wire Wire Line
	9900 5900 9900 6700
Wire Wire Line
	9300 5900 9900 5900
Wire Wire Line
	9300 5500 9300 5900
Wire Wire Line
	9400 5500 9300 5500
Wire Wire Line
	11600 7000 11600 6700
$Comp
L power:GND #PWR?682F9A43
U 1 1 682F9A43
P 11600 7300
F 0 "GND_83" H 11600 7440 20  0000 C CNN
F 1 "GND" H 11600 7410 30  0000 C CNN
F 2 "" H 11600 7300 70  0000 C CNN
F 3 "" H 11600 7300 70  0000 C CNN
	1    11600 7300
	1    0    0    -1  
$EndComp
Connection ~ 4000 6400
Connection ~ 9300 5500
Connection ~ 11600 6700
$Comp
L CMP-0067397-2 IC321
U 1 1 682F9A42
P 10500 5600
	1    10500 5600
	-1   0    0    1
$EndComp
$Comp
L Resistor R183
U 1 1 682F9A41
P 3200 6900
F 0 "R183" V 3190 6930 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    3200 6900
	0    1    1    0
$EndComp
$Comp
L Resistor R184
U 1 1 682F9A40
P 13100 6200
F 0 "R184" V 13090 6230 60  0000 L BNN
F 4 "10.0k" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    13100 6200
	0    1    1    0
$EndComp
$Comp
L Resistor R179
U 1 1 682F9A3F
P 6400 6000
F 0 "R179" V 6390 6030 60  0000 L BNN
F 4 "10.0k" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    6400 6000
	0    1    1    0
$EndComp
$Comp
L Capacitor C85
U 1 1 682F9A3E
P 11600 7200
F 0 "C85" V 11610 7110 60  0000 R TNN
F 4 "0.1µF" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    11600 7200
	0    -1   -1   0
$EndComp
$Comp
L Capacitor C84
U 1 1 682F9A3D
P 5100 6600
F 0 "C84" V 5110 6510 60  0000 R TNN
F 4 "0.1µF" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    5100 6600
	0    -1   -1   0
$EndComp
$Comp
L TMP112 IC327
U 1 1 682F9A3C
P 3900 5600
	1    3900 5600
	-1   0    0    1
$EndComp
$Comp
L Resistor R185
U 1 1 682F9A3B
P 11700 5500
F 0 "R185" H 11810 5470 60  0000 R TNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    11700 5500
	-1   0    0    1
$EndComp
$Comp
L Resistor R188
U 1 1 682F9A3A
P 9600 5500
F 0 "R188" H 9490 5530 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    9600 5500
	1    0    0    -1
$EndComp
$Comp
L Resistor R186
U 1 1 682F9A39
P 11500 5700
F 0 "R186" H 11390 5730 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    11500 5700
	1    0    0    -1
$EndComp
$Comp
L Resistor R180
U 1 1 682F9A38
P 4900 5500
F 0 "R180" H 5010 5470 60  0000 R TNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    4900 5500
	-1   0    0    1
$EndComp
$Comp
L Resistor R182
U 1 1 682F9A37
P 4900 5700
F 0 "R182" H 4790 5730 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    4900 5700
	1    0    0    -1
$EndComp
$Comp
L Resistor R181
U 1 1 682F9A36
P 2700 6900
F 0 "R181" V 2690 6930 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    2700 6900
	0    1    1    0
$EndComp
$Comp
L Resistor R187
U 1 1 682F9A35
P 10600 6700
F 0 "R187" H 10710 6670 60  0000 R TNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    10600 6700
	-1   0    0    1
$EndComp
$EndSCHEMATC