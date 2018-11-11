ods graphics off; ods html close; ods listing;
options nodate nonumber;
*Example_transposing_matrix.sas;
proc iml;	
  m = {1 2, 3 4, 5 6};
	T_m = t(m) ;  
print m, T_m;
quit;
