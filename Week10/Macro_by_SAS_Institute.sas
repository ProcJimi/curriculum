*** This is a revised version of the macro obtained from 
    http://support.sas.com/kb/45/805.html
    [Sample 45805: List all files within a directory including sub-directories]
    Revisions: Macro calls are wrapped in data steps; 

%macro drive(dir,ext);  
  /* Defime macro variables */ 
  %local filrf rc did memcnt name i;                                                                                                    
                                                                                                                                        
  /* Assigns a fileref to the directory and opens the directory */                                                                      
  %let rc=%sysfunc(filename(filrf,&dir));                                                                                               
  %let did=%sysfunc(dopen(&filrf));                                                                                                     
                                                                                                                                        
  /* Make sure directory can be open */                                                                                                 
  %if &did eq 0 %then %do;                                                                                                              
   %put Directory &dir cannot be open or does not exist;                                                                                
   %return;                                                                                                                             
  %end;                                                                                                                                 
   /* Loops through entire directory */                                                                                                 
   %do i = 1 %to %sysfunc(dnum(&did));                                                                                                  
                                                                                                                                        
     /* Retrieve name of each file */                                                                                                   
     %let name=%qsysfunc(dread(&did,&i));                                                                                               
                                                                                                                                        
     /* Checks to see if the extension matches the parameter value */                                                                   
     /* If condition is true print the full name to the log        */                                                                   
      %if %qupcase(%qscan(&name,-1,.)) = %upcase(&ext) %then %do;                                                                       
        put "&dir\&name";                                                                                                               
      %end;                                                                                                                             
     /* If directory name call macro again */                                                                                           
      %else %if %qscan(&name,2,.) = %then %do;                                                                                          
        %drive(&dir\%unquote(&name),&ext)                                                                                               
      %end;                                                                                                                             
                                                                                                                                        
   %end;                                                                                                                                
                                                                                                                                        
  /* Closes the directory and clear the fileref */                                                                                      
  %let rc=%sysfunc(dclose(&did));                                                                                                       
  %let rc=%sysfunc(filename(filrf));                                                                                                    
%mend drive; 
/*The following is extended by Pradip Muhuri*/ 
 /* Create an Excel Workbook containing 1 sheet */
%macro mexcel (start, stop); 
%DO num = &START %TO &STOP;
ods csv file="C:\SASCourse\Week2\List_SAS_Files.csv" 
         options(sheet_name="Week&num");
		data _null_;                                                                                                                            
 		  file print;                                                                                                                 
         %drive(C:\SASCourse\Week&num,sas)                                                                                                                   
         run;  
ods csv close;
%end;     
%mend mexcel;
%mexcel (2,2)
;
 




