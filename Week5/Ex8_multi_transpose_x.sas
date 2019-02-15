*Ex8_multi_transpose_x.sas;
options nocenter nonumber nodate;
data have;
   input family_id $ month Ins_paid copay @@;
datalines;
F002 1 350 60 F002 2 100  30 F002 3 88 20 F002 4 20  0
F002 5 450 90 F002 6 70 30
F001 1 245 60 F001 2 100  0 F001 3 0 0 F001 4 120  30
F001 5 345 60 F001 6 95 30 
;
proc print data=have noobs; run;

proc sort data=have;  by family_id; run;
proc transpose data= have 
          out=have_t name=stat; ;
   by family_id month;
   var Ins_paid copay;
run;
proc print data=have_t noobs; run;
proc contents data=have_t position; 
ods select variables;
run;

proc transpose data=have_t out=have_tt(drop=_NAME_);
by family_id;
var col1;
id stat month;
run;
proc print data=have_tt noobs;
run;



