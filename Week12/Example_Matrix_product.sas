ods graphics off; ods html close; ods listing;
*Example_Matrix_product.sas;
options nodate nonumber;
proc iml;
	M1 = {1 2 3, 4 5 6};  
	M2 = {7 8, 9 10, 11 12};  
	M1_M2_Product=M1*M2; 
	print M1; print M2; print  M1_M2_Product;
quit;


