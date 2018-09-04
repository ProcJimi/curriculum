*Ex25_read_from_web.sas;
Filename raw url 
    'http://data.princeton.edu/wws509/datasets/effort.dat';
data have1;
   infile raw  firstobs=2 truncover ;
   input record $80. ;
   put _all_;
   if _n_=5 then stop;
run;
proc print data=have1; run;

data have2;
   infile raw  firstobs=2 obs=5 truncover ;
   input country $ setting  effort  change ;
   put _all_;
 run;
proc print data=have2; run;

