data a1 a2;
  set sashelp.class;
 run;

 data a3/view=a3;
  set sashelp.class;
 run;
proc contents data=a3; run;
 
 proc datasets lib=work mt=(data view);
 delete a:;
 run;quit;


  data a4/view=a4;
  set sashelp.class;
 run;

 proc datasets lib=work mt=view;
 delete a4;
 run;quit;
