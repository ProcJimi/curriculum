*Ex8_multi_transpose_x.sas;
options nocenter nonumber nodate;
proc format;
  value cat_fmt  1 = 'Category 1'
                 2 = 'Category 2'  
                 3 = 'Category 3';
data have;
   length year $4;
   format category cat_fmt.;
   input year $ category  Sample_N mean se;
datalines;
2010    1    22245      256.1       5.278
2011    1    23447      253.5       4.508
2012    1    25435      227.6       4.946
2013    1    26956      221.8       4.027
2014    1    28243      233.5       5.207
2010    2    13383      147.5       1.194
2011    2    15245      151.3       1.130
2012    2    16606      148.7       1.475
2013    2    20279      182.3       1.491
2014    2    19506      147.3       1.135
2010    3    29968      250.6       4.942
2011    3    31038      287.4       6.775
2012    3    32893      272.2       5.848
2013    3    32418      272.1       6.266
2014    3    31351      257.8       5.621
;
proc sort data=have;  by category year run;
proc print data=have label; run;

proc transpose data= have 
          out=have_t name=stat; ;
   by category year;
   var Sample_N mean se;
run;
proc print data=have_t noobs label; run;
proc contents data=have_t; run;

proc transpose data= have_t out=have_tt 
       (drop=_name_) delimiter=_ ;
   by category;
   id stat year;
   var col1;
run;
options nocenter ls=132;
proc print data=have_tt noobs label;
var category Sample_: mean_: se_: ;
format Sample_: comma7.;
run;



