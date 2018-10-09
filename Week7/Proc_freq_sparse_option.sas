*Inspired by Reeza at stackoverflow.com - Mar 3, 2015;
data have;
input group1 group2 $;
cards;
1 A
1 A
1 A
1 A
2 A
2 B
2 B
;
run;

proc freq data=have;
table group1*group2/out=want sparse;
run;

proc print data=want;
run;


data ref;
  do group1 = 1 to 3;
    group2 = 'A';
    output;
    group2 = 'B';
    output;
  end;
run;

* Inspired by user667489 at stackoverflow.com - 3/3/2015;

data ref;
  do group1 = 1 to 3;
    group2 = 'A';
    output;
    group2 = 'B';
    output;
  end;
run;
proc print data=ref; run;
data have;
input group1 group2 $1.;
cards;
1 A
1 A
1 A
1 A
2 A
2 B
2 B
;
run;

proc summary nway data = have classdata=ref;
    class group1 group2;
    output out = summary (drop = _TYPE_);
run;
proc print data=summary; run;


proc format;
value groupformat
    1='Group 1'
    2='Group 2'
    3='Group 3'
    ;
quit;
* By Joe;
proc format;
value groupformat
    1='Group 1'
    2='Group 2'
    3='Group 3'
    ;
run;
data have;
input group1 group2 $;
cards;
1 A
1 A
1 A
1 A
2 A
2 B
2 B
;
run;

proc tabulate data=have;
  class group1 group2/preloadfmt;
  format group1 groupformat.;
  tables group1*group2,n/printmiss misstext='0';
run;

*Inspired DWal 
data ref;
  do group1 = 1 to 3;
    group2 = 'A';
    output;
    group2 = 'B';
    output;
  end;
run;
proc sql;
select
  r.group1,
  r.group2,
  count(h.group1) as freq
from
  have h
  right join ref r
  on h.group1 = r.group1
  and h.group2 = r.group2
group by
  r.group1,
  r.group2
order by
  r.group1,
  r.group2
;
quit;
