
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


*Ex9_Contents_many_ways.sas;
proc sql;
select name, type, length
 from dictionary.columns
 where libname= "SASHELP" and memname = "HEART"
 and name like "%_Status";
 quit;



