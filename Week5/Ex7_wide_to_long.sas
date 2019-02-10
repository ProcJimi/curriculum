** More examples on reshaping data;
DATA wide;
 INPUT Student_ID $ Test1-Test5;
DATALINES;
A001	 80 80 80 82 75
B002	 85 72 85 89 81
C003 	 87 88 89 91 79
D004  	 87 88 89 90 82
;
proc print data=wide noobs; run;
title ' Original - Wide Data';

proc sort data=wide; by Student_ID; run;
proc transpose data=wide 
   out=long (rename=(_NAME_=Test col1=Score));
by Student_id;
run;
proc print data=long noobs; 
title ' Wide data transposed to long';
run;



