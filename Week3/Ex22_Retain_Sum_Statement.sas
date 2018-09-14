*Ex22_Retain_Sum_Statement.sas;
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



