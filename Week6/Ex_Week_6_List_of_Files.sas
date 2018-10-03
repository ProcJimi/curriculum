*** Ex_Week_6_List_of_Files.sas;
PROC IML;
SUBMIT / R;
setwd ("C:/SASCourse/Week6")
list.files(pattern="SAS", full.names = TRUE, ignore.case = TRUE) 
ENDSUBMIT;
QUIT;

