*Ex16_put_function.sas;

proc format;
 value $stypeF  U='Undergraduate'  G='Graduate' ;
run;  
data put_function_data;
c_stype1 ='U';  
c_stype2 = put(c_stype1, $stypeF.);
n_id = 12345678; 
c_id =put(n_id, 8.);
n_amount = 23500; 
c_amount = put(n_amount, dollar7.);
n_date = 1357;    
c_date = put(1357, Weekdate.);
FORMAT n_date Weekdate.  n_amount dollar7.; 
putlog (_ALL_) (=/ +2);
proc contents data=put_function_data varnum; 
run;


