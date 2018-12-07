*** Ex2_Percentage_Weighted_Score.sas (Stat4197);
data Have;
input id $ TEST1-TEST5 ASSIGNMENT1 MIDTERM FINAL;
datalines;
X1 80 70 90 100 100 99 80 82
;
data have2;
 set have;
     call sortN(test5, test4, test3, test2, test1); 
	 array raw[7] TEST1-TEST4 ASSIGNMENT1  MIDTERM FINAL; 
     array weight[7] _temporary_ (.05, .05, .05, .05 
				                   ,.10,.35,.35);
	 array wp[7]  P_TEST1-P_TEST4 P_ASSIGNMENT1 
               P_MIDTERM P_FINAL; 
     do i = 1 to 7;
       wp[i] = raw[i]*weight[i];
     end;
      wpt=sum(OF P:);
 drop i;
 run;
proc print data=work.have2 noobs; 
var id P_: wpt; 
Format wpt 5.0;
run;
