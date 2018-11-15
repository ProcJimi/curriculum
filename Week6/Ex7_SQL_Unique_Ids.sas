
*Ex7_SQL_Unique_Ids.sas;
options nonumber nodate;
data work.HAVE;
  input ID $ visit_date :mmddyy. 
        visit_type :& $25.;
  format visit_date mmddyy10. ;
datalines;
A01 07252015 Physician Office Visit
A01 07252015 Physician Office Visit
A01 07252015 Physician Office Visit
A02 02202015 Emergency Room Visit
A02 02202015 Emergency Room Visit
A05 01122015 Outpatient Visit
;
proc print data=work.HAVE noobs ; run;

Title1 "Ex7_SQL_Unique_Ids.sas";
Title2 "Querying Unique Rows - SQL Solution";
proc sql;
select distinct id, visit_date, visit_type
from work.have;
quit;


proc sql;
     create table statecodes as
     select distinct statename, statecode, state
     from sashelp.zipcode;
	 select * from statecodes;
quit;

