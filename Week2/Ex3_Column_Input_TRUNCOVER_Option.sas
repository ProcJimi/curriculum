*Ex3_column_Input_TRUCOVER_Option.sas;

*** To clean up the "work" library;
proc datasets lib=work nolist kill; quit;

data HAVE;
*** TRUNKOVER option on the INFILE statement;
 infile 'C:\SASCourse\Week2\short_values.txt' TRUNCOVER;
 input id 1-3 name $ 5-16 
       score 18-19 @21 some_value 5.2;
proc print data=HAVE noobs; run;


/*
Note: The TRUNCOVER option on the INFILE statement �causes the 
DATA step to assign the raw data value to the variable even  
if the value is shorter than expected by the INPUT statement. 
If, when the DATA step encounters the end of an input record,
there are variables without values, the variables are assigned 
missing values for that observation.� SAS Documentation.
*/