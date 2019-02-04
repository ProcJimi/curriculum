*Ex11C_put_input_function.sas;
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

 data have3;
  do mon_day_yr =11318, 121018, 122418;
      mon_day_yr_SAS=input(put(mon_day_yr,6.),mmddyy6.);
	  format mon_day_yr_SAS date9.;
    output;
  end;
 run;
 proc print data=have3 noobs; run;
 proc contents data=have3; run;

data have4;
  do stored_sas_date_value =11318, 121018, 122418;
      format stored_sas_date_value date9.;
    output;
  end;
 run;
 proc print data=have4 noobs; run;
 proc contents data=have4; run;
