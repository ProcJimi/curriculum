*Ex18_Macro_Include.sas;
options symbolgen;
*'Macro_List_Files.txt' includes a Macro authored by SAS(R) Institute;
%include 'c:\SASCourse\Week9\Macro_List_Files.txt';
ods Excel file="C:\SASCourse\Week9\List_SAS_Files.xlsx" ;
%macro mexcel (start, stop); 
%DO num = &START %TO &STOP;
      ods excel options(sheet_name="Week&num");
		data _null_;                                                                                                                            
 		  file print;                                                                                                                 
         %drive(C:\SASCourse\Week&num,sas)                                                                                                                   
         run;  
%end; 
ods Excel close; 
%mend mexcel;
/* Create an Excel Workbook with 2 sheets, each listing  
   .SAS files from Week9 and Week10 folders, respectively*/
%mexcel (9,10)
