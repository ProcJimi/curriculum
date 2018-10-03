*Ex14_Dictionary_column_like_operator.sas;
proc sql noprint; 
 select name into :varlist_15 separated by ' '
 from dictionary.columns
 where libname='WORK' and memname='TEST' /* your library and data set name here in uppercase */
 and upcase(name) like '%_15';
 
 select name into :varlist_16 separated by ' '
 from dictionary.columns
 where libname='WORK' and memname='TEST' /* your library and data set name here in uppercase */
 and upcase(name) like '%_16' and upcase(name) not like '%15_16';
quit;
%put &varlist_15;
%put &varlist_16;
 
proc freq data=test;
tables (&varlist_15)*(&varlist_16);
run;
