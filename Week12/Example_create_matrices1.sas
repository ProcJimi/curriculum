ods graphics off;
ods html close;
ods listing;
*Example_create_matrices1.sas;
OPTIONS NOCENTER NONUMBER NODATE PS=58 LS=91;
OPTIONS FORMCHAR="|----|+|---+=|-/\<>*";
proc iml;
      s= 2; /*scalar matrix - just one element*/
	rv = {1 2 3};  /* 1 x 3 row vector */
	cv = {1,2,3};  /* 3 X 1 column vector */
	mat = {1 2 3,4 5 6, 7 8 9} ;  /*3 X 3 matrix */
	print  s rv; print cv mat;
 quit;
