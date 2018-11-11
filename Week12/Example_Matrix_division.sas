ods graphics off; ods html close; ods listing;
/*Source: http://www.soph.uab.edu/Statgenetics/People/MBeasley/Courses/IML-Guide.pdf;*/*Example_Matrix_division.sas;
options nodate nonumber;
proc iml;
	M1 = {1 2 3, 4 5 6, 7 8 9}; 
    M2 = {8 2 3, 4 9 6, 7 1 5}; 
    M1_M2_Div=M1/M2;
	print M1; print M2; 
    print  M1_M2_Div;
quit;


