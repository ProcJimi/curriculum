*** Ex10_List_File_Names.sas;
* List file names from a folder - Variant 2;
PROC IML;
SUBMIT / R;
setwd ("C:/SASCourse/Week5")
list.files(pattern="SAS", full.names = TRUE, ignore.case = TRUE) 
ENDSUBMIT;
QUIT;



