*Ex7_ODS_Files.sas;
ODS TRACE ON /LISTING;
proc univariate data=SASHELP.CLASS;
var weight;
RUN;
ODS TRACE OFF;

options nodate nonumber;
ods trace on / listing;
proc univariate data=sashelp.class noprint;
var weight;
run;
ods trace off;


ods trace on / listing;
proc contents data=sashelp.class; 
run; 
ods trace off;


options nodate nonumber;
ods html file ='D:\univariate_stats.html';
ods output ExtremeObs=minmax;
proc univariate data=sashelp.class noprint;
var weight;
run;
ods trace off;
proc print data=work.minmax; run;
ods html close;

ods trace on /listing;
ods pdf file = 'D:\FromProcFreq.pdf';
ods output CrossTabFreqs=CrossTab_Freqs;
proc freq data=sashelp.heart; 
 tables weight_status*bp_status ;
 WHERE sex='Male';
run;
ods pdf close;
ods pdf file ='D:\CrossTab_Freqs.pdf';
proc print data=CrossTab_Freqs; run;
ods pdf close;
ods trace off

ODS html;
ODS OUTPUT ExtremeObs = Extreme_Obs_x;
ODS SELECT ExtremeObs;
proc univariate data=sashelp.class;
var weight;
run;
ODS html CLOSE;

ODS pdf file = 'd:\Extreme_Obs.pdf';
ODS OUTPUT ExtremeObs = Extreme_Obs;
ODS SELECT ExtremeObs;
proc univariate data=sashelp.class;
var weight;
run;
ODS PDF CLOSE;


* Open several ODS destinations;
ods html file="D:\report_h.html";
ods pdf file="D:\report_p.pdf" notoc;
ods rtf file="D:\report_r.rtf" bodytitle;
ods excel file="D:\report_e.xlsx"
      options(sheet_name="Sheet1"); 
ods output variables=variables_class;
* Select only the "variables" table;
ods select variables;
* Turn off proc titles;
ods noproctitle;
* Run the Contents Procedure;
proc contents data=sashelp.class; run; 
ODS _ALL_ CLOSE;


ods rtf(1) file="D:\Complete_output.rtf" ;
ods rtf(2) file="D:\Partial_output.rtf" ;
ods rtf(2) select univariate.weight.moments;
Title "Proc Univariate for Weight";
Proc Univariate data = sashelp.class;
var weight;
run;
ods _all_ close;


*Traffic-lighting;
PROC FORMAT;
VALUE weightf
0 - < 150 = 'light green'
150 - < 170 = 'light yellow'
170 - HIGH = 'light red';
run;
ods html file= 'D:\Traffic_Lighting.html';
Proc print data = sashelp.heart (obs = 20);
var status sex height;
var weight / STYLE={BACKGROUND=weightf.};
run;
ods html close;









