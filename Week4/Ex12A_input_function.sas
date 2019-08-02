*Ex12A_input_function.sas;
options nocenter nodate nonumber;
data input_function_data;
  c_id = '12345678'; 
  n_id =input(c_id, 8.); 
  c_amount = '$23,500'; 
  n_amount = input(c_amount, dollar7.);
  c_amount_x = '9999';
  n_amount_x = input(c_amount_x, 5.2);
  c_date = '13Sep1963'; 
  n_date = input(c_date, date9.);
putlog (_ALL_) ( =/ +2);   
title1 'Ex12A_input_function.sas';
proc contents data=input_function_data varnum; 
ods select position;
run;


