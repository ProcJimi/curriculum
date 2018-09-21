*Ex13_length_lengthc.sas;
data HAVE;
blank= ' ';
lengthc_of_dot=LENGTHC(dot);
length_of_dot=LENGTH(dot);

dot=.;
lengthc_of_blank=LENGTHC(blank);
length_of_blank=LENGTH(blank);
run;

proc contents data=have varnum;
ods select variables;
run;
proc print data=have;
run;

