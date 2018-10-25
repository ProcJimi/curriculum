*** Ex10_call_symputx_1.sas;
Options nodate nonumber;
proc means data=sashelp.class noprint;
var weight;
output out=mystats mean=mean_weight;
run;

data _null_;
set mystats;
call symputx('AverageWeight', mean_weight);
run;

%put &AverageWeight;
%put _GLOBAL_;

proc print data=sashelp.class noobs;
var name sex weight;
where weight > &AverageWeight;
title1 'Passing Values between Steps';
title2 'Average Body Weight:'; 
title3 "%sysfunc(putn(&AverageWeight, 5.1)) lbs";
run;



******;
*Ex10_call_symputx_1.sas;
*Code idea adapted from Carpenter (2016);
data S1;
input mvar $ mvalue $;
datalines;
Course Stat6197
Exam  Midterm
Mean 73
SD   7
; 
data _null_;
   set S1;
   call symputx(mvar, mvalue);
  run;
%put _user_;

%macro mvarlist;
  data _null_;
   set S1;
  call symputx(mvar, mvalue, 'L');
  run;
  %put _Local_;
%mend mvarlist;
%mvarlist

%macro mvarlist;
 data _null_;
   set S1 (rename=(mvar=x_mvar mvalue=x_mvalue));
   call symputx(x_mvar, x_mvalue, 'G');
  run;
%mend mvarlist;
%mvarlist
%put _GLOBAL_;


*****;

%macro mvarlist;
  data _null_;
   set S1;
  call symputx(mvar, mvalue, 'L');
  run;
  %put _Local_;
%mend mvarlist;
%mvarlist

%macro mvarlist;
 data _null_;
   set S1 (rename=(mvar=x_mvar mvalue=x_mvalue));
   call symputx(x_mvar, x_mvalue, 'G');
  run;
%mend mvarlist;
%mvarlist
%put _GLOBAL_;



 

