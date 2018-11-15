*Ex23_inverting_matrix.sas;
ods graphics off; ods html close; ods listing;
options nodate nonumber;
proc iml;	
    m = {7 1 2, 3 8 5, 6 7 8};
	I_m = inv(m) ;  
print m, I_m;
quit;
