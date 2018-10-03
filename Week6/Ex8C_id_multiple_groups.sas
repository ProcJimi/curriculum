*Ex8C_id_multiple_groups.sas;
data HAVE;
input pt_id $ vdate :$10.;
cards;
1      09/01/2017   
1      09/01/2017   
1      03/04/2018   
2      05/01/2017  
2      06/03/2017 
;
run;
 
proc sort data=HAVE;
by pt_id vdate;
run;
 
data want;
  set HAVE ;
  by pt_id vdate;
  if first.vdate then count_id=0;
  count_id+1;
  if last.vdate then output;
run;
proc print data=want; run;

* Alternatively;
data want2;
  set HAVE;
  count + 1;
  by pt_id vdate;
  if first.vdate then count = 1;
  if last.vdate then output;
run;
proc print data=want2; run;
