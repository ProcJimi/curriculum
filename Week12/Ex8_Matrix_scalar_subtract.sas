*Ex8_Matrix_scalar_subtract.sas;
ods graphics off; ods html close; ods listing;
options nodate nonumber;
proc iml;
	  M1 = {1 2 3,4 5 6, 7 8 9} ;  
	  M1_Scalar_Subtract= M1-2; *Scalar subtraction;
	  print M1; print M1_Scalar_Subtract;
quit;
