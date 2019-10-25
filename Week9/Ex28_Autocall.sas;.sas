*Ex28_Autocall.sas;
filename mymacros 'C:\sascourse\Week9';
options nodate nonumber mautosource sasautos=(mymacros, sasautos);
title "Means for height and weight - Job run on %date_macro";
proc print data=sashelp.class (obs=5) noobs;
run;
