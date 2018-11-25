*Example_put_input_function.sas;
 data have1;
  do i=1 to 5;
    Num_in_words=put(i,words12.);
    output;
  end;
 run;
 proc print data=have1 noobs; run;

 data have2;
  do chars='1112.80', '112.81', '2.83', '0.84';
    Char_to_num = input(chars,F5.2);
	Char_to_num_char=put(input(chars,F5.2), dollar9.2);
    output;
  end;
 run;
 proc print data=have2 noobs; run;
 proc contents data=have2; run;

* Date Program 1;
data work.have;
input date_time_ch $18.;  
date_nu = input(substr(date_time_ch,1,9),date9.);
date_nu2 = input(scan(date_time_ch,1,':'),date9.);
format date_nu date_nu2 date9.;
datalines4;
01Jul2016:15:30:55
;;;;
proc print data=work.Have noobs;
run;

* Date Program 2;
data _Null_;
date_time='20DEC2017:00:00:00'DT;
date2=datepart(date_time);
format date2 date9.;
put @10 date_time=datetime21. +1 date2 date9.;
run;

* Date Program 3;

data have;
  date_num=20180704; /*Calendar date as a numeric variable*/
  date_var1=input(put(date_num,best8.),yymmdd8.);

  date_char='20180704'; /*Calendar date as a character variable*/
  date_var2=input(date_char,yymmdd8.);

  format date_var: date9.;
run;
proc print data=have; run;
proc contents data=have; run;

