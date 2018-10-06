
*Ex1_concat_interleave.sas;
options nonumber nodate;
DATA D1;
  INPUT CustID Month $ Spend @@;
  DATALINES;   
  13 Jan 227.7 14 Jan 256.3 11 Jan 237.4 
  12 Jan 249.2 15 Jan 266.6
  ;
PROC PRINT DATA=D1 noobs; 
title 'Data D1';run;
DATA D2;
 INPUT CustID Month $ Spend @@;
 DATALINES;
 11 Feb 288.2 15 Feb 286.5 12 Feb 221.7 
 13 Feb 274.4  14 Feb 222.9
PROC PRINT DATA=D2 noobs;  
title 'Data D2';run;
 DATA concat; 
   SET D1 D2; 
PROC PRINT DATA=concat noobs ; 
title 'Data - Concatenated'; run;

Data master; set D1; run;
Data add; set D2; run;
proc append base=master  data=add;
run;
title 'PROC APPEND - Concatenated';
proc print data=master noobs;
run;

*** Create a data set with variables that have the same attribute 
    as those in an existing SAS data set- code idea from
    Marths Messineo (2017);

  data class1 ;
   set sashelp.class;
  run; 
  
data class2;
  if (0) then set SASHELP.CLASS;
  input name sex age height weight;
  datalines;
  Kia F 13 62  102
  ; 
proc append base=class1 data=class2;

proc sql;
 create table concat_sql as
 select * from D1
   union 
 select * from D2
 order by Month desc;
 title 'Vertical Joining Using PROC SQL';
 select * from concat_sql;
quit;

*Interleave Data Sets D1 and D2;
PROC SORT DATA=D1 out=D1sorted; 
BY CustID Month; run;
PROC SORT DATA=D2 out=D2sorted; 
BY CustID Month; run;
DATA interleave;
SET D1sorted D2sorted ; 
BY CustID descending Month;
PROC PRINT DATA=interleave noobs;
title 'Data - Interleaved';
run;

proc sql;
 create table concat_sql_i as
 select * from D1
   union /*corresponding all */
 select * from D2
 order by CustID, Month desc;
  title
 'Vertical Joining Using PROC SQL /Interleaved';
 select * from concat_sql_i;
quit;


/* With the UNION operator with PROC SQL, rows from intermediate
result setsare concatenated. 

The default behavior of the UNION operator
is that the duplicate rows are removed from the final results. 

Due to ALL modifier,duplicate results are not removed. 

With the UNION operator, column names 
in the final result set are determined by the first result set.
However, due to CORRESPONDING modifier, columns are matched 
by name and nonmatching columns are removed 
from the intermediate result set (SAS Documentation). */

/* New example to be added */

