*Example_Listing_PROC_PRINT.sas;
OPTIONS ps=60 ls=92 nodate nonumber;
LIBNAME sds 'C:\SASCourse\Week1_updated';
TITLE1 'Five US States by Population, 2013 Estimates';
PROC PRINT data=sds.pop2013 (obs=5); 
VAR region FIPS name pop pop18p percent_pop18p ;
run;

TITLE 'Five US States by Population, 2013 Estimates';
PROC PRINT data=sds.pop2013 (obs=5) NOOBS LABEL; 
  VAR region FIPS name pop pop18p percent_pop18p ;
  run;

TITLE 'US States by Population that Begin with the Letter A';
 PROC PRINT data=sds.pop2013 NOOBS LABEL N ; 
   VAR region FIPS name pop pop18p percent_pop18p ;
   WHERE name like  'A%';
 run;

PROC SORT data= sds.pop2013 out=HiToLoPop;  by descending pop; run;
TITLE 'Seven Most Populous US States by Population, 2013 Estimates';
PROC PRINT data=HiToLoPop (FIRSTOBS=1 OBS=7) NOOBS LABEL ; 
   VAR REGION FIPS name percent_pop18p ;
   SUM pop pop18p ;
 run;

 PROC SORT data= sds.pop2013 out=temp; by region;
   TITLE 'US States by Population, 2013 Estimates';
 PROC PRINT data=temp NOOBS LABEL ; 
   ID region;
   BY region;
   VAR FIPS name percent_pop18p ;
   SUM pop pop18p ;
 run;

  PROC SORT data= sds.pop2013 out=temp; by region;
  TITLE 'US States by Population, 2013 Estimates';
  PROC PRINT data=temp NOOBS LABEL ; 
   ID region;
   BY region;
   PAGEBY region;
   VAR FIPS name pop pop18p percent_pop18p ;
   SUM pop pop18p ;
  run;
TITLE 'Five US States by Population Aged 18+ Years, 2013 Estimates';
 PROC PRINT data=sds.pop2013 (obs=5) NOOBS SPLIT='*'; 
  VAR Name percent_pop18p ;
  LABEL percent_pop18p = 'Percent*Population*Aged 18+ Years';
  FORMAT percent_pop18p 7.0;
 run;


