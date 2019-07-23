
/* Default behavior of the CONTENTS procedure
- generates variable attributes that are listed 
in alphabetical order in the data set*/

Proc contents data=sashelp.heart;
Run;


 ** With the VARNUM option, the CONTENTS procedure generates 
    variable attributes that are listed  by their logical 
    position in the data set;

Proc contents data=sashelp.heart varnum;
Run;

** With the POSITION option, the CONTENTS procedure generates 
   variable attributes are listed by  position in the data set;

Proc contents data=sashelp.heart position;
Run;

Proc contents data=sashelp.heart p;
ods select position;
Run;

** With the SHORT option, variable names are listed in a 
   row-by-row format;
Proc contents data=sashelp.heart short;
Run;

** The CONTENTS statement in the DATASETS procedure does also similar
output that PROC CONTENTS generate;

proc datasets;
contents data=sashelp.class;
quit;

/* You can add the OUT= filename option to the CONTENTS procedure
   to create a SAS data set where each observation is a variable 
   from the original data set. The NOPRINT option supresses the listing 
   of the output data set */

proc contents data = sashelp.heart
out = varsdata (keep= name type length label) noprint;
run; 

** Sort the output data set by VARNUM;
proc sort data=varsdata; by varnum; run;
**  Get the listing;
proc print data= varsdata noobs;
run;

/** The SAS System generates the information at run time 
about SAS libraries, data sets, catalogs,
indexes, macros, system options, titles, and views in a collection
of read-only tables called dictionary tables.

When you work in a SAS environment where all your libraries are defined 
 in SAS metadata and they are available in every SAS job. 

The following code below extracts the information about "column" 
from a SQL table  (i.e. SAS data set);
*/

 proc sql; 
 select varnum, name, type 
	from dictionary.columns 
	where libname = 'SASHELP' and memname = 'HEART'; 
quit; 

* Create a macro variable (VARIABLE_NAME) that will hold all variable names 
(horizontal list) in the SAS data set (Advanced Topic);
proc sql noprint; 
     select name into :Variable_Names separated by ' ' 
     from dictionary.columns 
     where LIBNAME='SASHELP' and memname = 'HEART';
 quit; 
 %put &Variable_Names;


proc sql ;
          select *
            from sashelp.vcolumn
                 where libname='SASHELP'
				      & memtype='HEART';
quit;

/* SASHELP.VCOLUMN contains the information about variables (columns) 
  in a data set. You can create an output data set using SAS DATA step 
  from the Dictionary view SASHELP.VCOLUMN and then print the 
  variable attributes */

data vars; 
set sashelp.vcolumn;
where libname = 'SASHELP' and memname = 'CLASS'; 
keep varnum name type; 
run; 

proc print data= vars noobs;
run;

/* You can also use PROC SQL to print variable attributes 
  from the Dictionary view SASHELP.VCOLUMN */ 
  
proc sql;
select name
, type
, label
, length
, informat
, format
from sashelp.vcolumn
where libname = 'SASHELP'
   and memname='HEART';
quit;


proc sql;
select name, type, length
 from dictionary.columns
 where libname= upcase("PUFMEPS") and memname = upcase("h192")
 and 
     name like "FAMID%" or 
	 name like "ELGRND%" or 
	 name like "FAMSZE%" or 
     name like "RULETR%" or 
	 name like "REGION%" or 
	 name like "BEGRF%" or 
     name like "ENDRF%" or 
	 name like "REFPRS%" or 
     name like "RESP%" or 
	 name like "ELGRND%" or 
     name like "PROXY%" or 
	 name like "INSCOP%" or 
     name like "PSTATS%"; 
quit;

* Find the number of observations (Method 1);
title1 '_1read_Flights.sas';
data _NULL_;
	if 0 then set sashelp.cars nobs=n;
	call symputx('nrows',n);
	stop;
run;
%put nobs=&nrows;

** Find the number of observations as well as variables (Method 2);
proc sql;
select nobs format=comma7.
       ,nvar 
    from dictionary.tables
    where libname = 'SASHELP' and memname = 'CARS';
 quit;





