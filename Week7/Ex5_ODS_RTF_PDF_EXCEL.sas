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
