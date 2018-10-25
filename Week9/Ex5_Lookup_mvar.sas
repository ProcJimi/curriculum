*Ex5_Lookup_mvar.sas;
Options nocenter nodate nonumber;
Title1 "Look-up using a data step variable";
Title2 "  ";
proc print data=sashelp.demographics;
var name pop;
where pop>200000000;
run;

Title1 "Look-up using a macro variable"; 
Title2 "that contains a numeric value";
%let size=200000000;
proc print data=sashelp.demographics noobs;
var name pop;
where pop>&size;
run;

Title1 "Look-up using a macro variable"; 
Title2 "that contains a character value";
%let c_name=QATAR;
proc print data=sashelp.demographics noobs;
var name pop;
where name = "&c_name";
run;

Title1 "Look-up using a macro variable"; 
Title2 "that contains character values";
%let name_QZ=('Q', 'Z');
proc print data=sashelp.demographics noobs;
var name pop;
where name in: &name_QZ;
run;


