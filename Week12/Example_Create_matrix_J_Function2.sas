ods graphics off; ods html close; ods listing;
options nodate nonumber;
*Example_Create_matrix_J_Function2.sas;
proc iml;
/*Creating a  matrix with a J function 
 5 X 1 column vector of 1's*/
J_b=j(5,1);      *5 X 1 column vector of 1's;
print J_b;
quit;
