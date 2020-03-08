*Ex23_Sysfunc_DateStamp.sas;
options nocenter nodate nonumber;
*Author of this code: Art Carpenter;
title1 " %left(%qsysfunc(date(),worddate18.))";
title2 'Listing from SASHELP.class';
proc print data=sashelp.class (obs=5);
run;


*https://communities.sas.com/t5/SAS-Programming/Datestamp-output/td-p/32367;
*Author: TheShark;
PROC FORMAT;
PICTURE datestamp(default=15)
   other='%Y%0m%0d%0H%0M%0S' (datatype=datetime);
RUN;
 
%let datestamp=%sysfunc(datetime(), datestamp.);

data class_&datestamp.;
set sashelp.class;
RUN;
title "&datestamp - Listing of Class Data";
proc print data=class_&datestamp;
run;
