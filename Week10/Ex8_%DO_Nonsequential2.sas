*Ex8_%DO_Nonsequential2.sas;
options nosymbolgen;
options symbolgen;
%macro loop(dslist);                                                                                            
     /* Count the # of values in the string */                                                                                                                                   
     %let xcount=%sysfunc(countw(&dslist, %STR(|))); 
     /* Loop through the total # of data sets */                                                                                         
     %do i = 1 %to &xcount; 
        title  "%left(%scan(&dslist,&i,%str(|)))"; 
        proc print data=%scan(&dslist,&i,%str(|))
                 (obs=5) noobs;
	  %end;  
      run;                                                                                                     
%mend loop;                                            
%loop(%str(sashelp.class|sashelp.cars|sashelp.retail))

%let dslist=(%str(sashelp.class|sashelp.cars|sashelp.retail));
%put %left(%scan(&dslist,1,%str(|))); 
