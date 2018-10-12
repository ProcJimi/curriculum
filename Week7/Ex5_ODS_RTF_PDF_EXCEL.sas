*Ex5_ODS_RTF_PDF_EXCEL.sas;
options nodate nonumber;
%LET Path=C:\SASCourse\Week7;

ods rtf file="&Path\Heart_Tabulate.RTF"; 
PROC TABULATE data=sashelp.heart format=comma7. ;
  TITLE1 'Mean Weight by Blood Presuure Levels';
  TITLE2 'SASHELP.HEART Data Set';
  CLASS sex BP_Status;
  VAR  weight;
  KEYLABEL N='Total'  mean = 'Mean (lbs)';
  TABLE (Sex*BP_Status='Blood Pressure Category' all),
        (N weight*mean);
run;
ods rtf close;

ods pdf file="&Path\Heart_Tabulate.PDF"; 
PROC TABULATE data=sashelp.heart format=comma7. ;
  TITLE1 'Mean Weight by Blood Presuure Levels';
  TITLE2 'SASHELP.HEART Data Set';
  CLASS sex BP_Status;
  VAR  weight;
  KEYLABEL N='Total'  mean = 'Mean (lbs)';
  TABLE (Sex*BP_Status='Blood Pressure Category' all),
        (N weight*mean);
run;
ods pdf close;

ods excel file="&Path\Heart_Tabulate.xlsx" 
   options(row_heights="0,0,0,14,0,0" sheet_interval='PROC'
                  sheet_name="SASHELP_Heart" 
                  embedded_titles="yes");
PROC TABULATE data=sashelp.heart format=comma7. ;
  TITLE1 'Mean Weight by Blood Presuure Levels';
  TITLE2 'SASHELP.HEART Data Set';
  CLASS BP_Status sex;
  VAR  weight;
  KEYLABEL N='Total'  mean = 'Mean (lbs)';
  TABLE (sex*BP_Status='Blood Pressure Category' all),
        (N weight*mean);
  run;
  ods excel close;



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
run;
