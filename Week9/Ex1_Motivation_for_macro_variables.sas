*Ex1_Motivation_for_macro_variables;
proc means data=sashelp.class mean maxdec=1 noprint;
 var weight;
 output out=stats mean=average_wgt;
run;

data test;
 set SASHELP.class;
 *This line of code does not work;
 weight_ratio=weight/average_wgt;
 run;

 * Create a macro variable using CALL SYMPUTX;
 data _null_;
  set stats;
  call symputx('average_wgt', average_wgt);
 run; 
 %put _user_;
 %put &=average_wgt;

  *The macro variable value can be retrieved in a data step; 
 data test2;
  set SASHELP.class;
  weight_ratio=weight/"&average_wgt";
 run;
 title " ... generated on &sysdate9.";
 proc print data=test2; run;


 *The following nonmacro code works; 
 data test2;
 if _n_ = 1 then  set stats;
 set SASHELP.class;
 weight_ratio=weight/average_wgt;
 run;
 proc print data=test2; run;


