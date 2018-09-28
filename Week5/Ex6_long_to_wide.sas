*Ex6_long_to_wide.sas;
options nocenter nodate;
data long;
length year_lab $4;
 infile datalines missover;
 input year gdp cpi ;
 year_lab=put(year, 4.);
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
id year_lab;
idlabel year_lab;
var GDP CPI ; run;
proc print data=WIDE6 noobs label; 
label _NAME_=indicator;
run;

