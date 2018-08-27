*** SAS/STAT® 13.1 User’s Guide Sashelp Data Sets
*** This program lists all the data sets 
that are available in Sashelp library;
ods select none;
proc contents data=sashelp._all_;
ods output members=m;
run;
ods select all;
data m_x;
set m;
run;
proc print data=m_x noobs;
where memtype = 'DATA';
run;
