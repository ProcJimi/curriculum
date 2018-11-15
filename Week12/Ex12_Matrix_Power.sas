*Ex12_Matrix_Power;
ods graphics off; ods html close; ods listing;
options nodate nonumber;
*Example_Matrix_Power.sas;
proc iml;
	M1 = {1 2 3, 4 5 6, 7 8 9}; 
    M1_Power2=M1**2;
	print M1;  
    print  M1_Power2;
quit;


