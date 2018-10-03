
proc export data=sashelp.class
    outfile='c:\test\sashelp class1.csv'
    dbms=csv
    replace;
run;

data _null_;
 file " C:\test\class2.csv ";
 set sashelp.class;
 put (_all_) (',');
run;

ods csv file= 'C:\test\class3.csv ';
proc print data = sashelp.class noobs;
run;
ods trace on; /*telling SAS no to print the results in the output window*/
ods csv close;

filename csv 'C:\test\class4.csv';
data _null_;
set sashelp.class;
file csv dlm=',';
put ( _all_ ) (+0);
run;

libname myxls xlsx "c:\test\class5.xlsx" ;
data myxls.class5;
 set sashelp.class;
 run;
libname myxls clear;

ods excel file="c:/test/class6.xlsx";
ods excel options(sheet_name="class" sheet_interval="none" start_at="B1");
proc print data=sashelp.class;
run;
ods excel close;


