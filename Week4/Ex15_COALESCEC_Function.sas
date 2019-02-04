*Ex15_COALESCEC_Function.sas;
data have;
 infile datalines DSD;
 input var1:$10. var2 :$6. var3  :$8.;
 datalines;
 Ages 18-49,,
 Ages 50-64,,
 Ages 65+,,
 ,Male,
 ,Female,
 ,,Hispanic
 ,,Black
 ,,White
;
proc print data=have; run;

 data want;
   set have;
   array var[3] $;
   Final_var = coalescec(of var[*]);
  run;
proc print data=want; run;


/*
 1) The COALESCE function can replace missing values with 0.  
    It keeps the value if it's anything but a missing.  Otherwise the result will be 0. 

 2)  The other option is using the CASE escorepression.

 3) The COALSCE function returns the first nonmissing value in a list of variables.
  https://blogs.sas.com/content/iml/2011/05/11/the-coalesce-function-proc-sql-compared-with-proc-iml.html
*/

data Have;
input score1 score2;
datalines;
 . 15  
 .  . 
 17 13
 14  . 
 .  20
 14 19
;
run; 


/*
 1) The COALESCE function can replace missing values with 0.  
    It keeps the value if it's anything but a missing.  Otherwise the result will be 0. 

 2)  The other option is using the CASE escorepression.

 3) The COALSCE function returns the first nonmissing value in a list of variables.
  https://blogs.sas.com/content/iml/2011/05/11/the-coalesce-function-proc-sql-compared-with-proc-iml.html
*/
proc sql; 
title 'Coalesce() replaces column values';
select Monotonic() as obs, 
      score1, 
      coalesce(score1, 0) as _score1,
	  case when score1=. then 0 else score1 end as score1x
      from Have;
title 'Coalesce() combines column values';
 select	  Monotonic() as obs,  score1, score2,
	      coalesce(score1, score2) as combined_score
          from Have;
quit;


