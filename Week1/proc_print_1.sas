
options nocenter nodate ps=58 ls=78;
proc format;
value $regionfmt
    'AFR' = 'Africa'
	'AMR' = 'Americas'
	'EUR' = 'Europe'
	'EMR'  ='Eastern Mediterranean'
	'SEAR' = 'South-East Asia'
	'WPR' = 'Western Pacific';
	run;
proc freq data=sashelp.demographics; 
  tables region; 
  format region $regionfmt.;
run;
proc sort data=sashelp.demographics out=work.demographics; 
  by region; run;
title 'Listing from SASHELP.DEMOGRAPHICS';
proc print data=work.demographics noobs split='*'; 
label name ='Country'
      pop = 'Population*Size'
	  popAGR='Annual Population*Growth Rate*(1995-2005)';
var name popAGR ;
sum pop;
by region;
pageby region;
format region $regionfmt.;
run;

* Find the seven most populous counties in the world;
 proc sort data=sashelp.demographics 
   out=work.demographics; 
  by descending pop; run;

title 'Listing from SASHELP.DEMOGRAPHICS - Seven Most Populous Countries';
proc print data=demographics (obs=7) noobs  split='*'; 
label name ='Country'
      region = 'Region'
      pop = 'Population*Size'
	  popAGR='Annual Population*Growth Rate*(1995-2005)';
var region name pop popAGR ;
format region $regionfmt.;
run;

title 'Listing from SASHELP.DEMOGRAPHICS - Pop Growtth Rate > 0%';
proc print data=sashelp.demographics noobs  split='*'; 
label name ='Country'
      region = 'Region'
      pop = 'Population*Size'
	  popAGR='Annual Population*Growth Rate*(1995-2005)';
var region name pop popAGR ;
format region $regionfmt.;
where popAGR <0;
run;


