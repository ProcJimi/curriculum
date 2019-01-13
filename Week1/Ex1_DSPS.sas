*Example_DSPS.sas;
DATA work.HAVE;
 INPUT Name $ quiz1 quiz2 quiz3;
   Ave_Score = ROUND(MEAN(OF quiz1-quiz3),.01);
 DATALINES;
 Amy  78 84 82 
 Neil 90 85 86 
 John 82 79 89 
 Keya 78 86 78 
 ;
PROC PRINT data=work.HAVE; 
run;
