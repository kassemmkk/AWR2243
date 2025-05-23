EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr B 17000 11000
encoding utf-8
Sheet 1 1
Title "PROC099A_QSPI_Flash_Reference-SchDoc"
Date "22 05 2025"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 15300 10600 0    60   ~ 0
7
Text Notes 15550 10600 0    60   ~ 0
16
Text Notes 13610 10500 0    60   ~ 0
QSPI flash section
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
Text Notes 7000 600 0    168   ~ 12
QSPI FLASH REFERENCE
Text GLabel 6500 5100 2 60 BiDi ~
AR_QSPI_D1
Text GLabel 4800 5200 2 60 BiDi ~
AR_QSPI_D2
$Comp
L power:+3.3V #PWR?682F9A71
U 1 1 682F9A71
P 6400 3900
F 0 "+3.3VD_14" H 6400 3900 20  0000 C CNN
F 1 "3.3V" H 6400 3830 30  0000 C CNN
F 2 "" H 6400 3900 70  0000 C CNN
F 3 "" H 6400 3900 70  0000 C CNN
	1    6400 3900
	1    0    0    -1  
$EndComp
Text GLabel 7500 4900 2 60 BiDi ~
AR_QSPI_D0
Text GLabel 5400 6400 2 60 BiDi ~
AR_QSPI_D3
$Comp
L power:+3.3V #PWR?682F9A70
U 1 1 682F9A70
P 6700 5600
F 0 "+3.3VD_15" H 6700 5600 20  0000 C CNN
F 1 "3.3V" H 6700 5530 30  0000 C CNN
F 2 "" H 6700 5600 70  0000 C CNN
F 3 "" H 6700 5600 70  0000 C CNN
	1    6700 5600
	1    0    0    -1  
$EndComp
Text Label 6730 5990 0 70 ~
10.0k
Text Label 6430 4790 0 70 ~
10.0k
Text Label 9500 5100 0 70 ~
33.2
Text Label 9800 5300 0 70 ~
33.2
Text Label 7900 6500 0 70 ~
33.2
Text Label 8890 5030 0 70 ~
33.2
$Comp
L power:+3.3V #PWR?682F9A6F
U 1 1 682F9A6F
P 9200 3400
F 0 "+3.3VD_16" H 9200 3400 20  0000 C CNN
F 1 "3.3V" H 9200 3330 30  0000 C CNN
F 2 "" H 9200 3400 70  0000 C CNN
F 3 "" H 9200 3400 70  0000 C CNN
	1    9200 3400
	1    0    0    -1  
$EndComp
Text GLabel 7600 4000 2 60 BiDi ~
AR_QSPI_CS
Text Label 9230 3890 0 70 ~
47.5k
Text GLabel 7500 4400 2 60 BiDi ~
AR_QSPI_SCLK
Text Label 9090 4530 0 70 ~
33.2
$Comp
L power:+3.3V #PWR?682F9A6E
U 1 1 682F9A6E
P 10100 2600
F 0 "+3.3VD_17" H 10100 2600 20  0000 C CNN
F 1 "3.3V" H 10100 2530 30  0000 C CNN
F 2 "" H 10100 2600 70  0000 C CNN
F 3 "" H 10100 2600 70  0000 C CNN
	1    10100 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?682F9A6D
U 1 1 682F9A6D
P 11000 4000
F 0 "GND_74" H 11000 4140 20  0000 C CNN
F 1 "GND" H 11000 4110 30  0000 C CNN
F 2 "" H 11000 4000 70  0000 C CNN
F 3 "" H 11000 4000 70  0000 C CNN
	1    11000 4000
	1    0    0    -1  
$EndComp
Text Label 10800 3600 0 70 ~
1uF
Text Label 11300 3600 0 70 ~
0.1uF
Text Label 10130 2990 0 70 ~
0
$Comp
L power:GND #PWR?682F9A6C
U 1 1 682F9A6C
P 12000 5400
F 0 "GND_75" H 12000 5540 20  0000 C CNN
F 1 "GND" H 12000 5510 30  0000 C CNN
F 2 "" H 12000 5400 70  0000 C CNN
F 3 "" H 12000 5400 70  0000 C CNN
	1    12000 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 5200 10200 5200
Wire Wire Line
	6400 3900 6400 4500
Wire Wire Line
	8800 4900 8300 4900
Wire Wire Line
	6700 5700 6700 5600
Wire Wire Line
	6700 6400 6700 6100
Wire Wire Line
	9200 5300 10200 5300
Wire Wire Line
	9200 6400 9200 5300
Wire Wire Line
	8000 6400 9200 6400
Wire Wire Line
	8400 4000 9200 4000
Wire Wire Line
	9200 3600 9200 3400
Wire Wire Line
	9000 4400 8300 4400
Wire Wire Line
	9700 4000 9200 4000
Wire Wire Line
	9700 4800 9700 4000
Wire Wire Line
	10200 4800 9700 4800
Wire Wire Line
	10100 2600 10100 2700
Wire Wire Line
	10500 3300 10100 3300
Wire Wire Line
	10500 3100 10500 3300
Wire Wire Line
	10700 3100 10500 3100
Wire Wire Line
	11200 3100 10700 3100
Wire Wire Line
	11200 3300 11200 3100
Wire Wire Line
	10100 3300 10100 3100
Wire Wire Line
	10100 4600 10100 3300
Wire Wire Line
	10200 4600 10100 4600
Wire Wire Line
	10700 4000 10700 3600
Wire Wire Line
	11000 4000 10700 4000
Wire Wire Line
	11200 4000 11200 3600
Wire Wire Line
	11000 4000 11200 4000
Wire Wire Line
	12000 5200 11800 5200
Wire Wire Line
	12000 5300 12000 5200
Wire Wire Line
	12000 5400 12000 5300
Wire Wire Line
	12000 5300 11800 5300
Wire Wire Line
	6700 6400 7600 6400
Wire Wire Line
	6200 6400 6700 6400
Wire Wire Line
	7200 5100 9200 5100
Wire Wire Line
	9400 4900 9200 4900
Wire Wire Line
	9400 5000 9400 4900
Wire Wire Line
	10200 5000 9400 5000
Wire Wire Line
	9600 4400 9400 4400
Wire Wire Line
	9600 4900 9600 4400
Wire Wire Line
	10200 4900 9600 4900
Wire Wire Line
	10200 5100 9600 5100
Wire Wire Line
	10700 3100 10700 3300
Wire Wire Line
	6400 5200 5600 5200
Wire Wire Line
	9500 5200 6400 5200
Wire Wire Line
	6400 5200 6400 4900
Text Label 10100 3500 2 70 ~
Net Class
Text Label 5200 4800 1 70 ~
Net Class
NoConn ~ 8600 4000
Connection ~ 6400 5200
Connection ~ 6700 6400
Connection ~ 9200 4000
Connection ~ 10100 3300
Connection ~ 10700 3100
Connection ~ 11000 4000
Connection ~ 12000 5300
$Comp
L MX25V1635FZ U1
U 1 1 682F9A6B
P 11000 5000
F 0 "U1" H 10800 5500 60  0000 L BNN
F 1 "MX25V1635FZNQ" H 10400 4500 60  0000 L BNN
F 2 "" H 10400 4500 60  0000 C CNN
F 3 "" H 10400 4500 60  0000 C CNN
	1    11000 5000
	1    0    0    -1
$EndComp
$Comp
L Capacitor C1
U 1 1 682F9A6A
P 10700 3400
F 0 "C1" V 10790 3490 60  0000 L BNN
F 4 "1uF" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    10700 3400
	0    1    1    0
$EndComp
$Comp
L Capacitor C2
U 1 1 682F9A69
P 11200 3400
F 0 "C2" V 11290 3490 60  0000 L BNN
F 4 "0.1uF" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    11200 3400
	0    1    1    0
$EndComp
$Comp
L Resistor R37
U 1 1 682F9A68
P 10100 2900
F 0 "R37" V 10090 2930 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    10100 2900
	0    1    1    0
$EndComp
$Comp
L Resistor R41
U 1 1 682F9A67
P 6700 5900
F 0 "R41" V 6710 5870 60  0000 R TNN
F 4 "10.0k" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    6700 5900
	0    -1   -1   0
$EndComp
$Comp
L Resistor R43
U 1 1 682F9A66
P 6400 4700
F 0 "R43" V 6410 4670 60  0000 R TNN
F 4 "10.0k" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    6400 4700
	0    -1   -1   0
$EndComp
$Comp
L Resistor R39
U 1 1 682F9A65
P 9400 5100
F 0 "R39" H 9100 5100 60  0000 L BNN
F 4 "33.2" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    9400 5100
	1    0    0    -1
$EndComp
$Comp
L Resistor R42
U 1 1 682F9A64
P 9700 5200
F 0 "R42" H 9800 5200 60  0000 L BNN
F 4 "33.2" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    9700 5200
	1    0    0    -1
$EndComp
$Comp
L Resistor R40
U 1 1 682F9A63
P 7800 6400
F 0 "R40" H 7700 6400 60  0000 R TNN
F 4 "33.2" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    7800 6400
	-1   0    0    1
$EndComp
$Comp
L Resistor R45
U 1 1 682F9A62
P 9000 4900
F 0 "R45" H 9110 4870 60  0000 R TNN
F 4 "33.2" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    9000 4900
	-1   0    0    1
$EndComp
$Comp
L Resistor R38
U 1 1 682F9A61
P 9200 3800
F 0 "R38" V 9210 3770 60  0000 R TNN
F 4 "47.5k" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    9200 3800
	0    -1   -1   0
$EndComp
$Comp
L Resistor R44
U 1 1 682F9A60
P 9200 4400
F 0 "R44" H 9310 4370 60  0000 R TNN
F 4 "33.2" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    9200 4400
	-1   0    0    1
$EndComp
$EndSCHEMATC