*Ex9_Dictionary_column.sas;
OPTIONS nodate nonumber ;
* Get column names, and type from a particular SAS Table;
proc sql;
 SELECT NAME, TYPE, LABEL  
  FROM DICTIONARY.COLUMNS  
   WHERE UPCASE(LIBNAME)="SASHELP" AND  
         UPCASE(MEMNAME)="HEART";  
QUIT;

* Get the column names that are the same in all SAS tables
  in the same library;
proc sql;
 SELECT MEMNAME 'Table Names', NAME
  FROM DICTIONARY.COLUMNS  
   WHERE UPCASE(LIBNAME)="SASHELP" AND  
         UPCASE(NAME)="WEIGHT";  
QUIT;

* Get a horizontal list of column names of a SAS table;
proc sql noprint; 
     select name into : COLNAMES separated by ' ' 
     from dictionary.columns 
     where LIBNAME='SASHELP' and memname = UPCASE('class');
 quit; 
 %put &COLNAMES;

 * Contributed by Reza to SAS-L - 9/25/2018;

/* SASHELP.VTABLE has the information on the number of 
  numeric variables and the number of character variables
  for every SAS dataset: num_character, num_numeric.*/

* Grt this information into macro variables and then extract;

* Solution 1 - PROC SQL Approach;
%let lref=SASHELP;
%let dsn=CLASS;

proc sql noprint;
select num_character, num_numeric into :n_char_x, :n_num_x
from sashelp.vtable
where libname = upcase("&lref.") and upcase(memname) = upcase("&dsn.");
quit;

%put &=n_char_x;
%put &n_num_x;

%let lref=SASHELP;
%let dsn=CARS;

*** Solution 2 SUM function in PROC SQL;
/* Query the SASHELP or DICTIONARY table*/
proc sql noprint;
select sum(type='char'), sum(Type='num') into :n_char, :n_num
from sashelp.vcolumn
where libname = upcase("&lref.") and upcase(memname) = upcase("&dsn.");
quit;

%put &=n_char;
%put &=n_num;

*  Solution 3 -Data Step Approach;
Data test;
set sashelp.cars;
array nums(*) _numeric_;
array chrs(*) _character_;
call symputx('nb1',dim(nums),'G');
%put &=nb2;
call symputx('nb2',dim(chrs),'G');
run;

%put &=nb1;


