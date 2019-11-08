

%macro loops(file) ;
     %local xcount i yr;                                             
     %let xcount=%sysfunc(countw(&file, %STR(|))); /* Count the number of data sets*/
      %put &=xcount;
     %do i = 1 %to &xcount; /* Loop through the total # of data sets */   
	     %let yr=%sysfunc(putn(%eval(&i-1),z2.)); /* Generate values from 00 to 15*/ 
     %put &=yr &=i;
%end;
  %mend loops;
%loops(h50|h60|h70|h79|h89|h97|h105|h113|h121|h129|h138|h147|h155|h163|h171|h181)

