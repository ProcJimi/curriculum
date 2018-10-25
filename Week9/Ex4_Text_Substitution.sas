*Ex4_Text_Substitution.sas;
***Part 1: No macro variables used;
proc contents data=SASHELP.CLASS; 
run;
title "Data Set: SASHELP.CLASS";
proc print data=SASHELP.CLASS (obs = 5); 
run;

***Part 2: Macro variables used;
options symbolgen;
%let dsn = SASHELP.CLASS;
%let HowMany = 5;
%put _user_;
proc contents data=&dsn; 
run;
title "Data Set: &dsn";
proc print data=&dsn (obs = &HowMany); 
run;
