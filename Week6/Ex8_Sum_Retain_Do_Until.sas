*Ex8_Sum_Retain_Do_Until.sas;
* Accumulator variable - Created DATA Step vs. PROC Step;
data have;
infile datalines missover;
input ID value;
datalines;
1 40
1 30
1 20
3 60
3 
2 30
2 50
;
proc sort data=have; by id; run;

Title 'Sumarizing by Group -  Sum Statement';
data want1 (drop=value);
    set have; by ID;
	if first.id then Cumvalue=0;
	 CumValue+Value;
   if last.ID then output;
 run;
 proc print data=want1 noobs; run;

Title 'Sumarizing by Group -  Retain and Assignment Statement';
 data want2 (drop=value);
    set have; by ID;
	retain CumValue;
	if first.id then CumValue=0;
	 CumValue=sum(CumValue,Value);
	  if last.ID then output;
  run;
 proc print data=want2 noobs; run;

Title 'Sumarizing by Group -  using PROC SQL';
proc sql;
select id,
     sum (value) as cumvalue
from have
group by id;
quit;

** Summarize data using PROC SUMMARY;
proc summary data=have nway;
  var value;
  class id;  
  output out=want (drop =_type_ _freq_)
    sum=sum_value;
run;
Title 'Sumarizing by Group - using PROC SUMMARY';
proc print data=want noobs; run;


* Summarize data using PROC MEANS;
proc means data=have noprint;
   class id;
   var value;
output out=want2 (drop =_type_ _freq_)
       sum = sum_value;
run;
Title 'Sumarizing by Group - using PROC MEAMS';
proc print data=want2; 
where id  ne .;
run;
title;
*Count occurrences of dates by patient id;
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
proc print data=want noobs; run;

* Alternatively;
data want2;
  set HAVE;  by pt_id vdate;
  count + 1;
   if first.vdate then count = 1;
  if last.vdate then output;
run;
proc print data=want2 noobs; run;

