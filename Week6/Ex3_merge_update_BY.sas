*Ex3_merge_update_BY.sas;
proc datasets kill nolist nodetails; quit;
options nodate nonumber;
data work.MASTER; 
infile datalines firstobs=2 truncover;
input pt_id $ 1-4 Name $ 6-13 @16 visit_date mmddyy10.;
FORMAT visit_date mmddyy10.;
datalines;
1234567890123456789012345
P001 Mary      07/23/2016
;
proc sort data=work.MASTER; by  pt_id; run;
data work.TRANS; 
infile datalines firstobs=2 truncover;
input pt_id $ 1-4 Name $ 6-13 @16 visit_date mmddyy10.;
FORMAT visit_date mmddyy10.;
datalines;
1234567890123456789012345
P001           09/24/2016
P001 Ann-Mary  11/30/2016
P001 Ann-Mary   
;
proc sort data=work.TRANS; by  pt_id; run;
title 'LISTNG - WORK.MASTER';
proc print data=work.MASTER; 
run;

title 'LISTNG - WORK.TRANS';
proc print data=work.TRANS; 
run;

data work.Merged_NEW;
 MERGE work.MASTER 
       work.TRANS; 
   by  pt_id;
run;
title 'WORK.MERGED_NEW';
proc print data=
     work.Merged_NEW; 
run;

data work.Updated_NEW;
 UPDATE work.MASTER (IN=O) 
        work.TRANS (IN=T);
  by  pt_id;
run;
title 'WORK.Updated_NEW '; 
proc print data=
     work.Updated_NEW; 
run;


