* Example_index_find.sas;
* Contributed by Nat Wooding and data_null at SAS-L;
* Adapted below;
 Data Titles;
input @1 Title $22.;
datalines;
heart failure 
early heart failure
failure of the heart
;
data Have;
	set titles;	
	if index(UPCASE(Title), "HEART FAILURE") gt 0 then HF = 1; 
       else HF =0;
	HF1 = ( INDEX(UPCASE(Title), "HEART FAILURE") gt 0 ) ;
	* one-lineR code;
	HF2 = find(title,'heart failure','I') gt 0; 
run;
proc print data=Have noobs; run;

