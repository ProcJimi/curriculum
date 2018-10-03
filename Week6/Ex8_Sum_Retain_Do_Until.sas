*Ex8_Sum_Retain_Do_Until.sas;
* Accumulator variable - Created DATA Step vs. PROC Step;
data have;
infile datalines missover;
input ID value;
datalines;
1 10
1 20
1 30
2 30
2 50
3 60
3 
;
* Way 1 - Sum Statement;
data want1;
    set have; by ID;
	if first.id then Cumvalue=0;
	 CumValue+Value;
   if last.ID then output;
 run;
 proc print data=want1; run;

 * Way 2 - Retain and Assignment Statement;
 data want2;
    set have; by ID;
	retain CumValue;
	if first.id then CumValue=0;
	 CumValue=sum(CumValue,Value);
	  if last.ID then output;
  run;
 proc print data=want2; run;

 * Way 3 - Sum Statement " if first.id .." not used ;
data want3;
    set have; by ID;
	CumValue+Value;
   if(last.ID) then CumValue = 0;
   if last.id then output;
 run;
 proc print data=want3; run;


* Way 4 - Sum Statement "do until ..." used;
data want4;
do until (last.id);
    set have;
    by id;
    CumValue + value;
    output;
end;
CumValue = 0;
run;
proc print data=want4; run;

** Way 5 - PROC SQL;
* Summarize data using PROC SQL;
proc sql;
select id,
     sum (value) as cumvalue
from have
group by id;
quit;

** Way 6 - PROC SUMMARY;
* Summarize data using PROC SUMMARY;
proc summary data=have nway;
  var value;
  class id;  
  output out=want (drop =_type_ _freq_)
    sum=sum_value;
run;
proc print data=want; run;


** Way 7 - PROC MEANS;
* Summarize data using PROC MEANS;
proc means data=have noprint;
   class id;
   var value;
output out=want2 (drop =_type_ _freq_)
       sum = sum_value;
run;
proc print data=want2; 
where id  ne .;
run;

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
proc print data=want; run;

* Alternatively;
data want2;
  set HAVE;  by pt_id vdate;
  count + 1;
   if first.vdate then count = 1;
  if last.vdate then output;
run;
proc print data=want2; run;

