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

