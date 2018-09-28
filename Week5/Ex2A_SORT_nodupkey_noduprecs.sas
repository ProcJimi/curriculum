*Ex2A_SORT_nodupkey_noduprecs.sas;
options nonumber nodate;
data work.HAVE;
  input ID $ visit_date :mmddyy. 
        visit_type :& $25.;
  format visit_date mmddyy10. ;
datalines;
A01 01152015 Emergency Room Visit
A01 07252015 Physician Office Visit
A01 07252015 Physician Office Visit
A02 02202015 Physician Office Visit
A02 02202015 Emergency Room Visit
A05 01122015 Outpatient Visit
;
proc print data=work.HAVE noobs ; run;

Title1 "Ex2A_SORT_nodupkey_noduprecs.sas";
Title2 "Sort the data in ascending order by visit_date";
proc sort data=work.Have
     out=work.visit_date_A; 
by visit_date; 
run;
proc print data=work.visit_date_A; 
run;

Title2 "Sort the data in descending order by visit date";
proc sort data=work.Have
     out=work.visit_date_D; 
by descending visit_date; 
run;
proc print data=work.visit_date_D; 
run;

title2 "NODUPKEY Option with PROC SORT - One BY-variable (ID)";
proc sort data = work.HAVE nodupkey 
   out=work.nodupkey_1BY; 
by ID ;
proc print data=work.nodupkey_1By noobs; 
run;

Title2 "Sort with NODUPKEY Option with PROC SORT - Two By_variables";
proc sort data = work.HAVE nodupkey 
   out=work.nodupkey_2Bys; 
by ID Visit_date;
proc print data=work.nodupkey_2Bys noobs; 
run;


proc sort data = work.HAVE noduprecs
  out=work.noduprec_obs 
  DUPOUT=work.dupoutobs ;
 BY ID ;
run;
proc print data=work.dupoutobs noobs; 
run;
proc print data=work.noduprec_obs noobs; 
run;


** New options with PROC SORT;
proc sort data = have nouniquekeys
          out = duplicates
          uniqueout = singles;
by ID Visit_date visit_type;
Title2 "NOUNIQUEKEYS and UNIQUEOUT OptionS with PROC SORT (Duplicates)";
proc print data=duplicates noobs; run;
Title2 "NOUNIQUEKEYS and UNIQUEOUT OptionS with PROC SORT (Singles)";
proc print data=singles noobs; run;
