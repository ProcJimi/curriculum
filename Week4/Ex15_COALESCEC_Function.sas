*Ex15_COALESCEC_Function.sas;
data have;
 infile datalines DSD;
 input var1:$10. var2 :$6. var3  :$8.;
 datalines;
 Ages 18-49,,
 Ages 50-64,,
 Ages 65+,,
 ,Male,
 ,Female,
 ,,Hispanic
 ,,Black
 ,,White
;
proc print data=have; run;

 data want;
   set have;
   array var[3] $;
   Final_var = coalescec(of var[*]);
  run;
proc print data=want; run;

