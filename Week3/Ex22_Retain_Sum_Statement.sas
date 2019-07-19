*Ex22_Retain_Sum_Statement.sas;
/*
Overriding the Default Behavior of the Sum Variable
By default, the sum variable is automatically set to 0
before the first observation is read. 
To reset the sum variable to a different number, 
you need to use the RETAIN statement.  
*/

proc sort data = sashelp.cars; by make; run;
data cars;
  set sashelp.cars;
  count + 1;
  by make;
  if first.make then count = 1;
  if last.make;
run;
proc print data=cars;
var make count;
run;


DATA temp ;
  INPUT month sales @@;
      Total_sales+sales;
 FORMAT Sales Total_sales dollar8.;
  DATALINES;
    1 4000 2 5000 3 . 4 5500 5 5000 
    ;
PROC PRINT noobs; run;

*Ex22_Retain_Sum_Statement.sas;
DATA temp1 ;
   RETAIN Total_sales 0;
   FORMAT Sales Total_sales dollar8.;
   INPUT month sales @@;
    Total_sales= sum(Total_sales, sales);
   DATALINES;
   1 4000 2 5000 3 . 4 5500 5 5000 
   ;
PROC PRINT data=temp1; 
  VAR month sales Total_sales;
run;


*Ex22_Retain_Sum_Statement.sas;
DATA temp;
   RETAIN Total_sales 1000;
   INPUT month sales @@;
    Total_sales+sales;
   FORMAT Sales Total_sales dollar8.;
   DATALINES;
   1 4000 2 5000 3 . 4 5500 5 5000 
   ;
PROC PRINT noobs; 
 var month sales Total_sales;
RUN;



