*Ex21_Create_col_vector_vecdig_func.sas;
ods graphics off; ods html close; ods listing;
options nodate nonumber;
proc iml;
	X={1 2 3, 4 5 6, 7 8 9};
    vec_diag = vecdiag(X);
	print X, vec_diag;
quit;
