ods graphics off; ods html close; ods listing;
options nodate nonumber;
*Example_inverting_matrix.sas;
proc iml;	
    m = {7 1 2, 3 8 5, 6 7 8};
	I_m = inv(m) ;  
print m, I_m;
quit;
