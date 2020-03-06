/*
proc print data=sashelp.applianc;
run;
*/
data have;
  set sashelp.applianc;
  array units_[29] ;
  do i = 1 to 29;
    F_sum_value = sum(OF units_[*]);
	F_max_value = max(OF units_[*]);
	F_min_value = min(OF units_[*]);
	F_mean_value = mean(OF units_[*]);

  end;
 run;
 proc freq data=have;
     tables F_/missing;
 run;
