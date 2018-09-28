
*Ex10_creating_folders.sas;

*Creating folders using DATA step Code;
%LET RootPath=C:\; 
Data _Null_;
SubDIR='TeachingSAS';
FolderName=DCREATE(SubDIR,"&RootPath");
Put FolderName=;
Run;



*** Creating folders using %LET and %SYSFUNC functions;
%LET RootPath=C:\MEPS; 
%LET Folder1=%SYSFUNC(DCREATE(Zip_Files,&RootPath)); 
%LET Folder2=%SYSFUNC(DCREATE(SSP_Files,&RootPath));
%PUT &=Folder1 &=Folder2;
