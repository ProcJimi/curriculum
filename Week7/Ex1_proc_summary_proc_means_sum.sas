*Ex1_proc_summary_proc_means_sum.sas;

proc summary data=sashelp.heart;
     class BP_Status;
     var weight;
     output out=stats 
     sum=/autoname;
run;


proc means data=sashelp.heart; 
class BP_status;
var weight;
run;


* Sum= /autoname Option;
*Ex1_proc_summary_autoname.sas;
 proc summary data=sashelp.prdsale;
     var _numeric_;
     output out=want_summary(drop=_type_ _freq_) 
     sum=/autoname;
   run;
proc transpose data=want_summary 
      out=t_ws (rename=(col1=Amount))
      name=SummingWhat;
run;

proc print data=t_ws;
format amount dollar12.;
run;
