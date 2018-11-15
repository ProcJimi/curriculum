*Ex6_Matrix_Elwise_sr.sas;
*Matrix Elementwise Square Root;
ods graphics off; ods html close; ods listing;
options nodate nonumber;
proc iml;
	M1 = {1 2 3 4 5, 6 7 8 9 10} ;   
	M1_E_sq_root= M1##.5; *Elementwise square root;
	print M1; print M1_E_SQ_ROOT;
quit;

/*
The above data were taken from this web site
https://www.ptcusercommunity.com/thread/33064
*/
