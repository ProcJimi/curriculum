
* Retrive the folder names;

%put %sysfunc(pathname(sashelp));
%put %sysfunc(pathname(sasuser));
%put %sysfunc(pathname(work));

/*
SASHELP - permanent library that contains sample data and 
          other files at your site. This is a read-only
          library.
SASUSER - permanent library that contains SAS files in
          the Profile catalog that stores your personal
          settings. This is also a convenient place to
          store your own files.
WORK    - a temporary library for files that do not need to
          be saved from session to session.
Source: SAS Certification Prep Guide, Base Programming
        for SAS(R)9 Third Edition (page 31). 

*/
