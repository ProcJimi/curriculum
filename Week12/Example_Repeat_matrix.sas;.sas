ods graphics off; ods html close; ods listing;
options nodate nonumber;
*Example_Repeat_matrix.sas;
proc iml;
	X={1 2, 0 4}; 
   	repeat_x22= repeat(X, 3, 2);
print X, repeat_x22;
quit;
