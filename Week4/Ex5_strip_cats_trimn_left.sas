*Example_strip_cats_trimn_left.sas;
*SAS Code Adapted from SAS Documentation;
data work.HAVE1;
   input string $char20.;
   original = '*' || string || '*';
   stripped = '*' || strip(string) || '*';
   cats_ed = '*' || cats(string) || '*';
   timn_left_ed = '*' || trimn(left(string)) || '*';

   datalines;
Statistics
  Statistics
    Statistics
Statistics
 Stat 4197
;
proc print data=work.HAVE1 noobs; 
run;

*The Use of CATS and STRIP functions;
data work.HAVE2;
   INFILE datalines DLM=',';
   INPUT state_name  : $ 22. dayOfweek : $ 10. 
         Monthday : $15. year ;
         date_entry=catx(',  ', (dayofweek),
		                       (monthday),
                               (year)
                          );
   DATALINES;
     Delaware, Friday,  December 7, 1787
     Pennsylvania, Wednesday,  December 12, 1787
     New Jersey, Tuesday,  December 18, 1787
     South Carolina, Friday,  May 23, 1788
;
proc print data=work.HAVE2 noobs; 
run;


