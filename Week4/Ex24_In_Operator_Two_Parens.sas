/*Creating a New Variable Using the In Operator vs. In: Operator*/
*Ex24_In_Operator_Two_Parens.sas;
data work.have;
length diag $ 12;
input icd9code $ @@ ;
if icd9code in ("250", "3572", "3620",
    "648", "36641", "4280") then diag= 'Diabetes';
else if ("29620" <=:icd9code <="29625") |
        ("29630" <=:icd9code <="29635") |
        icd9code in ("2980", "3004", "3091", "311") 
		then diag = 'Depression';
else if icd9code in ("4912", "4932", "496", "5064")
        then diag = 'COPD';
else if icd9code = "493" then diag= 'Ashtma'; 
datalines;
250 3572 3620 648 36641 4280 
29620 29621 29623 29624 29625
29630 29631 29632 29633 29634 29635
2980 3004 3091 311
4912 4932 496 5064 
493
;
proc freq data=work.Have;
 tables diag;
run;

/*Creating an 1/0 Dummy Variable Using the In Operator  and 
  Outer and Inner Parentheses */

*Ex24_In_Operator_Two_Parens.sas;
data work.have;
input icd9code @@ ;
Diag = (icd9code in (250, 3572, 3620, 648, 36641, 4280));
datalines;
250 3572 3620 648 36641 4280 
29620 29621 29623 29624 29625
29630 29631 29632 29633 29634 29635
2980 3004 3091 311
4912 4932 496 5064 
493
;
proc freq data=work.Have;
 tables diag;
run;