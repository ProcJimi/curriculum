*Ex7_indirect_reference_1.sas;
Options symbolgen;
%LET disease1=cvd; 
%LET disease2=cancer;
%LET disease3=stroke;
%LET disease4=hbp;
%LET disease5=diabetes;
%LET last_element=5;
%macro ref;
   %DO i = 1 %TO &last_element;
     %put  &&disease&i; 
   %END; 
%mend ref;
%ref




