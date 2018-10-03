*Ex1_data_set_options_statements.sas;
*Program 1;
** KEEP=, RENAME=, and WHERE= data Set Options;
options nodate nodate;
data work.class1;
 set sashelp.class (keep=name age sex
		           rename=(name=Student_Name sex=Gender)
                   where =(age >13 )
                   );
run;
title "KEEP=, RENAME=, and WHERE= data Set Options";
proc print data=work.class1;
run;

*Ex1_data_set_options_statements.sas;
*Program 2;
** KEEP, RENAME, and WHERE Data Set Statements;
data work.class2;
 set sashelp.class ;
keep name age sex;
rename name=Student_Name sex=Gender;
where age >14;
run;
title 'KEEP, RENAME, and WHERE Data Set Statements';
proc print data=work.class2;
run;

*Ex1_data_set_options_statements.sas;
*Program 3;
*** INDSNAME= Data Set Option;
data dsn2014 dsn2015 dsn2016 dsn2017 dsn2018;
 Length Course $15;
 course='Stat 4197/6197';
 run;
 data want;
   retain year;
   set dsn: INDSNAME=value;
   Year=substr(value,(length(value)-3));
 run;
 proc print data=want noobs;
 run;


Data work.Class;
  set sashelp.class (FIRSTOBS=7 OBS=10);
run;
title 'WORK.CLASS_REV3 Data Set';
proc print data=work.class;
run;







