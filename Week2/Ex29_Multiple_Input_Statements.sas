*Ex29_Multiple_Input_Statements.sas;
data work.HAVE(drop=i);
 input date: Anydtdte9. @;
 do i = 1 to 4;
 input name $ study_hours @;
 output;
 end;
datalines;
27Aug2018 Doris 5.5 Alice 4.0 Mike 2.0 James 1.0
28Jun2018 Doris 3.0 Alice 3.0 Mike 3.0 James 1.0
;
proc print data=work.HAVE;
Format date worddate.;
run;

