Filename ZIPFILE SASZIPAM "c:\SASCourse\Week9\names.zip";
DATA mylib.DSN2000;
INFILE ZIPFILE(yob2000.txt) DLM=',';
INPUT name $ gender $ number;
RUN;
title "Listing from Data Set (Newborns' Names) for 2000";
proc print data=mylib.DSN2000(obs=5) noobs;
format number comma7.;
run;
DATA mylib.DSN2001;
INFILE ZIPFILE(yob2001.txt) DLM=',';
INPUT name $ gender $ number;
RUN;
title "Listing from Data Set (Newborns' Names) for 2001";
proc print data=mylib.DSN2001(obs=5) noobs;
format number comma7.;
run;
DATA mylib.DSN2002;
INFILE ZIPFILE(yob2002.txt) DLM=',';
INPUT name $ gender $ number;
RUN;
title "Listing from Data Set (Newborns' Names) for 2002";
proc print data=mylib.DSN2002(obs=5) noobs;
format number comma7.;
run;
DATA mylib.DSN2003;
INFILE ZIPFILE(yob2003.txt) DLM=',';
INPUT name $ gender $ number;
RUN;
title "Listing from Data Set (Newborns' Names) for 2003";
proc print data=mylib.DSN2003(obs=5) noobs;
format number comma7.;
run;
DATA mylib.DSN2004;
INFILE ZIPFILE(yob2004.txt) DLM=',';
INPUT name $ gender $ number;
RUN;
title "Listing from Data Set (Newborns' Names) for 2004";
proc print data=mylib.DSN2004(obs=5) noobs;
format number comma7.;
run;
DATA mylib.DSN2005;
INFILE ZIPFILE(yob2005.txt) DLM=',';
INPUT name $ gender $ number;
RUN;
title "Listing from Data Set (Newborns' Names) for 2005";
proc print data=mylib.DSN2005(obs=5) noobs;
format number comma7.;
run;
Filename ZIPFILE SASZIPAM "c:\SASCourse\Week9\names.zip";
DATA mylib.DSN2000;
INFILE ZIPFILE(yob2000.txt) DLM=',';
INPUT name $ gender $ number;
RUN;
title "Listing from Data Set (Newborns' Names) for 2000";
proc print data=mylib.DSN2000(obs=5) noobs;
format number comma7.;
run;
DATA mylib.DSN2001;
INFILE ZIPFILE(yob2001.txt) DLM=',';
INPUT name $ gender $ number;
RUN;
title "Listing from Data Set (Newborns' Names) for 2001";
proc print data=mylib.DSN2001(obs=5) noobs;
format number comma7.;
run;
DATA mylib.DSN2002;
INFILE ZIPFILE(yob2002.txt) DLM=',';
INPUT name $ gender $ number;
RUN;
title "Listing from Data Set (Newborns' Names) for 2002";
proc print data=mylib.DSN2002(obs=5) noobs;
format number comma7.;
run;
DATA mylib.DSN2003;
INFILE ZIPFILE(yob2003.txt) DLM=',';
INPUT name $ gender $ number;
RUN;
title "Listing from Data Set (Newborns' Names) for 2003";
proc print data=mylib.DSN2003(obs=5) noobs;
format number comma7.;
run;
DATA mylib.DSN2004;
INFILE ZIPFILE(yob2004.txt) DLM=',';
INPUT name $ gender $ number;
RUN;
title "Listing from Data Set (Newborns' Names) for 2004";
proc print data=mylib.DSN2004(obs=5) noobs;
format number comma7.;
run;
DATA mylib.DSN2005;
INFILE ZIPFILE(yob2005.txt) DLM=',';
INPUT name $ gender $ number;
RUN;
title "Listing from Data Set (Newborns' Names) for 2005";
proc print data=mylib.DSN2005(obs=5) noobs;
format number comma7.;
run;
