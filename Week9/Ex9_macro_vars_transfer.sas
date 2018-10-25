*Ex9_macro_vars_transfer.sas; 
options nodate nonumber ps=58;
proc sql noprint;
 select avg(weight) format=6.2 
    into :m_avg_wt 
    from sashelp.class;
 quit; 
%put &m_avg_wt ;
data class;
  set sashelp.class;
  ratio_wt=weight/&m_avg_wt;
run;
title "Class Data: Average Weight &m_avg_wt lbs";
proc print data=class noobs; 
 var name weight ratio_wt;
 run;

data class2;
 retain avg_wt1 &m_avg_wt 
        avg_wt2 "&m_avg_wt" ;
        avg_wt3= SYMGETN("m_avg_wt");
        avg_wt4= RESOLVE('&m_avg_wt');
run;
title;
proc print data=class2; run;
proc contents data=class2; run;

