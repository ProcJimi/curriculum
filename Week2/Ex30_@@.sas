*Ex30_@@.sas;
data work.HAVE;
 input date: Anydtdte. name $ study_hours @@;
datalines;
27Aug2018 Doris 5.5 28Aug2018 Alice 4.0 
29Aug2018 Mike 2.0 29Aug2018 James 1.0 
30Jun2018 Doris 3.0 31Aug2018 Alice 3.0 
01Sep2018 Mike 3.0 
02Sep2018 James 1.0
;
proc print data=work.HAVE;
Format date mmddyy10.;
run;

