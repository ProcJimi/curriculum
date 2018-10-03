*Ex15_Update_modify.sas;
DATA master;
INFILE DATALINES DLM=',';
INPUT Id item & $25.  sub_6_inch footlong;
DATALINES;
1,Cold Cut Combo,	 3.50,	 5.00
2,Pizza Sub,	 	 3.50,	 5.00
3,Spicy Italian,	 3.50,	 5.00
4,Veggie Delite,	 3.50,	 5.00
5,Turkey Breast,	 4.00,	 6.00
6,Tuna,	             4.00,	 6.00
7,Veggie Patty,	     4.00,	 6.00
8,Subway Club,	     4.50,	 7.00
9,Subway Melt,	     4.50,	 7.00
10,Steak & Cheese,	 4.50,	 7.25
11,Roast Beef,	     4.50,	 7.25
;
Proc print data=master noobs; run;
DATA Transact;
INFILE DATALINES DLM=',';
INPUT Id item & $25.  sub_6_inch footlong;
DATALINES;
9,Subway Melt,	     5.50,	 8.00
10,Steak & Cheese,	 5.50,	 9.25
11,Roast Beef,	     5.50,	 8.25
;
Proc print data=Transact noobs; run;
PROC SORT DATA=master; 
  BY id; 
run;
PROC SORT DATA=Transact; 
  BY id; 
run;
DATA updated; 
 UPDATE master Transact; BY id;
run;
PROC PRINT DATA=updated noobs; 
run;

DATA master_x; 
 SET master;
run;
DATA master_x; 
 MODIFY master_x Transact; 
BY id;
run;
PROC PRINT DATA=Master_x noobs; 
run;

