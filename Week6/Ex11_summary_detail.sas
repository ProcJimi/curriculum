*Ex11_summary_detail.sas;
/******************************************************
*Combine summary value (average) to the detail dataset
and calculate the deviation of the individual weight
from the mean
*Proc step/Data step approach 
******************************************************/

*** Summary value using PROC MEAMS;
proc means data=sashelp.class noprint;
         output out=summary_data_m(keep=avg_weight)
         mean(weight)=avg_weight;
run;
proc print data=summary_data_m noobs; run;

*** Summary value using PROC SUMMARY;
proc summary data=sashelp.class;
     var weight;
      output out=summary_data_s (drop=_TYPE_ _FREQ_)
      mean(weight)=avg_weight;
run;
proc print data=summary_data_s noobs; 
run;

*** Solution 1: Two SET statements to combine the summary data 
    with the detail data;
data class;
        if _n_=1 then  set summary_data_m;
		set sashelp.class (keep=name weight);
		weight_deviation=1-(weight/avg_weight);
run;
title1 ' Solution 1: DATA step using Two SET statements';
proc print data=class;
var name weight avg_weight weight_deviation;
format weight  5.1  weight_deviation percent8.2;
run;

*PROC SQL approach - (Solution 2) ;
title1 ' Solution 2: PROC SQL Approach';
PROC SQL;
select  name 
       ,weight format=5.1
       ,mean(weight) as avg_weight format=5.1
       ,1-(weight/calculated avg_weight) 
          as weight_deviation format=percent8.2
  from sashelp.class;
 quit;



* DATA Step Approach - Solution 3 ;
data detail_class;
 length new_var $1;
 set sashelp.class;
  new_var='C';
 run;
 data x_summary_data_m;
   length new_var $1;
   set summary_data_m;
     new_var='C';
 run;

data mclass (drop=new_var);
 merge detail_class 
        x_summary_data_m;
 by new_var;
 weight_deviation=1-(weight/avg_weight);
 run;

 title1 ' Solution 3: DATA step using the MERGRE statement';
proc print data=mclass;
format weight avg_weight 5.1 
       weight_deviation percent8.2;
run;



*** Solution 4 PROC Step, CALL SYMPUTX, DATA Step;
Options nocenter nodate nonumber;
proc means data=sashelp.class noprint;
var weight;
output out=mystats mean=ave_weight;
run;

data _null_;
set mystats;
call symputx('AverageWeight',ave_weight);
run;

data x_class;
        set sashelp.class (keep=name weight);
		weight_deviation=1-(weight/&AverageWeight);
run;
title1 "Solution 1: PROC Step, CALL SymputX, and DATA Step";
title2 "Mean weight: %sysfunc(putn(&AverageWeight, 5.1)) lbs";
proc print data=x_class;
var name weight weight_deviation;
format weight 5.1  weight_deviation   percent8.2;
run;
title2 ' ';

