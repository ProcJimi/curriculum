*Ex18_create_matrix_series.sas;
ods graphics off; ods html close; ods listing;
options nodate nonumber;
proc iml;
 /*... arithmetic series with some increment*/
series= do(5,50,10); 
print series;
quit;   
