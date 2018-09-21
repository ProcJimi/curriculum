*Ex27_Do_Loops_Different_Flavors.sas;
* Assess the Effect of having no OUTPUT statement before the END statement;
data have1;
 do i=1 to 5;
 end;
run;
proc print data=have1;
run;

* Assess the Effect of having  an OUTPUT statement before the END statement;
data have2;
 do i=1 to 5;
 output;
end;
run;

* Assess the Effect of having an nested do loop in existing data table;
data class;
 set sashelp.class;
 do j=1 to 2;
  some_date=put('30Jan2018'd+ j, date9.);
  output;
 end;
run;
proc print data=class;
run;
