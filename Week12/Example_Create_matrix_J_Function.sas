ods graphics off; ods html close; ods listing;
options nodate nonumber;
*Example_Create_matrix_J_Function.sas;
proc iml;
 obs= {8 4 4 3 6 11};
 n=sum(obs);
 ncol_obs = ncol(obs);
 *constant matrix - J(nrow,ncol,value);
 p=j(1, ncol_obs, 1/ncol_obs);   
 np=n*p;
 print obs, n, ncol_obs, p, np;
quit;

