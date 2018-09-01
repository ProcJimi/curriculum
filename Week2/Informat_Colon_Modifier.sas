
   /*http://support.sas.com/documentation/cdl/en/lrdict/64316/HTML/default/viewer.htm#a000178244.htm */

   data name;
   informat FirstName LastName $15. n1 6.2 n2 7.3;
   input firstname lastname n1 n2;
   datalines;
Alexander Robinson 35 11
;

proc contents data=name;
run;

  data name;
    input firstname:$15. lastname:$15. n1:6.2  n2:7.3;
   datalines;
Alexander Robinson 35 11
;

proc contents data=name;
run;
