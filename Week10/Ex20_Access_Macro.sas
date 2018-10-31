*Ex20_Access_Macro.sas;
libname Mylib 'C:\SASCourse\Compiled_Macros';
options mstored sasmstore=Mylib
 FORMCHAR="|----|+|---+=|-/\<>*";
ods csv file="C:\SASCourse\Week10\List_SAS_Files_x.csv" 
%macro mexcel (start, stop); 
%DO num = &START %TO &STOP;
        ods excel  options(sheet_name="Week&num");
		data _null_;                                                                                                                            
 		  file print;                                                                                                                 
         %drive(C:\SASCourse\Week&num,sas)                                                                                                                   
         run;  
ods csv close;
%end;     
%mend mexcel;
/* Create an Excel Workbook listing .SAS files 
   from Week7 and Week8 folders*/
%mexcel (7,8)
