*Ex11_MFILE.sas;
options nocenter nodate nonumber;
%LET path=C:\SASCourse\Week11;
* Directing generated code to a SAS file;
%macro read_year(start=, stop=);
  %do i = &start %to &stop;
    data Data&i; 
      infile "&path\yr&i..csv" DLM=','; 
      input var1 $ var2 var3;
	  Year=2000+&i;
	title "Listing from Data&i Data Set"; 
    proc print data=Data&i noobs; 
    run;
 %end;
%mend read_year;
Filename mprint "&Path\Generated_Code1.sas";
options mprint mfile;
%read_year (start=12, stop=15)

* Create a macro to generate text on the SET statement;
%macro names(prefix, initial, maxnum);
  %do i=&initial %to &maxnum;
    &prefix&i
  %end;
  ;
%mend names;

*Concatenate data sets using the macro already created;
Filename mprint "&Path\Generated_Code_SET1.sas" ;
options mprint mfile;
data all;
  set %names(Data,12,15)
;
run;
proc print data=all; run;









