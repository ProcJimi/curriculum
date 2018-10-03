*Ex3_Direct_Access.sas;
DATA TEST (drop=seed);
 seed=123;
  do Student  = 1 to 25;
     /*  a * ranuni(seed) + b   -> interval: <b, a + b> */
     Tuition = ceil(ranuni(seed)*201+12000);  
	 Food = ceil(ranuni(seed)*312+4000);
	 Books = ceil(ranuni(seed)*512+2000);    
	 output;
	end;
  FORMAT Tuition Food Books  dollar8.;  
proc print data = TEST noobs; RUN;

 data try1;
  obsnum= 5;
   set TEST point=obsnum;
   output; 
  stop;
run;
proc print data=try1 noobs; run;


data try2;
  do obsnum = 3,5,8;
   set TEST point=obsnum;
   output; 
  end;
  stop;
run;
proc print data=try2 noobs; run;

data try3;
  do obsnum = 1 to num_of_obs by 5;
   set TEST point=obsnum nobs=num_of_obs;
   output; 
  end;
  stop;
run;
proc print data=try3 noobs; run;


