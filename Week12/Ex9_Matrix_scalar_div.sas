*Ex9_Matrix_scalar_div.sas;
ods graphics off; ods html close; ods listing;
options nodate nonumber;
proc iml;
	  M1 = {1 2 3,4 5 6, 7 8 9} ;  
	  M1_Scalar_Division= M1/2; *Scalar division;
	print M1; print M1_Scalar_Division;
quit;
