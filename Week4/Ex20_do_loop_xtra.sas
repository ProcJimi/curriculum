*Ex20_do_loop_xtra.sas;
data training;
miles=30;
do weeks = 1 to 6;
  miles+miles*0.04;
end;
run;
title1 'Training 1'; 
title2 'Implicit OUTPUT statement before the RUN statement';
proc print data=training noobs;
run;

data training2;
miles=30;
do weeks = 1 to 6;
  miles+miles*0.04;
end;
output;
run;
title1 'Training 2'; 
title2 'Explicit OUTPUT statement before the RUN statement';
proc print data=training2 noobs;
run;

data training3;
miles=30;
do weeks = 1 to 6;
  miles+miles*0.04;
  output;
end;
run;
title1 'Training 3'; 
title2 'OUTPUT statement before the END statement';
proc print data=training3 noobs;
run;

data training4;
miles=30;
do weeks = 1 to 6;
  miles+miles*0.04;
  if weeks =6 then output;
end;
run;
title1 'Training 4'; 
title2 'IF THEN OUTPUT statement before the END statement';
proc print data=training4 noobs;
run;

