*Ex4_sample_select.sas;
proc surveyselect data=SASHELP.HEART
  method=srs n=100 out=WORK.HEART;
run;

*Example_Point_Sample.sas;
data MaleSamples FemaleSamples;
  drop  i SampleSize;
   SampleSize=100;
  do i = 1 to SampleSize;
      SelectSamples=ceil(ranuni(0) * TotObs);
	SET SASHELP.HEART point=SelectSamples nobs=TotObs;
	   if sex='Male' then output MaleSamples;
	   else output FemaleSamples;
  END;
  STOP; 
run;