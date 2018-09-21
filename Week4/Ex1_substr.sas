*Example_substr.sas;
data _Null_;
   var1 = 'Geology';
   new_var1 = SUBSTR(var1,1,3);
   new_var2=var1;
   SUBSTR(new_var2,1,3)='Zoo';
putlog (_ALL_) (=// +2);
 run;

