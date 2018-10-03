*Ex8B_Collapse_multi_records.sas;
data have;
 input id type value count;
 cards;
 1 1 32 2
 1 1 10 7
 1 2 20 10
 1 2 59 2
 1 3 54 1
 1 3 82 4
 1 4 68 2
 1 5 56 0
 2 1 52 8
 2 5 64 9
 2 3 76 6
 2 4 98 8
 2 2 39 9
 2 4 96 5
 3 1 58 2
 3 2 63 6
 3 4 72 3
 3 5 99 4
 3 3 37 1
 3 1 66 0
 ;
 ;run;quit;
proc print noobs; run;
 proc summary data=have nway missing;
   class id type;
   var value count;
   output out=sums(drop=_:) sum=;
 proc print data=sums noobs; run;

 proc transpose data=sums out=trans
   prefix=type_;
   by id;
   id type;
 proc print data=trans noobs; run;

 data want;
   set trans(where=(_name_='count'));
   count=sum(of type_:);
   set trans(where=(_name_='value'));
   drop _name_;
 proc print data=want noobs; run;
