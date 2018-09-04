*Ex20_Import_Excel_x.sas;
* Method 1: Importing an Excel Spreadsheet into a SAS data set;
 options nodate nonumber nodate;
  PROC IMPORT DATAFILE= "C:\SASCourse\Week2\class.xlsx"
     dbms=xlsx REPLACE OUT= work.class_x;
     SHEET="Sheet1";
     GETNAMES=YES;
 RUN;
Title;
 proc print data=work.class_x; 
 run;

/* Method 2: The LIBNAME statement references the whole Excel file, 
 which is viewed as a SAS library and, the members inside 
 (spreadsheet or named range) are viewed as data files.
 The SET statement uses the Excel sheet as an input data file 
 for this data step */

options validvarname=any;
libname XL XLSX 'C:\SASCourse\Week2\class.xlsx';
data work.class;
  set XL.Sheet1;
run;
libname XL CLEAR; 

