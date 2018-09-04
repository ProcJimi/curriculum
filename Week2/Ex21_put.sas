*Ex21_put.sas;
* List all DATA step variables and their values;
data _null_;
  set sashelp.class(obs=2);
  put _all_;
run;
* Exclude automatic variables;
data _null_;
  set sashelp.class(obs=2);
  put (_all_)(=);
run;
* Put each value on a new line;
data _null_;
  set sashelp.class(obs=2);
  put (_all_)(=/);
run;
/* Put each value on a new line and apply 
a common format to all numeric variables*/
data _null_;
  set sashelp.class(obs=2);
  put (_all_)(=/12.2);
run;
/* List values as a table and apply formats 
to groups of variables*/
data _null_;
  set sashelp.class(obs=2);
  if _n_=1 then put @1 'NAME' @19 'SEX' @23 'AGE' 
                    @30 'HEIGHT' @38 'WEIGHT';
  put (_all_)(1*$20.,1*$2.,1*3.,2*8.2);
run;


/* List values as a table and apply formats 
to groups of variables. Route output to the 
standard SAS output window. */
options nodate nonumber;
title;
data _null_;
  set sashelp.class(obs=2);
  file print;
  if _n_=1 then put @1 'NAME' @19 'SEX' @23 'AGE' 
                    @30 'HEIGHT' @38 'WEIGHT';
  put (_all_)(1*$20.,1*$2.,1*3.,2*8.2);
run;

/* List values as a table and apply formats 
to groups of variables. Route output to a file */
options nodate nonumber;
title;
data _null_;
  set sashelp.class(obs=2);
  file "E:\class_data.txt";
  if _n_=1 then put @1 'NAME' @19 'SEX' @23 'AGE' 
                    @30 'HEIGHT' @38 'WEIGHT';
  put (_all_)(1*$20.,1*$2.,1*3.,2*8.2);
run;

/* List values as a table and apply formats 
to groups of variables. Route output to a file 
Write an informational message to the log using 
an PUTLOG statement */
options nodate nonumber;
title;
data _null_;
  set sashelp.class(obs=2)END=last;
  file "E:\class_data2.txt";
  if _n_=1 then put @1 'NAME' @19 'SEX' @23 'AGE' 
                    @30 'HEIGHT' @38 'WEIGHT';
  put (_all_)(1*$20.,1*$2.,1*3.,2*8.2);
  if last then putlog "User's NOTE: Writing to the File is completed";
run;






