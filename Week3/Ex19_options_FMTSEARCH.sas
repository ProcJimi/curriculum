*Ex19_options_FMTSEARCH.sas;
OPTIONS nodate nonumber nocenter;
%LET path=C:\SASCourse\Week3;
LIBNAME sds "&path";
Options FMTSEARCH = (sds.popcatalog);
PROC FREQ data=sds.pop2013x; 
 TABLES REGION;
RUN;

