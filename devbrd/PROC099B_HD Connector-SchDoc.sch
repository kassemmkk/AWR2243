EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr B 17000 11000
encoding utf-8
Sheet 1 1
Title "PROC099B_HD Connector-SchDoc"
Date "22 05 2025"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 15300 10600 0    60   ~ 0
10
Text Notes 15550 10600 0    60   ~ 0
16
Text Notes 13610 10500 0    60   ~ 0
HD Connector
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
Text Notes 6000 600 0    168   ~ 12
HD CONNECTOR FOR LVDS/CSI AND JTAG
$Comp
L power:+5V_IN #PWR?682F9939
U 1 1 682F9939
P 6600 3400
F 0 "5V_IN_11" H 6600 3400 20  0000 C CNN
F 1 "5V_IN" H 6600 3330 30  0000 C CNN
F 2 "" H 6600 3400 70  0000 C CNN
F 3 "" H 6600 3400 70  0000 C CNN
	1    6600 3400
	1    0    0    -1  
$EndComp
Text GLabel 1700 4500 2 60 BiDi ~
PGOOD
Text GLabel 1700 4200 2 60 BiDi ~
MOSI1
Text GLabel 1700 3900 2 60 BiDi ~
SPICLK1
Text GLabel 1700 3600 2 60 BiDi ~
CS1
Text GLabel 1700 3300 2 60 BiDi ~
AR_TDI
Text GLabel 9200 2800 2 60 BiDi ~
AR_TDO_SOP0
Text GLabel 9200 3100 2 60 BiDi ~
AR_TCK
Text GLabel 9200 3400 2 60 BiDi ~
AR_TMS
Text GLabel 9200 3700 2 60 BiDi ~
AR_HOSTINTR1
Text GLabel 9200 4000 2 60 BiDi ~
MISO1
Text GLabel 9200 4600 2 60 BiDi ~
AR_SYNC_IN
Text GLabel 9200 4300 2 60 BiDi ~
AR_NERR_OUT
Text GLabel 9200 5100 2 60 BiDi ~
AR_LVDSCSI_FRCLK_P
Text GLabel 9200 5200 2 60 BiDi ~
AR_LVDSCSI_FRCLK_N
Text GLabel 9200 6000 2 60 BiDi ~
AR_LVDSCSI_CLK_P
Text GLabel 9200 6100 2 60 BiDi ~
AR_LVDSCSI_CLK_N
Text GLabel 9200 6300 2 60 BiDi ~
AR_LVDSCSI1_P
Text GLabel 9200 6400 2 60 BiDi ~
AR_LVDSCSI1_N
Text GLabel 9200 6600 2 60 BiDi ~
AR_LVDSCSI0_P
Text GLabel 9200 6700 2 60 BiDi ~
AR_LVDSCSI0_N
$Comp
L power:GND #PWR?682F9938
U 1 1 682F9938
P 6300 7900
F 0 "GND_136" H 6300 8040 20  0000 C CNN
F 1 "GND" H 6300 8010 30  0000 C CNN
F 2 "" H 6300 7900 70  0000 C CNN
F 3 "" H 6300 7900 70  0000 C CNN
	1    6300 7900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?682F9937
U 1 1 682F9937
P 4200 7500
F 0 "GND_137" H 4200 7640 20  0000 C CNN
F 1 "GND" H 4200 7610 30  0000 C CNN
F 2 "" H 4200 7500 70  0000 C CNN
F 3 "" H 4200 7500 70  0000 C CNN
	1    4200 7500
	1    0    0    -1  
$EndComp
Text GLabel 1900 6400 2 60 BiDi ~
AR_SDA
Text GLabel 1900 6500 2 60 BiDi ~
AR_SCL
Text GLabel 1700 6600 2 60 BiDi ~
AR_RS232RX
Text GLabel 1700 6700 2 60 BiDi ~
AR_RS232TX
Text GLabel 1700 6800 2 60 BiDi ~
AR_NRST_MCU
Text GLabel 14800 5200 2 60 BiDi ~
XDSET_TCK
Text GLabel 14800 5600 2 60 BiDi ~
XDSET_TDI
Text GLabel 14800 6000 2 60 BiDi ~
XDSET_TMS
Text GLabel 14800 6400 2 60 BiDi ~
XDSET_TDO
Text GLabel 11500 5200 2 60 BiDi ~
AR_TCK
Text GLabel 11500 5600 2 60 BiDi ~
AR_TDI
Text GLabel 11500 6000 2 60 BiDi ~
AR_TMS
Text GLabel 11400 6400 2 60 BiDi ~
AR_TDO_SOP0
Text GLabel 12200 2900 2 60 BiDi ~
AR_OSC_CLKOUT
$Comp
L power:GND #PWR?682F9936
U 1 1 682F9936
P 15100 3400
F 0 "GND_138" H 15100 3540 20  0000 C CNN
F 1 "GND" H 15100 3510 30  0000 C CNN
F 2 "" H 15100 3400 70  0000 C CNN
F 3 "" H 15100 3400 70  0000 C CNN
	1    15100 3400
	1    0    0    -1  
$EndComp
Text Label 8310 4000 0 70 ~
0
Text Label 2720 3610 0 70 ~
0
Text Label 2700 6800 0 70 ~
0
Text Label 2720 6510 0 70 ~
0
Text Label 2720 6410 0 70 ~
0
Text Label 2720 4510 0 70 ~
0
Text Label 2720 4210 0 70 ~
0
Text Label 2720 3310 0 70 ~
0
Text Label 13420 5610 0 70 ~
0
Text Label 8320 6710 0 70 ~
0
Text Label 8320 6610 0 70 ~
0
Text Label 8320 6410 0 70 ~
0
Text Label 8320 6310 0 70 ~
0
Text Label 8320 6110 0 70 ~
0
Text Label 8320 6010 0 70 ~
0
Text Label 8320 5110 0 70 ~
0
Text Label 8320 5210 0 70 ~
0
Text Label 8320 4610 0 70 ~
0
Text Label 8320 4310 0 70 ~
0
Text Label 8320 3710 0 70 ~
0
Text Label 8320 3410 0 70 ~
0
Text Label 8320 3110 0 70 ~
0
Text Label 8320 2810 0 70 ~
0
Text Label 13420 6010 0 70 ~
0
Text Label 13420 5210 0 70 ~
0
Text Label 13420 6410 0 70 ~
0
Text Label 2720 3910 0 70 ~
0
Text Label 13620 2910 0 70 ~
0
Text Label 2700 6700 0 70 ~
0
Text Label 2700 6600 0 70 ~
0
Text Label 6200 3800 0 70 ~
0
Wire Wire Line
	4800 3900 5100 3900
Wire Wire Line
	6600 3600 6500 3600
Wire Wire Line
	6600 3400 6600 3600
Wire Wire Line
	6300 5000 5900 5000
Wire Wire Line
	6300 5300 5900 5300
Wire Wire Line
	6300 5600 5900 5600
Wire Wire Line
	6300 5900 5900 5900
Wire Wire Line
	6300 6200 5900 6200
Wire Wire Line
	6300 6500 5900 6500
Wire Wire Line
	6300 6800 5900 6800
Wire Wire Line
	5100 4500 3100 4500
Wire Wire Line
	2500 4500 2700 4500
Wire Wire Line
	2500 4200 2700 4200
Wire Wire Line
	2500 3900 2700 3900
Wire Wire Line
	2500 3600 2700 3600
Wire Wire Line
	2500 3300 2700 3300
Wire Wire Line
	5900 5100 8300 5100
Wire Wire Line
	8300 5200 5900 5200
Wire Wire Line
	8300 4600 5900 4600
Wire Wire Line
	9200 2800 8800 2800
Wire Wire Line
	9200 3100 8800 3100
Wire Wire Line
	9200 4600 8700 4600
Wire Wire Line
	9200 5100 8700 5100
Wire Wire Line
	9200 5200 8700 5200
Wire Wire Line
	9200 6000 8800 6000
Wire Wire Line
	9200 6100 8800 6100
Wire Wire Line
	9200 6300 8800 6300
Wire Wire Line
	9200 6400 8800 6400
Wire Wire Line
	9200 6600 8800 6600
Wire Wire Line
	9200 6700 8800 6700
Wire Wire Line
	4200 7300 5100 7300
Wire Wire Line
	4200 7200 5100 7200
Wire Wire Line
	4200 7100 5100 7100
Wire Wire Line
	3100 6400 5100 6400
Wire Wire Line
	3100 6500 5100 6500
Wire Wire Line
	5100 6600 3100 6600
Wire Wire Line
	3100 6700 5100 6700
Wire Wire Line
	5100 6800 3100 6800
Wire Wire Line
	2500 6400 2700 6400
Wire Wire Line
	2500 6500 2700 6500
Wire Wire Line
	2500 6600 2700 6600
Wire Wire Line
	2500 6700 2700 6700
Wire Wire Line
	2500 6800 2700 6800
Wire Wire Line
	12200 5200 13400 5200
Wire Wire Line
	12200 5600 13400 5600
Wire Wire Line
	12200 6000 13400 6000
Wire Wire Line
	13400 6400 12200 6400
Wire Wire Line
	14800 5200 13800 5200
Wire Wire Line
	14800 5600 13800 5600
Wire Wire Line
	14800 6000 13800 6000
Wire Wire Line
	14800 6400 13800 6400
Wire Wire Line
	13200 2900 13600 2900
Wire Wire Line
	14700 2900 14000 2900
Wire Wire Line
	15000 3300 15000 3200
Wire Wire Line
	15100 3300 15000 3300
Wire Wire Line
	15100 3200 15100 3300
Wire Wire Line
	15100 3400 15100 3300
Wire Wire Line
	4200 7000 5100 7000
Wire Wire Line
	4200 7100 4200 7000
Wire Wire Line
	4200 7200 4200 7100
Wire Wire Line
	4200 7300 4200 7200
Wire Wire Line
	4200 7500 4200 7300
Wire Wire Line
	4800 4000 5100 4000
Wire Wire Line
	4800 3900 4800 4000
Wire Wire Line
	4800 3400 4800 3900
Wire Wire Line
	6000 3400 4800 3400
Wire Wire Line
	6000 3600 6000 3400
Wire Wire Line
	6000 3900 6000 3600
Wire Wire Line
	5900 3900 6000 3900
Wire Wire Line
	6300 4700 5900 4700
Wire Wire Line
	6300 5000 6300 4700
Wire Wire Line
	6300 5300 6300 5000
Wire Wire Line
	6300 5600 6300 5300
Wire Wire Line
	6300 5900 6300 5600
Wire Wire Line
	6300 6200 6300 5900
Wire Wire Line
	6300 6500 6300 6200
Wire Wire Line
	6300 6800 6300 6500
Wire Wire Line
	6300 7900 6300 6800
Wire Wire Line
	6000 3600 6100 3600
Text Label 8320 4810 0 70 ~
0
Text Label 8320 4910 0 70 ~
0
Wire Wire Line
	5900 4800 8300 4800
Wire Wire Line
	8300 4900 5900 4900
Wire Wire Line
	9200 4800 8700 4800
Wire Wire Line
	9200 4900 8700 4900
Text Label 8320 5410 0 70 ~
0
Text Label 8320 5510 0 70 ~
0
Text Label 8320 5710 0 70 ~
0
Text Label 8320 5810 0 70 ~
0
Wire Wire Line
	8700 6700 8800 6700
Wire Wire Line
	8700 6600 8800 6600
Wire Wire Line
	8700 6400 8800 6400
Wire Wire Line
	8700 6300 8800 6300
Wire Wire Line
	8700 6100 8800 6100
Wire Wire Line
	8700 6000 8800 6000
Wire Wire Line
	8300 5400 5900 5400
Wire Wire Line
	5900 5500 8300 5500
Wire Wire Line
	8300 5700 5900 5700
Wire Wire Line
	5900 5800 8300 5800
Wire Wire Line
	9200 5400 8700 5400
Wire Wire Line
	9200 5500 8700 5500
Wire Wire Line
	9200 5700 8700 5700
Wire Wire Line
	9200 5800 8700 5800
Text GLabel 9200 4800 2 60 BiDi ~
AR_LVDS_VALID_P
Text GLabel 9200 4900 2 60 BiDi ~
AR_LVDS_VALID_N
Text GLabel 9200 5400 2 60 BiDi ~
AR_LVDSCSI3_P
Text GLabel 9200 5500 2 60 BiDi ~
AR_LVDSCSI3_N
Text GLabel 9200 5700 2 60 BiDi ~
AR_LVDSCSI2_P
Text GLabel 9200 5800 2 60 BiDi ~
AR_LVDSCSI2_N
Wire Wire Line
	8300 6000 5900 6000
Wire Wire Line
	5900 6100 8300 6100
Wire Wire Line
	8300 6300 5900 6300
Wire Wire Line
	5900 6400 8300 6400
Wire Wire Line
	8300 6600 5900 6600
Wire Wire Line
	5900 6700 8300 6700
Text Label 4300 6300 1 70 ~
Net Class
Text Label 7900 2800 1 70 ~
Net Class
Text Label 6900 6800 3 70 ~
Net Class
Text Label 14500 2900 1 70 ~
Net Class
Text Label 14500 5000 1 70 ~
Net Class
Text Label 7900 3100 1 70 ~
Net Class
Text Label 7900 3400 1 70 ~
Net Class
Text Label 3500 3300 1 70 ~
Net Class
Text Label 3500 3600 1 70 ~
Net Class
Text Label 3500 3900 1 70 ~
Net Class
Text Label 3500 4200 1 70 ~
Net Class
Text Label 3500 4500 1 70 ~
Net Class
Text Label 7900 3700 1 70 ~
Net Class
Text Label 7900 4000 1 70 ~
Net Class
Text Label 7900 4300 1 70 ~
Net Class
Text Label 7900 4600 1 70 ~
Net Class
Text Label 6000 4800 0 70 ~
DIFFPAIR
Text Label 6000 4900 0 70 ~
DIFFPAIR
Text Label 6000 5100 0 70 ~
DIFFPAIR
Text Label 6000 5200 0 70 ~
DIFFPAIR
Text Label 6000 5400 0 70 ~
DIFFPAIR
Text Label 6000 5500 0 70 ~
DIFFPAIR
Text Label 6000 5700 0 70 ~
DIFFPAIR
Text Label 6000 5800 0 70 ~
DIFFPAIR
Text Label 6000 6000 0 70 ~
DIFFPAIR
Text Label 6000 6100 0 70 ~
DIFFPAIR
Text Label 6000 6300 0 70 ~
DIFFPAIR
Text Label 6000 6400 0 70 ~
DIFFPAIR
Text Label 8900 6300 0 70 ~
DIFFPAIR
Text Label 8900 6400 0 70 ~
DIFFPAIR
Text Label 8900 6100 0 70 ~
DIFFPAIR
Text Label 8900 6000 0 70 ~
DIFFPAIR
Text Label 8900 5800 0 70 ~
DIFFPAIR
Text Label 8900 5700 0 70 ~
DIFFPAIR
Text Label 8900 5500 0 70 ~
DIFFPAIR
Text Label 8900 5400 0 70 ~
DIFFPAIR
Text Label 8900 5200 0 70 ~
DIFFPAIR
Text Label 8900 5100 0 70 ~
DIFFPAIR
Text Label 8900 4900 0 70 ~
DIFFPAIR
Text Label 8900 4800 0 70 ~
DIFFPAIR
Text Label 8900 6600 0 70 ~
DIFFPAIR
Text Label 8900 6700 0 70 ~
DIFFPAIR
Text Label 6000 6600 0 70 ~
DIFFPAIR
Text Label 6000 6700 0 70 ~
DIFFPAIR
Text Label 6800 4800 0 60 ~
HD_LVDS_VALID_P
Text Label 6800 4900 0 60 ~
HD_LVDS_VALID_N
Text Label 6800 5100 0 60 ~
HD_LVDSCSI_FRCLK_P
Text Label 6800 5200 0 60 ~
HD_LVDSCSI_FRCLK_N
Text Label 6800 5400 0 60 ~
HD_LVDSCSI3_P
Text Label 6800 5500 0 60 ~
HD_LVDSCSI3_N
Text Label 6800 5700 0 60 ~
HD_LVDSCSI2_P
Text Label 6800 5800 0 60 ~
HD_LVDSCSI2_N
Text Label 6800 6000 0 60 ~
HD_LVDSCSI_CLK_P
Text Label 6800 6100 0 60 ~
HD_LVDSCSI_CLK_N
Text Label 6800 6300 0 60 ~
HD_LVDSCSI1_P
Text Label 6800 6400 0 60 ~
HD_LVDSCSI1_N
Text Label 6800 6600 0 60 ~
HD_LVDSCSI0_P
Text Label 6800 6700 0 60 ~
HD_LVDSCSI0_N
NoConn ~ 5100 4600
NoConn ~ 5100 4700
NoConn ~ 5100 4800
NoConn ~ 5100 4900
NoConn ~ 5100 5000
NoConn ~ 5100 5100
NoConn ~ 5100 5200
NoConn ~ 5100 5300
NoConn ~ 5100 5400
NoConn ~ 5100 5500
NoConn ~ 5100 5600
NoConn ~ 5100 5700
NoConn ~ 5100 5800
NoConn ~ 5100 5900
NoConn ~ 5100 6000
NoConn ~ 5100 6100
NoConn ~ 5100 6200
NoConn ~ 5100 6300
Text Notes 13500 4600 0    108   ~ 0
JTAG
Wire Wire Line
	8700 3100 8800 3100
Wire Wire Line
	8700 2800 8800 2800
Wire Wire Line
	6800 2800 8300 2800
Wire Wire Line
	6800 4000 6800 2800
Wire Wire Line
	5900 4000 6800 4000
Wire Wire Line
	6900 3100 8300 3100
Wire Wire Line
	6900 4100 6900 3100
Wire Wire Line
	5900 4100 6900 4100
Wire Wire Line
	7000 3400 8300 3400
Wire Wire Line
	7000 4200 7000 3400
Wire Wire Line
	5900 4200 7000 4200
Wire Wire Line
	7100 3700 8300 3700
Wire Wire Line
	7100 4300 7100 3700
Wire Wire Line
	5900 4300 7100 4300
Wire Wire Line
	7200 4000 8300 4000
Wire Wire Line
	7200 4400 7200 4000
Wire Wire Line
	5900 4400 7200 4400
Wire Wire Line
	7300 4300 8300 4300
Wire Wire Line
	7300 4500 7300 4300
Wire Wire Line
	5900 4500 7300 4500
Wire Wire Line
	9200 3400 8700 3400
Wire Wire Line
	8700 3700 9200 3700
Wire Wire Line
	9200 4000 8700 4000
Wire Wire Line
	8700 4300 9200 4300
Wire Wire Line
	4700 3300 3100 3300
Wire Wire Line
	4700 4100 4700 3300
Wire Wire Line
	5100 4100 4700 4100
Wire Wire Line
	4600 3600 3100 3600
Wire Wire Line
	4600 4200 4600 3600
Wire Wire Line
	5100 4200 4600 4200
Wire Wire Line
	4500 3900 3100 3900
Wire Wire Line
	4500 4300 4500 3900
Wire Wire Line
	5100 4300 4500 4300
Wire Wire Line
	4400 4200 3100 4200
Wire Wire Line
	4400 4400 4400 4200
Wire Wire Line
	5100 4400 4400 4400
Connection ~ 4200 7300
Connection ~ 4200 7200
Connection ~ 4200 7100
Connection ~ 4800 3900
Connection ~ 6000 3600
Connection ~ 6300 6800
Connection ~ 6300 6500
Connection ~ 6300 6200
Connection ~ 6300 5900
Connection ~ 6300 5600
Connection ~ 6300 5300
Connection ~ 6300 5000
Connection ~ 15100 3300
$Comp
L Receptacle_30x2_4MP_LeftRight J1_2
U 1 1 682F9935
P 5500 5600
F 0 "J1_2" H 5290 7400 60  0000 L BNN
	1    5500 5600
	1    0    0    -1
$EndComp
$Comp
L Resistor R29_2
U 1 1 682F9934
P 2900 3300
F 0 "R29_2" H 3000 3300 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    2900 3300
	1    0    0    -1
$EndComp
$Comp
L Resistor R30_2
U 1 1 682F9933
P 13600 5600
F 0 "R30_2" H 13700 5600 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    13600 5600
	1    0    0    -1
$EndComp
$Comp
L Resistor R48_2
U 1 1 682F9932
P 8500 6700
F 0 "R48_2" H 8600 6700 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    8500 6700
	1    0    0    -1
$EndComp
$Comp
L Resistor R49_2
U 1 1 682F9931
P 8500 6600
F 0 "R49_2" H 8600 6600 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    8500 6600
	1    0    0    -1
$EndComp
$Comp
L Resistor R50_2
U 1 1 682F9930
P 8500 6400
F 0 "R50_2" H 8600 6400 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    8500 6400
	1    0    0    -1
$EndComp
$Comp
L Resistor R51_2
U 1 1 682F992F
P 8500 6300
F 0 "R51_2" H 8600 6300 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    8500 6300
	1    0    0    -1
$EndComp
$Comp
L Resistor R52_2
U 1 1 682F992E
P 8500 6100
F 0 "R52_2" H 8600 6100 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    8500 6100
	1    0    0    -1
$EndComp
$Comp
L Resistor R53_2
U 1 1 682F992D
P 8500 6000
F 0 "R53_2" H 8600 6000 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    8500 6000
	1    0    0    -1
$EndComp
$Comp
L Resistor R59_2
U 1 1 682F992C
P 8500 5100
F 0 "R59_2" H 8600 5100 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    8500 5100
	1    0    0    -1
$EndComp
$Comp
L Resistor R58_2
U 1 1 682F992B
P 8500 5200
F 0 "R58_2" H 8600 5200 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    8500 5200
	1    0    0    -1
$EndComp
$Comp
L CMP-0055788-1 J2_2
U 1 1 682F992A
P 14900 3000
F 0 "J2_2" H 14900 3200 60  0000 R BNN
	1    14900 3000
	-1    0    0    -1
$EndComp
$Comp
L Resistor R62_2
U 1 1 682F9929
P 8500 4600
F 0 "R62_2" H 8600 4600 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    8500 4600
	1    0    0    -1
$EndComp
$Comp
L Resistor R7_2
U 1 1 682F9928
P 8500 4300
F 0 "R7_2" H 8600 4300 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    8500 4300
	1    0    0    -1
$EndComp
$Comp
L Resistor R64_2
U 1 1 682F9927
P 8500 3700
F 0 "R64_2" H 8600 3700 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    8500 3700
	1    0    0    -1
$EndComp
$Comp
L Resistor R65_2
U 1 1 682F9926
P 8500 3400
F 0 "R65_2" H 8600 3400 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    8500 3400
	1    0    0    -1
$EndComp
$Comp
L Resistor R66_2
U 1 1 682F9925
P 8500 3100
F 0 "R66_2" H 8600 3100 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    8500 3100
	1    0    0    -1
$EndComp
$Comp
L Resistor R67_2
U 1 1 682F9924
P 8500 2800
F 0 "R67_2" H 8600 2800 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    8500 2800
	1    0    0    -1
$EndComp
$Comp
L Resistor R69_2
U 1 1 682F9923
P 13600 6000
F 0 "R69_2" H 13700 6000 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    13600 6000
	1    0    0    -1
$EndComp
$Comp
L Resistor R70_2
U 1 1 682F9922
P 13600 5200
F 0 "R70_2" H 13700 5200 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    13600 5200
	1    0    0    -1
$EndComp
$Comp
L Resistor R71_2
U 1 1 682F9921
P 13600 6400
F 0 "R71_2" H 13700 6400 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    13600 6400
	1    0    0    -1
$EndComp
$Comp
L Resistor R75_2
U 1 1 682F9920
P 2900 3900
F 0 "R75_2" H 3000 3900 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    2900 3900
	1    0    0    -1
$EndComp
$Comp
L Resistor R63_2
U 1 1 682F991F
P 8500 4000
F 0 "R63_2" H 8600 4000 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    8500 4000
	1    0    0    -1
$EndComp
$Comp
L Resistor R111_2
U 1 1 682F991E
P 13800 2900
F 0 "R111_2" H 13900 2900 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    13800 2900
	1    0    0    -1
$EndComp
$Comp
L Resistor R21_2
U 1 1 682F991D
P 2900 6700
F 0 "R21_2" H 3000 6700 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    2900 6700
	1    0    0    -1
$EndComp
$Comp
L Resistor R33_2
U 1 1 682F991C
P 2900 6600
F 0 "R33_2" H 3000 6600 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    2900 6600
	1    0    0    -1
$EndComp
$Comp
L CMP-0016044-3 R34_2
U 1 1 682F991B
P 6300 3600
F 0 "R34_2" H 6200 3700 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    6300 3600
	1    0    0    -1
$EndComp
$Comp
L Resistor R61_2
U 1 1 682F991A
P 8500 4800
F 0 "R61_2" H 8600 4800 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    8500 4800
	1    0    0    -1
$EndComp
$Comp
L Resistor R60_2
U 1 1 682F9919
P 8500 4900
F 0 "R60_2" H 8600 4900 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    8500 4900
	1    0    0    -1
$EndComp
$Comp
L Resistor R57_2
U 1 1 682F9918
P 8500 5400
F 0 "R57_2" H 8600 5400 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    8500 5400
	1    0    0    -1
$EndComp
$Comp
L Resistor R56_2
U 1 1 682F9917
P 8500 5500
F 0 "R56_2" H 8600 5500 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    8500 5500
	1    0    0    -1
$EndComp
$Comp
L Resistor R55_2
U 1 1 682F9916
P 8500 5700
F 0 "R55_2" H 8600 5700 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    8500 5700
	1    0    0    -1
$EndComp
$Comp
L Resistor R54_2
U 1 1 682F9915
P 8500 5800
F 0 "R54_2" H 8600 5800 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    8500 5800
	1    0    0    -1
$EndComp
$Comp
L Resistor R17_2
U 1 1 682F9914
P 2900 3600
F 0 "R17_2" H 3000 3600 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    2900 3600
	1    0    0    -1
$EndComp
$Comp
L Resistor R20_2
U 1 1 682F9913
P 2900 6800
F 0 "R20_2" H 3000 6800 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    2900 6800
	1    0    0    -1
$EndComp
$Comp
L Resistor R22_2
U 1 1 682F9912
P 2900 6500
F 0 "R22_2" H 3000 6500 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    2900 6500
	1    0    0    -1
$EndComp
$Comp
L Resistor R23_2
U 1 1 682F9911
P 2900 6400
F 0 "R23_2" H 3000 6400 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    2900 6400
	1    0    0    -1
$EndComp
$Comp
L Resistor R27_2
U 1 1 682F9910
P 2900 4500
F 0 "R27_2" H 3000 4500 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    2900 4500
	1    0    0    -1
$EndComp
$Comp
L Resistor R28_2
U 1 1 682F990F
P 2900 4200
F 0 "R28_2" H 3000 4200 60  0000 L BNN
F 4 "" V 1400 2000 60  0001 C CNN "ValueDisplayed"
	1    2900 4200
	1    0    0    -1
$EndComp
$EndSCHEMATC