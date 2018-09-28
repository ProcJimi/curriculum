
*Ex11_download_unzip_create.sas;

*** Task 1: Download a particular ZIP SAS transport file from the MEPS web site;

Filename GoThere "C:\MEPS\Zip_Files\h181ssp.zip";
proc http 
   url="https://meps.ahrq.gov/data_files/pufs/h181ssp.zip" 
   out=GoThere;
run;

*** Task 2:  Read the "members" (files) from the ZIP file;
filename inzip2 ZIP "C:\MEPS\Zip_Files\h181ssp.zip";
data contents(keep=memname isFolder);
 length memname $200 isFolder 8;
 fid=dopen("inzip2");
 if fid=0 then
  stop;
 memcount=dnum(fid);
 do i=1 to memcount;
  memname=dread(fid,i);
  /* check for trailing / in folder name */
  isFolder = (first(reverse(trim(memname)))='/');
  output;
 end;
 rc=dclose(fid);
 call symputx('memname', memname);
run;
%put &=memname;
proc print data=contents noobs N;
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
LIBNAME sasdata 'C:\MEPS';
FILENAME in1 "%sysfunc(getoption(work))/&memname";;
proc xcopy in = in1 out = sasdata IMPORT;
run;
%put %sysfunc(pathname(work));

