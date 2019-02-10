*Ex6_long_to_wide.sas;
options nocenter nodate;
data long;
 input year $ gdp cpi ;
 datalines;
2010	101.226	218.056	
2011	103.315	224.939	
2012	105.220	229.594	
2013	106.935	232.957	
2014	108.694	236.736	
2015	109.782	237.017	
;
title1 'Data in LONG Format';
proc print data = LONG noobs;
  var year gdp cpi;
format gdp cpi 7.2; 
run;

proc transpose data=LONG out=wide1;run;
proc print data=WIDE1 noobs; run;


proc transpose data=LONG out=wide2;
var GDP; run;
proc print data=WIDE2 noobs; run;

proc transpose data=LONG out=wide3;
id year;
var GDP; run;
proc print data=WIDE3 noobs; run;

proc transpose data=LONG out=wide4 prefix=Year;
id year;
var GDP CPI ; run;
proc print data=WIDE4 noobs; run;

proc transpose data=LONG out=wide5 prefix=Year 
                         name=Indicator;
id year;
var GDP CPI ; run;
proc print data=WIDE5 noobs; run;


proc transpose data=LONG out=wide6;
id year;
idlabel year;
var GDP CPI ; run;
proc print data=WIDE6 noobs label; 
label _NAME_=indicator;
run;




** Long to wide;
Data Have;
input (Name Test) ($) Score ;
datalines;
John Test1 75
John Test2 85
John Test3 76
John Test4 72
John Test5 78
John HW1   82
John HW2   85
John Midterm 68
John Final   75
Hena Test1 75
Hena Test2 80
;
proc sort data=Have; by Name; run;
data Have_x(drop=i Test Score);
   set Have;
   by Name;
   array TestScore (9) Test1 Test2 Test3 Test4 Test5 HW1 HW2 Midterm Final;
   if first.Name then i=1;
   TestScore(i)=score;
   if last.Name then output;
   i+1;
   retain Test1 Test2 Test3 Test4 Test5 HW1 HW2 Midterm Final;
run;
Title 'Reshaping data using a DATA step and an ARRAY statement';
proc print data=Have_x;
run;

proc transpose data=Have out=t_Have (drop=_NAME_);
   by Name;
   var score;
   id Test;
run;
Title 'Reshaping data using PROC TRANSPOSE';
proc print data=t_Have; run;
