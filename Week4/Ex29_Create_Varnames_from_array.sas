
data have;
 array var[10] (10*5);
 do i=1 to 10;
   output;
 end;
 drop i;
run;
proc print data=have; run;
