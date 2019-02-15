*Ex5_how_many_obs.sas;
options leftmargin=10cm;
DATA  _NULL_;
 SET sashelp.heart NOBS=numobs;
 if numobs then PUT @7 "Number of cases =" numobs=comma7.;
 stop;
run;

DATA   _NULL_;
  SET sashelp.heart END=last;
  count+1;
  if last then PUT @7 "Number of cases =" count =comma7.;
run;

DATA  _NULL_;
 if 0 then SET sashelp.heart NOBS=N;
   CALL SYMPUTX('total', N);
   %PUT Number of cases = %SYSFUNC(left(&total));
 stop;
run;


PROC SQL noprint;
select count(*)into :OBSCOUNT
 from sashelp.heart;
%PUT Number of cases = %SYSFUNC(left(&OBSCOUNT));
quit;

