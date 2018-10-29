*Ex14_VList_HList.sas;
* Vertical List;
options nodate nonumber symbolgen;
title;
%macro VList;
%let ds1 = class;
%let ds2 = revhub2;
%let ds3 = iris;
%let dscount = 3;
%do j = 1 %to &dscount;
  title1 "Macro Vertical List";
  title2 "%sysfunc(upcase(sashelp.&&ds&j))";
  proc print data=sashelp.&&ds&j (obs=5) noobs;
  run;
%end;
%mend VList;
%VList


* Horizontal List;
options nodate nonumber symbolgen;
%macro HList;
  %local dslist j;
  %let dslist = class revhub2 iris;
  %do j =1 %to %sysfunc(countw(&dslist));
	 title1 "Macro Horizontal List";
     title2 "%sysfunc(upcase(sashelp)).
            %qscan(%sysfunc(upcase(&dslist,&j)))";
	 proc print data= sashelp.%scan(&dslist, &j)
             (obs=5) noobs;
	 run;
  %end;
%mend HList;
%HList
