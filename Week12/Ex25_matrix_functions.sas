*Ex25_matrix_functions.sas;
ods graphics off; ods html close; ods listing;
options nodate nonumber;
proc iml;
	X={1 2 3, 4 5 6, 7 8 9}; 
    Y={7 1 2, 3 8 5, 6 7 8};;
    sum_X_Y = sum(X, Y);
    max_X= max(X);
	ncol_Y = ncol(Y);
    nrow_Y=nrow(Y);
 print x, y, sum_X_Y, max_X, ncol_y, nrow_y ; 
 quit;
