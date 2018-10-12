*Ex7_ODS_Files.sas;

ods trace on;
  proc univariate data=SASHELP.CLASS;    
  var weight;   
  qqplot weight / normal(mu=est sigma=est); 
run; ods 
trace off; 

ods trace on/listing;
  proc univariate data=SASHELP.CLASS;    
  var weight;   
  qqplot weight / normal(mu=est sigma=est); 
run; 
ods trace off; 

ods listing;
ods output basicmeasures=measures;
ods select basicmeasures;
proc univariate data=sashelp.class noprint;
var weight;
run;
proc print data=measures; run;


ODS html;
ODS OUTPUT ExtremeObs = Extreme_Obs_x;
ODS SELECT ExtremeObs;
proc univariate data=sashelp.class;
var weight;
run;
ODS html CLOSE;

proc univariate data=sashelp.class noprint;
  var weight;
  output out=stats mean=mean_weight
                   median=median_weight;
run;
proc print data=stats; run;


ods trace on / listing;
proc contents data=sashelp.class; 
run; 
ods trace off;

ods trace on / listing;
proc freq data=sashelp.heart; 
 tables weight_status*bp_status ;
 WHERE sex='Male';
run;
ods trace off;

ods pdf;
ods pdf file = 'C:\SASCourse\Week7\FromProcFreq.pdf';
ods output CrossTabFreqs=CrossTab_Freqs;
proc freq data=sashelp.heart ; 
 tables weight_status*bp_status ;
 WHERE sex='Male';
run;
ods pdf close;











