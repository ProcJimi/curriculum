*Ex18_Macro_Include.sas;
options symbolgen;
%include 'c:\SASCourse\Week10\Macro_List_Files.txt';
ods csv file="C:\SASCourse\Week10\List_SAS_Files.csv" ;
%macro mexcel (start, stop); 
%DO num = &START %TO &STOP;
      ods excel options(sheet_name="Week&num");
		data _null_;                                                                                                                            
 		  file print;                                                                                                                 
         %drive(C:\SASCourse\Week%superq(num),sas)                                                                                                                   
         run;  
ods csv close;
%end;     
%mend mexcel;
/* Create an Excel Workbook containing 2 sheets - 
   listing .SAS files from Week9 and Week10 folders*/
%mexcel (9,10)
