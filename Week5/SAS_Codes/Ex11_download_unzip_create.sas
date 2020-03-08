*Ex11_download_unzip_create.sas;
*** Task 1: Download a particular ZIP SAS transport file from the MEPS web site;

Filename GoThere "C:\Data\h173ssp.zip";
proc http 
   url="https://meps.ahrq.gov/data_files/pufs/h173ssp.zip" 
   out=GoThere;
run;


*** Task 2: Unzip the SAS transport data file into the work folder;
filename inzip zip "c:\Data\h173ssp.zip" ;
filename sit "C:\Users\pmuhuri\downloads\h173.ssp" ;
data _null_;
infile inzip(h173.ssp) lrecl=256 recfm=F length=length eof=eof unbuf;
file sit lrecl=256 recfm=N;
input;
put _infile_ $varying256. length;
return;
eof: stop;
run;

*** Task 3: Create a SAS data set from the SAS transport file;

libname test xport "C:\Users\pmuhuri\downloads\h173.ssp";
libname myfolder "C:\Data";
proc copy in=test out=Myfolder;
run;

proc contents data=myfolder.h173; 
ods select variables;
run;

proc means data=myfolder.h173; 
run;

