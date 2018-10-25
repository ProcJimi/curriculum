
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
  j = countw("&lst");
  put j=;
run;

 %let lst2= "1234" "3222" "0056" "12345" "123456";
 %put &=lst2;
 %put %sysfunc(countw(%sysfunc(quote(&lst2))) );


  %let lst3= '1234', '3222', '0056';
 %put %sysfunc(countw(%sysfunc(quote(&lst3))),%str(,) );



data _null_;
  j = countw("&lst2");
  put j=;
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

