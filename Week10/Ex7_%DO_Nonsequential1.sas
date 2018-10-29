*Ex7_%DO_Nonsequential1.sas;
options nonumber nocenter nodate symbolgen;
%LET list = %str(sashelp.class| 
                 sashelp.cars| 
                 sashelp.retail);
/* Count # of values in the string */
%LET count=%sysfunc(countw(&list, %STR(|))); 
%macro loop;
 /* Loop through the total # of data sets */ 
 %do i = 1 %to &count;
   *title  "%left(%SCAN(&list, &i, %STR(|)))";
   proc print data=%scan(&list,&i, %str(|)) 
             (obs=5) noobs;  
	run;
 %end;
%mend loop;
%loop



