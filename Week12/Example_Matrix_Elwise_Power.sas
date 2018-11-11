ods graphics off; ods html close; ods listing;
*Example_Matrix_Elwise_Power.sas;
options nodate nonumber;
proc iml;
	M1 = {1 2 3,4 5 6, 7 8 9} ;  *3 X 3 matrix; 
	M1_E_Power2= M1##2; 
	print M1; print M1_E_Power2;
quit;

