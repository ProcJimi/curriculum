*Ex34_Temporary_Array.sas;
/*Loop-Do-Loop Around Arrays Wendi L. Wright*/
data temp;
 item1 = 'A';
 item2='C';
 item3 ='A';
 item4 = 'B';
 item5 = 'A';

Array Raw {*} item1-item5;
Array Key {5} $ _temporary_ ('B' 'C' 'A' 'B' 'D');
Array Score {5} ;
Do i = 1 to 5;
if raw{i} eq key{i} then score{i}=1;
 else score{i}=0;
End;
TotalCorrect = sum( of score1-score5 ); 
run;
proc print data=temp; run;
