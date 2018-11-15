*Ex17_Create_identity_matrix.sas;
ods graphics off; ods html close; ods listing;
options nodate nonumber;
proc iml;
    I_mat=I(5);   *5x5 identity matrix;
	print i_mat;
quit;
