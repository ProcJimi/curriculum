*Ex13_sashelp_vtable_vcolun.sas;
* Contributed by Reza to SAS-L - 9/25/2018;
%let lref=SASHELP;
%let dsn=CARS;

/*
Query the SASHELP or DICTIONARY table using proc sql
*/
proc sql noprint;
select sum(type='char'), sum(Type='num') into :n_char, :n_num
from sashelp.vcolumn
where libname = upcase("&lref.") and upcase(memname) = upcase("&dsn.");
quit;

%put &n_char;
%put &n_num;


/*
SASHELP.VTABLE keeps this information stored...
in to variables for every SAS dataset, num_character, num_numeric. 
*/

%let lref=SASHELP;
%let dsn=CLASS;

proc sql noprint;
select num_character, num_numeric into :n_char_x, :n_num_x
from sashelp.vtable
where libname = upcase("&lref.") and upcase(memname) = upcase("&dsn.");
quit;

%put &n_char_x;
%put &n_num_x;

*** Data step approach;
Data test;
set sashelp.cars;
array nums(*) _numeric_;
array chrs(*) _character_;
call symputx('nb1',dim(nums),'G');
call symputx('nb2',dim(chrs),'G');
run;

%put &nb1;
%put &nb2;
