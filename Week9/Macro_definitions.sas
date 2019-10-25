*Macro_definitions.sas;
Options nocenter nodate nonumber symbolgen;
%Let Path = c:\SASCourse\Week9;
Libname mylib "&Path";
%macro readraw (first=, last=);
	Filename ZIPFILE SASZIPAM "&Path\names.zip";
	%do year=&first %to &last;
		DATA mylib.DSN&Year;
 		  INFILE ZIPFILE(yob&year..txt) DLM=',';
  		  INPUT name $ gender $ number;
	    RUN;
		title " Listing from Data Set (Baby Names)";
	    proc print data=mylib.DSN&Year(obs=5) noobs split='*'; 
		label name = "Newborn's*Name" number ='Name Count';
		format number comma7.;
        run;
		title;
    %end ;
%mend readraw;

