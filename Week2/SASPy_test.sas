import saspy
import pandas
sas = saspy.SASsession() 
tv=pandas.read_csv('c:\SASCourse\Week2\TV_Data.csv')
print(tv, head(5))

proc import datafile = 'c:\SASCourse\Week2\TV_Data.csv';
out=TV dbms=csv replace;
run;
proc print data=TV; run;

* Method 1: Importing an Excel Spreadsheet into a SAS data set;
 options nodate nonumber nodate;
  PROC IMPORT DATAFILE= "C:\SASCourse\Week2\TV_Data"
     dbms=xlsx REPLACE OUT= work.TV;
     SHEET="TV_Data";
     GETNAMES=YES;
 RUN;
Title;
 proc print data=work.TV; 
ods noproctitle;

proc sort data=SASHELP.CARS out=cars;
    by descending MSRP;
run;

proc print data=cars (obs=20);
    var Make Model Type MSRP MPG_Highway EngineSize Weight Horsepower;
    title "New Automobiles for Sale in the United States in 2004";
    
run;
 run;