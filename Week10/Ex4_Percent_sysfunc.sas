* Ex4_Percent_sysfunc.sas;
*** %SYSFUNC Function;

data _null_;
  st ='Alabama|Alaska|Vermont|Oregon|Utah';
  words = countw(st, '|');
  put 'Number of ' words=;
run;


%let st = Alabama|Alaska|Vermont|Oregon|Utah;
%let words = %sysfunc(countw(&st, %str(|)) );
%put &=st;
%put Notes: Number of &=words;

data _null_;
	var1= 'NR_C_Checkup';
    var2 = tranwrd(var1, 'C_', 'P_ ');
	put var1= // var2= ;  
run;

*Use %SYSFUNC function to execute the data step function like TRANWRD.

%let mvar1 =NR_C_Checkup;
%let mvar2=%sysfunc(tranwrd(&mvar1,C_, P_));
%put Note: &=mvar1  &=mvar2 ;
%put Note: %sysfunc(cats(&mvar1,*, %sysfunc(tranwrd(&mvar1,C_, P_))));

%put %sysfunc(intnx(month,%sysfunc(today()),1),monname3.);
%put %sysfunc(intnx(month,%sysfunc(today()),-1,s),year.);
%put %sysfunc(intnx(year,%sysfunc(today()),2),year.);


%let x13=%sysfunc(intnx(month,%sysfunc(today()),1));
%let x14=%sysfunc(putn(%eval(&x13-1),year.));
%put &x13 &x14;


%let stat=weight;
%let vars=age sex;
%let xvars=age, sex;
%let yvars="age", "sex";
%let nv=%sysfunc(countw(&vars));
%let xnv=%sysfunc(countw(&xvars),%str(,));
%let ynv=%sysfunc(countw(&yvars),%str(,));
%put &=stat &=vars &=nv 
     &=xvars &=xnv 
     &=yvars &=ynv;


/*
https://communities.sas.com/t5/SAS-Programming/countw-and-double-quoted-string-list/td-p/106084
Author Haikuo - 08/09/2013;
*/

  %let lst= '1234' '3222' '0056';

data _null_;
  j = countw("&lst2");
  put j=;
run;

 %let lst2= "1234" "3222" "0056" "12345" "123456";
 %put &=lst2;
 %put %sysfunc(countw(%sysfunc(quote(&lst2))) );


  %let lst3= '1234', '3222', '0056';
 %put %sysfunc(countw(%sysfunc(quote(&lst3))),%str(,) );


 Data work.Created_%sysfunc(today(),date9.);
  set sashelp.class;
run;


Data work.Created_&sysday
     work.&sysday._Created
     work.Created_By_%sysfunc(left(%SCAN(&sysuserid, 2)));
    set sashelp.class;
run;


*The following is from the SAS Documentation;
proc format;
  value category
  Low-<0  = 'Less Than Zero'
  0       = 'Equal To Zero'
  0<-high = 'Greater Than Zero'
  other   = 'Missing';
run;
%macro try(parm);
  %put &parm is %sysfunc(putn(&parm,category.));
%mend;
%try(1.02)
%try(.)
%try(-.38)


options nodate nonumber;
title1 "%sysfunc(date(),worddate.) Class Report";
proc print data=sashelp.class (obs=3);
run;

/* SAS Docementation 9.4 - Example 1 */

/* %SYSFUNC executes the TRANSLATE function to translate the Ns in a string to Ps.  */

%let string1 = V01N01-V01N10;
%let string1 = %sysfunc(translate(&string1,P, N));
%put With N translated to P, V01N01-V01N10 is &string1;

*** %QSYSCFUNC Function;
%put %sysfunc(left(%qsysfunc(today(), worddate.)));


*SAS Documentation 9.4;
%macro checkds(dsn);
   %if %sysfunc(exist(&dsn)) %then
      %do;
         proc print data=&dsn;
         run;
      %end;
      %else
         %put The data set &dsn does not exist.;
%mend checkds;
%checkds(Sasuser.Houses)

