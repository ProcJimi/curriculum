
/* http://support.sas.com/kb/60/678.html */
data Ex1;
   infile datalines missover;
   input id:1. a:$1.;
   datalines; 
   1 b
   2 c
   3  
   4 a
   ;
proc contents data=Ex1;
   run;
