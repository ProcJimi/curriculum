*Ex1_DSPS.sas (Part 1);
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


*Ex1_DSPS.sas (Part 2);
DATA work.HAVE_X;
 Name='Amy'; quiz1=78; quiz2=84; quiz3=82;
 Ave_Score = MEAN(OF quiz1-quiz3);
 output;

 Name='Neil'; quiz1=90; quiz2=85; quiz3=86;
 Ave_Score = MEAN(OF quiz1-quiz3);
 output;

 Name='John'; quiz1=82; quiz2=79; quiz3=89;
 Ave_Score = MEAN(OF quiz1-quiz3);
 output;

 Name='Keya'; quiz1=78; quiz2=86; quiz3=78;
 Ave_Score = MEAN(OF quiz1-quiz3);
 output; 
 run;
 PROC PRINT data=work.HAVE_X; run;

