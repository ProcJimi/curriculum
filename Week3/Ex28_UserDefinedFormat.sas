*Ex28_UserDefinedFormat.sas;
/*SAS-L 11/9/2018
Ian Whitlock flatfile program*/
data class;
  format
      Name    $7.
      Sex     $1.
      Age     3.
      Height  5.1
      Weight  5.1
  ;
  set sashelp.class;
run;quit;
proc print data=class; run;
