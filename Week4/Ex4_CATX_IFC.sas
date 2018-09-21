*Ex4_CATX_IFC.sas;
data try ;
input (ID R SAS Python SPSS Stata) ($);
datalines;
ID01 Yes Yes No No No
ID02 No Yes No No Yes
ID03 No Yes Yes No No
ID04 Yes Yes Yes No No
;
proc print noobs ; run;
data try2;
  set try;
  list = CatX(', ', 
               IfC( R = 'Yes' , 'R' , '' ),
               IfC( SAS = 'Yes', 'SAS' , '' ),
               IfC( Python = 'Yes' , 'Python' , '' ),
               IfC( SPSS = 'Yes' , 'SPSS' , ''),
	           IfC( Stata = 'Yes' , 'Stata' , '' ));
run ;
proc print data=try2 noobs; run;


