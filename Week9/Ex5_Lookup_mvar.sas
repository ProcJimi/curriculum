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
options symbolgen;
Title1 "Look-up using a macro variable"; 
Title2 "that contains a character value";
%let c_name=QATAR;
proc print data=sashelp.demographics noobs;
var name pop;
where name = "&c_name";
run;

options symbolgen;
Title1 "Look-up using a macro variable"; 
Title2 "that contains a quoted character value";
%let c_name='QATAR';
proc print data=sashelp.demographics noobs;
var name pop;
where name = &c_name;
run;

/*List obseravtions having the country names that begin 
  with Q or Z in the the SASHELP.DEMOGRAPHICS data set.
  Techinique: Code Character Comparisons with Criteria 
  Having Different Lengths - Global Forum paper 
  by Paul Grant (2009)*/

options symbolgen;
Title1 "Look-up using a macro variable"; 
Title2 "that contains character values";
%let name_QZ=('Q', 'Z');
proc print data=sashelp.demographics noobs;
var name pop;
where name in: &name_QZ;
run;


