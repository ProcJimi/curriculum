*Ex3_P_Superq.sas;
data _Null_;
Call symputx('xmvar1', 'AT&T % of Employees Aged 25-49');
run;
%let xmvar2=%superq(xmvar1);
%put &=xmvar2;
