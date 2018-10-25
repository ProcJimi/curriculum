*Ex11_one_multiple_mvars_sql.sas;
proc sql noprint;
 select count(*)
        INTO :nobs
		FROM SASHELP.CARS;
quit;
%put Number of Observations = %SYSFUNC(LEFT(&nobs));
run;

Options nosymbolgen;
proc sql noprint;
 select distinct make
        INTO :makes separated by ',' 
	    FROM SASHELP.CARS;
quit;
%put List of Values of Car Make (Unique) : &makes;


%let Put_title = List of Values into a Series of Macro Variables;
proc sql noprint;
 select distinct make
        INTO :makes1-
		FROM SASHELP.CARS ;
 %put Number of Rows: &sqlobs;
quit;
%macro reveal;
 %put &Put_title;
 %Do i=1 %TO &Sqlobs;
    %put &&makes&i;
  %end;
%mend reveal;
%reveal







