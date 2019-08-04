*Ex11_download_unzip_create.sas;
*** Task 1: Download a particular ZIP SAS transport file from the MEPS web site;

Filename GoThere "C:\Data\h181ssp.zip";
proc http 
   url="https://meps.ahrq.gov/data_files/pufs/h181ssp.zip" 
   out=GoThere;
run;



*** Task 3: Unzip the SAS transport data file into the work folder;
filename sit "%sysfunc(getoption(work))/&memname";
data _null_;
 infile inzip2(&memname.) lrecl=256 recfm=F length=length eof=eof unbuf;
 file sit lrecl=256 recfm=N;
 input;
 put _infile_ $varying256. length;
 return;
 eof:
  stop;
run;

*** Task 4: Create a SAS data set from the SAS transport file;
LIBNAME sasdata 'C:\Data';
FILENAME in1 "%sysfunc(getoption(work))/&memname";;
proc xcopy in = in1 out = sasdata IMPORT;
run;
%put %sysfunc(pathname(work));

