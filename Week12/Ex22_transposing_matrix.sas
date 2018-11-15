*Ex22_transposing_matrix.sas;
ods graphics off; ods html close; ods listing;
options nodate nonumber;
proc iml;	
  m = {1 2, 3 4, 5 6};
	T_m = t(m) ;  
print m, T_m;
quit;
