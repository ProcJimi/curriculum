*Ex1_Numeric_Character_Formats.sas'

* Single value on the left side of the = sign 
  in PROC FORMAT VALUE statement;

options nocenter nodate ps=58 ls=78;
proc format;
value $regionfmt
    'AFR' = 'Africa'
	'AMR' = 'Americas'
	'EUR' = 'Europe'
	'EMR'  ='Eastern Mediterranean'
	'SEAR' = 'South-East Asia'
	'WPR' = 'Western Pacific';
	run;
proc freq data=sashelp.demographics; 
  tables region; 
  format region $regionfmt.;
run;
title ' ';


*Ranges on the left side of the = sign in PROC FORMAT VALUE statement;
*KeywordS: LOW, OTHER;

proc format;
  value numfmt
           Low - <0  = "Nonresponse"
		   0="Never"
           1-5 = "Within past 5 years"
           6-High = "More than 5 years ago"
		   . ="Missing" ;
   value $charfmt
           Low-<'0'  = "Nonresponse"
		   '0' = "Never"
           '1'-'5' = "Within past 5 years"
		   '6'-High = "More than 5 years ago" ; 
 run;
data work.have;
input id $ 1 Colonoscopy 3-4 c_Colonoscopy $6-7;
datalines;
A -1 -1 
B  . 
C 3   3
D -9 -9
F 3  3
G 5  5
H 6  6 
I .   
J 7  7
;
proc freq data=work.have;
tables colonoscopy c_colonoscopy /nopercent nocum missing;
Format colonoscopy numfmt. c_colonoscopy $charfmt.;
run;

options nodate nonumber;
/*
The format values are ranges; the special keyword LOW is used 
to define the lowest value.  Because it is a numeric format, 
LOW does not format missing values. Note that, for character 
formats, LOW includes missing values and blank values.
*/

*Grouping Data Values Using Formats;

proc format;
     value wtfmt   low - <100 = 'Under 100 lbs'
                 100 - high = '100+ lbs'; 
run;
Title 'User-Defined Formats Used';
proc freq data=sashelp.class;
   tables weight;
   format weight wtfmt.;
run;

