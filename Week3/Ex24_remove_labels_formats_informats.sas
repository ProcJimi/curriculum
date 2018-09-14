* Ex24_remove_labels_formats_informats.sas;
* sashelp.mdv - Sales Data and Forecast;
proc contents data=sashelp.mdv varnum;
run;

data mdv;
  set sashelp.mdv;
 run;
proc datasets lib=work memtype=data;
   modify mdv;
     attrib _all_ label=' ';
     attrib _all_ format=;
	 attrib _all_ informat=;
   contents data=work.mdv;
   run;
quit;
