*Ex15_Week_1_List_of_Files.sas;
PROC IML;
SUBMIT / R;
setwd ("C:/SASCourse/Week1")
list.files(pattern="SAS", 
           full.names = TRUE, 
           ignore.case = TRUE)
ENDSUBMIT;
QUIT;

