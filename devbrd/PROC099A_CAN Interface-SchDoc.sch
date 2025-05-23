EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr B 17000 11000
encoding utf-8
Sheet 1 1
Title "PROC099A_CAN Interface-SchDoc"
Date "22 05 2025"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 15300 10600 0    60   ~ 0
14
Text Notes 15550 10600 0    60   ~ 0
16
Text Notes 13610 10500 0    60   ~ 0
CAN Interface
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
Text Notes 7500 600 0    168   ~ 12
CAN INTERFACE
Text Label 8100 5300 0 70 ~
TCAN1042HGVDQ1
$Comp
L power:GND #PWR?682F9C30
U 1 1 682F9C30
P 13900 5000
F 0 "GND" H 13900 5140 20  0000 C CNN
F 1 "GND" H 13900 5110 30  0000 C CNN
F 2 "" H 13900 5000 70  0000 C CNN
F 3 "" H 13900 5000 70  0000 C CNN
	1    13900 5000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?682F9C2F
U 1 1 682F9C2F
P 10100 5100
F 0 "GND_2" H 10100 5240 20  0000 C CNN
F 1 "GND" H 10100 5210 30  0000 C CNN
F 2 "" H 10100 5100 70  0000 C CNN
F 3 "" H 10100 5100 70  0000 C CNN
	1    10100 5100
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?682F9C2E
U 1 1 682F9C2E
P 7300 4100
F 0 "+3.3VD" H 7300 4100 20  0000 C CNN
F 1 "3.3V" H 7300 4030 30  0000 C CNN
F 2 "" H 7300 4100 70  0000 C CNN
F 3 "" H 7300 4100 70  0000 C CNN
	1    7300 4100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V_IN #PWR?682F9C2D
U 1 1 682F9C2D
P 7800 3600
F 0 "5V_IN" H 7800 3600 20  0000 C CNN
F 1 "5V_IN" H 7800 3530 30  0000 C CNN
F 2 "" H 7800 3600 70  0000 C CNN
F 3 "" H 7800 3600 70  0000 C CNN
	1    7800 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?682F9C2C
U 1 1 682F9C2C
P 5000 4400
F 0 "GND_3" H 5000 4540 20  0000 C CNN
F 1 "GND" H 5000 4510 30  0000 C CNN
F 2 "" H 5000 4400 70  0000 C CNN
F 3 "" H 5000 4400 70  0000 C CNN
	1    5000 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?682F9C2B
U 1 1 682F9C2B
P 3800 4600
F 0 "GND_4" H 3800 4740 20  0000 C CNN
F 1 "GND" H 3800 4710 30  0000 C CNN
F 2 "" H 3800 4600 70  0000 C CNN
F 3 "" H 3800 4600 70  0000 C CNN
	1    3800 4600
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?682F9C2A
U 1 1 682F9C2A
P 1500 3700
F 0 "+3.3VD_2" H 1500 3700 20  0000 C CNN
F 1 "3.3V" H 1500 3630 30  0000 C CNN
F 2 "" H 1500 3700 70  0000 C CNN
F 3 "" H 1500 3700 70  0000 C CNN
	1    1500 3700
	1    0    0    -1  
$EndComp
Text GLabel 3900 3200 2 60 BiDi ~
AR_GPIO_0
Text Label 7830 3990 0 70 ~
0
Text Label 3190 4130 0 70 ~
10.0k
Text Label 12730 3890 0 70 ~
61.9
Text Label 12730 4990 0 70 ~
61.9
Text Label 6700 4700 0 70 ~
0
Text Label 6600 5100 0 70 ~
0
Text Label 3090 3330 0 70 ~
0
Text Label 1890 4130 0 70 ~
10.0k
Text Label 6800 4200 0 70 ~
0.1µF
Text Label 6800 4400 0 70 ~
0.1µF
Text GLabel 5400 4600 2 60 BiDi ~
CAN_TX
Text GLabel 5400 5000 2 60 BiDi ~
CAN_RX
Wire Wire Line
	12700 4500 12700 4000
Wire Wire Line
	12700 4700 12700 4500
Wire Wire Line
	13100 4500 12700 4500
Wire Wire Line
	14100 4600 14300 4600
Wire Wire Line
	14100 4700 14100 4600
Wire Wire Line
	13400 4700 14100 4700
Wire Wire Line
	13400 5800 13400 4700
Wire Wire Line
	12700 5800 13400 5800
Wire Wire Line
	13900 5000 13900 4500
Wire Wire Line
	13900 4500 14300 4500
Wire Wire Line
	13400 4500 13900 4500
Wire Wire Line
	10100 5000 9700 5000
Wire Wire Line
	10100 5100 10100 5000
Wire Wire Line
	7800 4200 7900 4200
Wire Wire Line
	6800 4200 7800 4200
Wire Wire Line
	7300 4400 7900 4400
Wire Wire Line
	6800 4400 7300 4400
Wire Wire Line
	7300 4400 7300 4100
Wire Wire Line
	7800 3700 7800 3600
Wire Wire Line
	7800 4200 7800 4100
Wire Wire Line
	6900 5000 7900 5000
Wire Wire Line
	6300 5000 6500 5000
Wire Wire Line
	7900 4600 7000 4600
Wire Wire Line
	6300 4600 6600 4600
Wire Wire Line
	3800 4000 3500 4000
Wire Wire Line
	3800 4600 3800 4000
Wire Wire Line
	1500 4000 1800 4000
Wire Wire Line
	1500 3700 1500 4000
Wire Wire Line
	2600 3200 2600 4000
Wire Wire Line
	3000 3200 2600 3200
Wire Wire Line
	3900 3200 3400 3200
Wire Wire Line
	2900 4000 3100 4000
Wire Wire Line
	2600 4000 2900 4000
Wire Wire Line
	2200 4000 2600 4000
Wire Wire Line
	4900 4800 7900 4800
Wire Wire Line
	4900 4900 4900 4800
Wire Wire Line
	2900 4900 4900 4900
Wire Wire Line
	2900 4000 2900 4900
Wire Wire Line
	5200 4400 6500 4400
Wire Wire Line
	5000 4400 5200 4400
Wire Wire Line
	5200 4200 6500 4200
Wire Wire Line
	5200 4400 5200 4200
Wire Wire Line
	12700 5800 12700 5100
Wire Wire Line
	12100 5800 12700 5800
Wire Wire Line
	12100 4600 12100 5800
Wire Wire Line
	9800 4600 12100 4600
Wire Wire Line
	9800 4800 9800 4600
Wire Wire Line
	9700 4800 9800 4800
Wire Wire Line
	12100 3200 12700 3200
Wire Wire Line
	12100 4400 12100 3200
Wire Wire Line
	9800 4400 12100 4400
Wire Wire Line
	9800 4200 9800 4400
Wire Wire Line
	9700 4200 9800 4200
Wire Wire Line
	12700 3200 12700 3600
Wire Wire Line
	13400 3200 12700 3200
Wire Wire Line
	13400 4200 13400 3200
Wire Wire Line
	14100 4200 13400 4200
Wire Wire Line
	14100 4400 14100 4200
Wire Wire Line
	14300 4400 14100 4400
Text Label 7400 5000 3 70 ~
Net Class
Text Label 7400 4600 3 70 ~
Net Class
Text Label 12500 3200 1 70 ~
Net Class
Text Label 12600 5800 3 70 ~
Net Class
Text Label 12700 4400 2 70 ~
Net Class
Text Label 2900 4400 2 70 ~
Net Class
Text Notes 4100 6000 0    108   ~ 0
MUX BETWEEN SPI AND CAN INTERFACE
Text Label 6000 9700 0 70 ~
TS3A5018RSVR
Text GLabel 4200 7800 2 60 BiDi ~
AR_MISO1
Text GLabel 4200 8200 2 60 BiDi ~
AR_MOSI1
Text Label 3430 6990 0 70 ~
10.0k
$Comp
L power:+3.3V #PWR?682F9C29
U 1 1 682F9C29
P 3400 6400
F 0 "+3.3VD_3" H 3400 6400 20  0000 C CNN
F 1 "3.3V" H 3400 6330 30  0000 C CNN
F 2 "" H 3400 6400 70  0000 C CNN
F 3 "" H 3400 6400 70  0000 C CNN
	1    3400 6400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?682F9C28
U 1 1 682F9C28
P 2500 7400
F 0 "GND_5" H 2500 7540 20  0000 C CNN
F 1 "GND" H 2500 7510 30  0000 C CNN
F 2 "" H 2500 7400 70  0000 C CNN
F 3 "" H 2500 7400 70  0000 C CNN
	1    2500 7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?682F9C27
U 1 1 682F9C27
P 7400 9500
F 0 "GND_6" H 7400 9640 20  0000 C CNN
F 1 "GND" H 7400 9610 30  0000 C CNN
F 2 "" H 7400 9500 70  0000 C CNN
F 3 "" H 7400 9500 70  0000 C CNN
	1    7400 9500
	1    0    0    -1  
$EndComp
Text GLabel 8900 7800 2 60 BiDi ~
CAN_TX
Text GLabel 8900 8000 2 60 BiDi ~
MISO1
Text GLabel 8900 8200 2 60 BiDi ~
CAN_RX
Text GLabel 8900 8400 2 60 BiDi ~
MOSI1
$Comp
L power:+3.3V #PWR?682F9C26
U 1 1 682F9C26
P 7700 6300
F 0 "+3.3VD_4" H 7700 6300 20  0000 C CNN
F 1 "3.3V" H 7700 6230 30  0000 C CNN
F 2 "" H 7700 6300 70  0000 C CNN
F 3 "" H 7700 6300 70  0000 C CNN
	1    7700 6300
	1    0    0    -1  
$EndComp
Text Label 7300 7100 0 70 ~
0.1µF
$Comp
L power:GND #PWR?682F9C25
U 1 1 682F9C25
P 7200 7200
F 0 "GND_7" H 7200 7340 20  0000 C CNN
F 1 "GND" H 7200 7310 30  0000 C CNN
F 2 "" H 7200 7200 70  0000 C CNN
F 3 "" H 7200 7200 70  0000 C CNN
	1    7200 7200
	1    0    0    -1  
$EndComp
Text GLabel 4000 8600 2 60 BiDi ~
AR_SPICLK1
Text GLabel 4000 9000 2 60 BiDi ~
AR_CS1
Text Label 5090 9530 0 70 ~
10.0k
$Comp
L power:GND #PWR?682F9C24
U 1 1 682F9C24
P 4700 9700
F 0 "GND_8" H 4700 9840 20  0000 C CNN
F 1 "GND" H 4700 9810 30  0000 C CNN
F 2 "" H 4700 9700 70  0000 C CNN
F 3 "" H 4700 9700 70  0000 C CNN
	1    4700 9700
	1    0    0    -1  
$EndComp
Text GLabel 8900 8800 2 60 BiDi ~
SPICLK1
Text GLabel 8900 9200 2 60 BiDi ~
CS1
Wire Wire Line
	3400 6400 3400 6700
Wire Wire Line
	5400 7100 3400 7100
Wire Wire Line
	5400 7600 5400 7100
Wire Wire Line
	5700 7600 5400 7600
Wire Wire Line
	2500 7300 2500 7400
Wire Wire Line
	7400 9400 7100 9400
Wire Wire Line
	7400 9500 7400 9400
Wire Wire Line
	8900 7800 7100 7800
Wire Wire Line
	8900 8000 7100 8000
Wire Wire Line
	8900 8200 7100 8200
Wire Wire Line
	8900 8400 7100 8400
Wire Wire Line
	7200 7100 7200 7200
Wire Wire Line
	7200 6700 7200 6800
Wire Wire Line
	7700 6700 7200 6700
Wire Wire Line
	5000 8600 5700 8600
Wire Wire Line
	5700 9000 5000 9000
Wire Wire Line
	5400 9400 5700 9400
Wire Wire Line
	4700 9400 5000 9400
Wire Wire Line
	4700 9700 4700 9400
Wire Wire Line
	3400 7300 3400 7100
Wire Wire Line
	3100 7300 3400 7300
Wire Wire Line
	5000 8200 5700 8200
Wire Wire Line
	5000 7800 5700 7800
Wire Wire Line
	7100 9200 8900 9200
Wire Wire Line
	7100 8800 8900 8800
Wire Wire Line
	7700 7600 7100 7600
Wire Wire Line
	7700 6700 7700 7600
Wire Wire Line
	7700 6300 7700 6700
Text Label 3700 7600 1 70 ~
Net Class
Text Label 8600 7800 1 70 ~
Net Class
Text Label 7900 8000 1 70 ~
Net Class
Text Label 8600 8200 1 70 ~
Net Class
Text Label 7900 8400 1 70 ~
Net Class
Text Label 8600 8800 1 70 ~
Net Class
Text Label 7900 9200 1 70 ~
Net Class
Text Notes 7700 3100 0    108   ~ 0
CAN TRANSCIEVER
NoConn ~ 7100 9000
NoConn ~ 7100 8600
Text Label 13200 4700 0 70 ~
4700pF
Connection ~ 2600 4000
Connection ~ 2900 4000
Connection ~ 3400 7100
Connection ~ 5200 4400
Connection ~ 7300 4400
Connection ~ 7700 6700
Connection ~ 7800 4200
Connection ~ 12700 5800
Connection ~ 12700 4500
Connection ~ 12700 3200
Connection ~ 13900 4500
$Comp
L TCAN1042_V U3
U 1 1 682F9C23
P 8800 4600
F 0 "U3" H 8600 5200 60  0000 L BNN
F 4 "TCAN1042HGVDQ1" V 1400 2000 60  0001 C CNN "PartNumber"
	1    8800 4600
	1    0    0    -1
$EndComp
$Comp
L Resistor R178
U 1 1 682F9C22
P 2000 4000
F 0 "R178" H 1890 4030 60  0000 L BNN
F 4 "10.0k" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    2000 4000
	1    0    0    -1
$EndComp
$Comp
L Capacitor C16
U 1 1 682F9C21
P 6700 4200
F 0 "C16" H 7100 4200 60  0000 R TNN
F 4 "0.1µF" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    6700 4200
	-1   0    0    1
$EndComp
$Comp
L Capacitor C20
U 1 1 682F9C20
P 6700 4400
F 0 "C20" H 7100 4400 60  0000 R TNN
F 4 "0.1µF" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    6700 4400
	-1   0    0    1
$EndComp
$Comp
L CMP-0067415-1 U13
U 1 1 682F9C1F
P 6400 8500
F 0 "U13" H 5900 9600 60  0000 L BNN
F 4 "TS3A5018RSVR" V 1400 2000 60  0001 C CNN "PartNumber"
	1    6400 8500
	1    0    0    -1
$EndComp
$Comp
L SW_SPST-single S1
U 1 1 682F9C1E
P 2800 7300
F 0 "S1" H 2700 7370 60  0000 L BNN
	1    2800 7300
	1    0    0    -1
$EndComp
$Comp
L CMP-0025958-2 R125
U 1 1 682F9C1D
P 3400 6900
F 0 "R125" V 3410 6870 60  0000 R TNN
F 4 "10.0k" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    3400 6900
	0    -1   -1   0
$EndComp
$Comp
L Capacitor C90
U 1 1 682F9C1C
P 7200 6900
F 0 "C90" V 7290 6990 60  0000 L BNN
F 4 "0.1µF" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    7200 6900
	0    1    1    0
$EndComp
$Comp
L CMP-0025958-2 R195
U 1 1 682F9C1B
P 5200 9400
F 0 "R195" H 5310 9370 60  0000 R TNN
F 4 "10.0k" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    5200 9400
	-1   0    0    1
$EndComp
$Comp
L Capacitor C24
U 1 1 682F9C1A
P 13200 4500
F 0 "C24" H 13190 4590 60  0000 L BNN
F 4 "4700pF" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    13200 4500
	1    0    0    -1
$EndComp
$Comp
L Receptacle_3x1 J3
U 1 1 682F9C19
P 14600 4500
F 0 "J3" H 14490 4700 60  0000 L BNN
	1    14600 4500
	1    0    0    -1
$EndComp
$Comp
L CMP-0026992-2 R78
U 1 1 682F9C18
P 7800 3900
F 0 "R78" V 7810 3870 60  0000 R TNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    7800 3900
	0    -1   -1   0
$EndComp
$Comp
L Resistor R86
U 1 1 682F9C17
P 3300 4000
F 0 "R86" H 3190 4030 60  0000 L BNN
F 4 "10.0k" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    3300 4000
	1    0    0    -1
$EndComp
$Comp
L Resistor R85
U 1 1 682F9C16
P 12700 3800
F 0 "R85" V 12710 3770 60  0000 R TNN
F 4 "61.9" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    12700 3800
	0    -1   -1   0
$EndComp
$Comp
L Resistor R87
U 1 1 682F9C15
P 12700 4900
F 0 "R87" V 12710 4870 60  0000 R TNN
F 4 "61.9" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    12700 4900
	0    -1   -1   0
$EndComp
$Comp
L CMP-0026992-2 R11
U 1 1 682F9C14
P 6800 4600
F 0 "R11" H 6900 4600 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    6800 4600
	1    0    0    -1
$EndComp
$Comp
L CMP-0026992-2 R12
U 1 1 682F9C13
P 6700 5000
F 0 "R12" H 6800 5000 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    6700 5000
	1    0    0    -1
$EndComp
$Comp
L CMP-0026992-2 R177
U 1 1 682F9C12
P 3200 3200
F 0 "R177" H 3090 3230 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    3200 3200
	1    0    0    -1
$EndComp
$EndSCHEMATC