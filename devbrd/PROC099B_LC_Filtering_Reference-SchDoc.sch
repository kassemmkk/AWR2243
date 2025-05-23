EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr B 17000 11000
encoding utf-8
Sheet 1 1
Title "PROC099B_LC_Filtering_Reference-SchDoc"
Date "22 05 2025"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 15300 10600 0    60   ~ 0
5
Text Notes 15550 10600 0    60   ~ 0
16
Text Notes 13610 10500 0    60   ~ 0
=title
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
L power:+PMIC_1V8 #PWR?682F990E
U 1 1 682F990E
P 5200 3500
F 0 "PMIC_1V8_5" H 5200 3500 20  0000 C CNN
F 1 "PMIC_1V8" H 5200 3430 30  0000 C CNN
F 2 "" H 5200 3500 70  0000 C CNN
F 3 "" H 5200 3500 70  0000 C CNN
	1    5200 3500
	1    0    0    -1  
$EndComp
$Comp
L power:+PMIC_1V0 #PWR?682F990D
U 1 1 682F990D
P 5200 5300
F 0 "PMIC_1V0_7" H 5200 5300 20  0000 C CNN
F 1 "PMIC_1V0" H 5200 5230 30  0000 C CNN
F 2 "" H 5200 5300 70  0000 C CNN
F 3 "" H 5200 5300 70  0000 C CNN
	1    5200 5300
	1    0    0    -1  
$EndComp
$Comp
L power:+PMIC_1V0 #PWR?682F990C
U 1 1 682F990C
P 8600 3600
F 0 "PMIC_1V0_8" H 8600 3600 20  0000 C CNN
F 1 "PMIC_1V0" H 8600 3530 30  0000 C CNN
F 2 "" H 8600 3600 70  0000 C CNN
F 3 "" H 8600 3600 70  0000 C CNN
	1    8600 3600
	1    0    0    -1  
$EndComp
$Comp
L power:+AR_1V8 #PWR?682F990B
U 1 1 682F990B
P 7700 3900
F 0 "AR_1V8_15" H 7700 3900 20  0000 C CNN
F 1 "AR_1V8" H 7700 3830 30  0000 C CNN
F 2 "" H 7700 3900 70  0000 C CNN
F 3 "" H 7700 3900 70  0000 C CNN
	1    7700 3900
	1    0    0    -1  
$EndComp
$Comp
L power:AR_1P3_RF1 #PWR?682F990A
U 1 1 682F990A
P 7600 5700
F 0 "AR_1P3_RF1_7" H 7600 5700 20  0000 C CNN
F 1 "AR_1P3_RF1" H 7600 5630 30  0000 C CNN
F 2 "" H 7600 5700 70  0000 C CNN
F 3 "" H 7600 5700 70  0000 C CNN
	1    7600 5700
	1    0    0    -1  
$EndComp
$Comp
L power:AR_1P3_RF2 #PWR?682F9909
U 1 1 682F9909
P 11200 4000
F 0 "AR_1P3_RF2_8" H 11200 4000 20  0000 C CNN
F 1 "AR_1P3_RF2" H 11200 3930 30  0000 C CNN
F 2 "" H 11200 4000 70  0000 C CNN
F 3 "" H 11200 4000 70  0000 C CNN
	1    11200 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 4000 5200 3500
Wire Wire Line
	5400 4000 5200 4000
Wire Wire Line
	5200 5800 5200 5300
Wire Wire Line
	5400 5800 5200 5800
Wire Wire Line
	8600 4100 8600 3600
Wire Wire Line
	9000 4100 8600 4100
Wire Wire Line
	10500 4100 10100 4100
Wire Wire Line
	10900 4100 10500 4100
Wire Wire Line
	11200 4100 10900 4100
Wire Wire Line
	11200 4000 11200 4100
Text Label 7600 5800 0 70 ~
Net Class
Text Label 7700 4000 0 70 ~
Net Class
Text Label 11200 4100 0 70 ~
Net Class
$Comp
L power:+PMIC_1V2 #PWR?682F9908
U 1 1 682F9908
P 8600 5400
F 0 "PMIC_1V2_3" H 8600 5400 20  0000 C CNN
F 1 "PMIC_1V2" H 8600 5330 30  0000 C CNN
F 2 "" H 8600 5400 70  0000 C CNN
F 3 "" H 8600 5400 70  0000 C CNN
	1    8600 5400
	1    0    0    -1  
$EndComp
$Comp
L power:+AR_1V2 #PWR?682F9907
U 1 1 682F9907
P 11200 5800
F 0 "AR_1V2_14" H 11200 5800 20  0000 C CNN
F 1 "AR_1V2" H 11200 5730 30  0000 C CNN
F 2 "" H 11200 5800 70  0000 C CNN
F 3 "" H 11200 5800 70  0000 C CNN
	1    11200 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 5900 8600 5400
Wire Wire Line
	9000 5900 8600 5900
Wire Wire Line
	11200 5900 10100 5900
Wire Wire Line
	11200 5800 11200 5900
Text Label 11200 5900 0 70 ~
Net Class
Text Notes 6800 600 0    168   ~ 12
LC FILTERING REFERENCE
Text Label 6900 6200 0 70 ~
1uF
Text Label 7300 6300 0 70 ~
10uF
$Comp
L power:GND #PWR?682F9906
U 1 1 682F9906
P 6800 6500
F 0 "GND_139" H 6800 6640 20  0000 C CNN
F 1 "GND" H 6800 6610 30  0000 C CNN
F 2 "" H 6800 6500 70  0000 C CNN
F 3 "" H 6800 6500 70  0000 C CNN
	1    6800 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 5800 6800 6000
Wire Wire Line
	7200 5800 7200 6000
Wire Wire Line
	7200 6400 7200 6300
Wire Wire Line
	6800 6400 7200 6400
Wire Wire Line
	6800 6500 6800 6400
Wire Wire Line
	6800 6400 6800 6300
Text Label 10600 4600 0 70 ~
1uF
Text Label 11000 4600 0 70 ~
10uF
Wire Wire Line
	9600 4100 10100 4100
Wire Wire Line
	9600 5900 10100 5900
$Comp
L power:GND #PWR?682F9905
U 1 1 682F9905
P 10500 4800
F 0 "GND_140" H 10500 4940 20  0000 C CNN
F 1 "GND" H 10500 4910 30  0000 C CNN
F 2 "" H 10500 4800 70  0000 C CNN
F 3 "" H 10500 4800 70  0000 C CNN
	1    10500 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	10500 4100 10500 4300
Wire Wire Line
	10900 4100 10900 4300
Wire Wire Line
	10900 4700 10900 4600
Wire Wire Line
	10500 4700 10900 4700
Wire Wire Line
	10500 4800 10500 4700
Wire Wire Line
	10500 4600 10500 4700
Text Label 7300 4500 0 70 ~
10uF
Text Label 6900 4400 0 70 ~
1uF
$Comp
L power:GND #PWR?682F9904
U 1 1 682F9904
P 6800 4700
F 0 "GND_141" H 6800 4840 20  0000 C CNN
F 1 "GND" H 6800 4810 30  0000 C CNN
F 2 "" H 6800 4700 70  0000 C CNN
F 3 "" H 6800 4700 70  0000 C CNN
	1    6800 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 4000 6800 4200
Wire Wire Line
	7200 4000 7200 4200
Wire Wire Line
	7200 4600 7200 4500
Wire Wire Line
	6800 4600 7200 4600
Wire Wire Line
	6800 4700 6800 4600
Wire Wire Line
	6800 4500 6800 4600
Text Label 6390 7830 0 70 ~
0
$Comp
L power:AR_1P3_RF2 #PWR?682F9903
U 1 1 682F9903
P 5400 7600
F 0 "AR_1P3_RF2_9" H 5400 7600 20  0000 C CNN
F 1 "AR_1P3_RF2" H 5400 7530 30  0000 C CNN
F 2 "" H 5400 7600 70  0000 C CNN
F 3 "" H 5400 7600 70  0000 C CNN
	1    5400 7600
	1    0    0    -1  
$EndComp
$Comp
L power:AR_VOUT_PA #PWR?682F9902
U 1 1 682F9902
P 7500 7600
F 0 "AR_VOUT_PA_6" H 7500 7600 20  0000 C CNN
F 1 "AR_VOUT_PA" H 7500 7530 30  0000 C CNN
F 2 "" H 7500 7600 70  0000 C CNN
F 3 "" H 7500 7600 70  0000 C CNN
	1    7500 7600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 7700 6300 7700
Wire Wire Line
	5400 7600 5400 7700
Wire Wire Line
	7500 7700 6700 7700
Wire Wire Line
	7500 7600 7500 7700
Wire Wire Line
	6800 4000 6000 4000
Wire Wire Line
	7200 4000 6800 4000
Wire Wire Line
	7700 4000 7200 4000
Wire Wire Line
	7700 3900 7700 4000
Wire Wire Line
	6800 5800 6000 5800
Wire Wire Line
	7200 5800 6800 5800
Wire Wire Line
	7600 5800 7200 5800
Wire Wire Line
	7600 5700 7600 5800
Text Label 5490 4130 0 70 ~
100nH
Text Label 9090 4230 0 70 ~
100nH
Text Label 9090 6030 0 70 ~
100nH
Text Label 5490 5930 0 70 ~
100nH
Connection ~ 6800 6400
Connection ~ 6800 5800
Connection ~ 6800 4600
Connection ~ 6800 4000
Connection ~ 7200 5800
Connection ~ 7200 4000
Connection ~ 10500 4700
Connection ~ 10500 4100
Connection ~ 10900 4100
$Comp
L Capacitor C36_2
U 1 1 682F9901
P 6800 6100
F 0 "C36_2" V 6800 6200 60  0000 L BNN
F 4 "1uF" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    6800 6100
	0    1    1    0
$EndComp
$Comp
L Inductor_Iron L9_2
U 1 1 682F9900
P 9300 5900
F 0 "L9_2" H 9090 6060 60  0000 L BNN
F 4 "100nH" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    9300 5900
	1    0    0    -1
$EndComp
$Comp
L Inductor_Iron L5_2
U 1 1 682F98FF
P 5700 5800
F 0 "L5_2" H 5490 5960 60  0000 L BNN
F 4 "100nH" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    5700 5800
	1    0    0    -1
$EndComp
$Comp
L CMP-0008017-2 C38_2
U 1 1 682F98FE
P 7200 6100
F 0 "C38_2" V 7290 6190 60  0000 L BNN
F 4 "10uF" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    7200 6100
	0    1    1    0
$EndComp
$Comp
L Capacitor C33_2
U 1 1 682F98FD
P 10500 4400
F 0 "C33_2" V 10590 4490 60  0000 L BNN
F 4 "1uF" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    10500 4400
	0    1    1    0
$EndComp
$Comp
L CMP-0008017-2 C34_2
U 1 1 682F98FC
P 10900 4400
F 0 "C34_2" V 10990 4490 60  0000 L BNN
F 4 "10uF" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    10900 4400
	0    1    1    0
$EndComp
$Comp
L Capacitor C19_2
U 1 1 682F98FB
P 7200 4400
F 0 "C19_2" V 7210 4310 60  0000 R TNN
F 4 "10uF" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    7200 4400
	0    -1   -1   0
$EndComp
$Comp
L Capacitor C91_2
U 1 1 682F98FA
P 6800 4300
F 0 "C91_2" V 6800 4400 60  0000 L BNN
F 4 "1uF" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    6800 4300
	0    1    1    0
$EndComp
$Comp
L CMP-0025884-3 R137_2
U 1 1 682F98F9
P 6500 7700
F 0 "R137_2" H 6390 7730 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    6500 7700
	1    0    0    -1
$EndComp
$Comp
L Inductor_Iron L7_2
U 1 1 682F98F8
P 5700 4000
F 0 "L7_2" H 5490 4160 60  0000 L BNN
F 4 "100nH" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    5700 4000
	1    0    0    -1
$EndComp
$Comp
L Inductor_Iron L8_2
U 1 1 682F98F7
P 9300 4100
F 0 "L8_2" H 9090 4260 60  0000 L BNN
F 4 "100nH" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    9300 4100
	1    0    0    -1
$EndComp
$EndSCHEMATC