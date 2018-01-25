Appending workbook2 sheet1 to worlbook1 sheet1

original topic
  Can anyone please help how do I append two excel files ?

see for detail
https://communities.sas.com/t5/SAS-Procedures/append-two-excel-files/m-p/430706

INPUT

    Algorithm
         Append Apple sheet in workbook 2 Apple sheet in workbook 1
         Append Orange sheet in workbook 2 Orange sheet in workbook 1

    d:/xls/utl_appending_workbook2_sheet1_to_worlbook1_sheet1_1.xlsx
        Tabs
          Apple
          Orange
          Grap

    d:/xls/utl_appending_workbook2_sheet1_to_worlbook1_sheet1_2.xlsx
         Tabs
           Apple
           Orange

   Example

    WORKBOOK1 Apple Sheet

       A     B      C

     123    4.0    5.0
       2    2.3    4.5

    WORKBOOK2 Aplle Sheet

       A       B      C

     55.0    55.0    66
      2.0     2.3     .
      4.5      .      .

    WANT
    WORKBOOK1 Apple Sheet

       A        B       C

     123.0     4.0     5.0
       2.0     2.3     4.5
      55.0    55.0    66.0  * apended from workbook2 apple sheet
       2.0     2.3      .
       4.5      .       .

PROCESS (all the code)

    libname xla "d:/xls/utl_appending_workbook2_sheet1_to_worlbook1_sheet1_1.xlsx" scan_text=no;
    libname xlb "d:/xls/utl_appending_workbook2_sheet1_to_worlbook1_sheet1_2.xlsx" scan_text=no;

    proc append base=xla.apple data=xlb.apple;
    run;quit;
    proc append base=xla.orange data=xlb.orange;
    run;quit;

    libname xlb clear;
libname xla clear;

OUTPUT
======

   d:/xls/utl_appending_workbook2_sheet1_to_worlbook1_sheet1_1.xlsx
     Tab Apple
          A        B       C

        123.0     4.0     5.0
          2.0     2.3     4.5
         55.0    55.0    66.0
          2.0     2.3      .
          4.5      .       .
     Tab Orange
          A      B       C     D

        123     4.0     5.0    6
          2     2.3     4.5    7
         46    36.0    59.0    6  *
          2     2.3     4.5    7

     Tab Grape is unchanged

*                _              _       _
 _ __ ___   __ _| | _____    __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \  / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/ | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|  \__,_|\__,_|\__\__,_|
                    _    _                 _    _
__      _____  _ __| | _| |__   ___   ___ | | _/ |
\ \ /\ / / _ \| '__| |/ / '_ \ / _ \ / _ \| |/ / |
 \ V  V / (_) | |  |   <| |_) | (_) | (_) |   <| |
  \_/\_/ \___/|_|  |_|\_\_.__/ \___/ \___/|_|\_\_|

;

%utlfkil(d:/xls/utl_appending_workbook2_sheet1_to_worlbook1_sheet1_1.xlsx);  * delete;

libname xla "d:/xls/utl_appending_workbook2_sheet1_to_worlbook1_sheet1_1.xlsx";
data xla.apple;
input A B C ;
cards4;
123 4 5
2 2.3 4.5
;;;;
run;quit;

data xla.orange;
input A B C D;
cards4;
123 4 5 6
2 2.3 4.5 7
;;;;
run;quit;

data xla.grape;
input A B C ;
cards4;
123 4 5
2 2.3 4.5
;;;;
run;quit;

libname xla clear;

*                   _    _                 _    ____
__      _____  _ __| | _| |__   ___   ___ | | _|___ \
\ \ /\ / / _ \| '__| |/ / '_ \ / _ \ / _ \| |/ / __) |
 \ V  V / (_) | |  |   <| |_) | (_) | (_) |   < / __/
  \_/\_/ \___/|_|  |_|\_\_.__/ \___/ \___/|_|\_\_____|

;

%utlfkil(d:/xls/utl_appending_workbook2_sheet1_to_worlbook1_sheet1_2.xlsx);

libname xlb "d:/xls/utl_appending_workbook2_sheet1_to_worlbook1_sheet1_2.xlsx";
data xlb.apple;
input A B C ;
cards4;
55 55 66
2 2.3 .
4.5 . .
;;;;
run;quit;

data xlb.orange;
input A B C D;
cards4;
46 36 59 6
2 2.3 4.5 7
;;;;
run;quit;

libname xlb clear;

*          _       _   _
 ___  ___ | |_   _| |_(_) ___  _ __
/ __|/ _ \| | | | | __| |/ _ \| '_ \
\__ \ (_) | | |_| | |_| | (_) | | | |
|___/\___/|_|\__,_|\__|_|\___/|_| |_|

;


libname xla "d:/xls/utl_appending_workbook2_sheet1_to_worlbook1_sheet1_1.xlsx" scan_text=no;
libname xlb "d:/xls/utl_appending_workbook2_sheet1_to_worlbook1_sheet1_2.xlsx" scan_text=no;

proc append base=xla.apple data=xlb.apple;
run;quit;

proc append base=xla.orange data=xlb.orange;
run;quit;

libname xlb clear;
libname xla clear;

