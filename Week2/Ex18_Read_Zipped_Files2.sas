*Ex18_Read_Zipped_File2.sas;
Filename ZIPFILE SASZIPAM 'c:\SASCourse\Week2\names.zip';
DATA newdata;
  INFILE ZIPFILE(yob1920.txt) DLM=',';
  INPUT gender $ name $ number;
RUN;
proc print data=newdata (obs=5); run;


