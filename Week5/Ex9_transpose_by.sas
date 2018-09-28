*Ex9_transpose_by.sas;
 options nodate nonumber ;
 proc format;
 value cat_fmt 1 = 'Caregory 1'
               2 = 'Category 2'
		       3 = 'Category 3'
;
 data have;
  length year $4;
  input year Category mean @@;
  format Category cat_fmt.;
  datalines;
  2010 1 256.3 2011 1 235.4 2012 1 215.5
  2013 1 210.7 2014 1 209.3 2010 2 145.5
  2011 2 150.8 2012 2 147.1 2013 2 180.8
  2014 2 142.9 2010 3 219.5 2011 3 245.8
  2012 3 242.0 2013 3 239.8 2014 3 223.8
  ;
  run;
 proc sort data=have; by category; run;
 proc print data=have noobs; run;

 proc transpose data= have out=have_t (drop=_NAME_);
           by category; 
		   id year;
		   idlabel year;
           var mean;
run;
proc print data=have_t noobs label; run;

