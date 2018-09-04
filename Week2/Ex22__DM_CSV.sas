*Ex22_DM_CSV_report.sas;
 * create a csv file from a SAS data set using the DM DEXPORT Command;
  dm "dexport sashelp.class 
      'C:\SASCourse\Week2\class.csv' replace"; 

  
 * Create a csv file using DATA _NULL_ , and file, put statements; 
  data _null_;
    set sashelp.class;
    file 'C:\SASCourse\Week2\class2.csv' dlm=',';
    If _n_=1 then put 'Name, Sex, Age, Height, Weight';
	put Name Sex Age Height Weight;
  run;


   DATA _NULL_;
        File 'C:\SASCourse\Week2\class3.csv';
        SET sashelp.class;
        PUT (_all_) (',');
    RUN;

    ODS CSV FILE='C:\SASCourse\Week2\class4.csv';
    PROC PRINT DATA = sashelp.class NOOBS;
    RUN;
    ODS CSV CLOSE;




 * Create a report using DATA _NULL_ , and file print, put statements; 
  data _null_;
    set sashelp.class end=eof;
    file print notitles; 
	*File 'C:\SASCourse\Week2\class5.csv'; 
	If _n_=1 then put @5 "Children's Demographic Characteristics";
	if _n_=1 then put @5 38*'-';
    If _n_=1 then put 
         @5 'Name' +6 'Sex' +3 'Age' +1 'Height' +2 'Weight';
	if _n_=1 then put @5 38*'-';
	put  @5 name $8.  -r
         +3 sex $1.
         +3 age 3.
         +3 height 4.1
         +3 weight  6.1;
  if eof then do;
          put @5 38*'-'/;
          put @5 'Data Source: SASHELP.CLASS;' _N_ : z2. 'cases.'; 
		  put @5 "Date Prepared: %sysfunc(today(), worddate).";
  end;		
  run;

  
