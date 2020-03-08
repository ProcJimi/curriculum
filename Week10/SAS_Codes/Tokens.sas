%Let ds=class;
title "Listing from &ds";
title2 "Females with weight >100 ibs";
proc print data=sashelp.&ds 
  (where=(sex= 'F' and weight >100));
run;
