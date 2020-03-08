*** Ex2_Stat6197_Percentage_Weighted_Score.sas;
data Have;
input id $ TEST1-TEST5 ASSIGNMENT1 ASSIGNMENT2  MIDTERM FINAL;
datalines;
A1 90 80 95 90 100 94 89 84 80
A2 60 70 80	100	90	94	89	84	80
A3 75 65 75 55  95 94 89 84 88
;
data have2;
 set have;
     call sortN(test5, test4, test3, test2, test1); 
	 array raw[8] TEST1-TEST4 ASSIGNMENT1 ASSIGNMENT2
               MIDTERM FINAL; 
     array weight[8] _temporary_ (.05, .05, .05, .05 
				                   ,.10,.10,.30,.30);
	 array wp[8]  P_TEST1-P_TEST4 P_ASSIGNMENT1 P_ASSIGNMENT2
               P_MIDTERM P_FINAL; 
     do i = 1 to 8;
       wp[i] = raw[i]*weight[i];
     end;
      wpt=sum(OF P:);
 drop i;
 run;
proc print data=work.have2 noobs; 
var id P_: wpt; 
Format wpt 6.2;
run;
