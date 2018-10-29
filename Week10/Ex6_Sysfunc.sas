*Ex6_sysfunc.sas;
/* http://www2.sas.com/proceedings/sugi23/Advtutor/p49.pdf*/
/* Adapted from Carpenter's paper 
Advanced Macro Topics: Utilities and Examples*/
%macro exist(dsn);
%global exist;
%if %sysfunc(exist(&dsn)) %then
 %let exist=YES;
%else %let exist=NO; 
%mend exist; 
%exist(sashelp.cars)

Example _SAS-L.sas;
data _Null_; x1=today(); x2=intnx('year',x1,-2,'s');
format x1 x2 date9.; PUT @4  x1= x2=; run;

%let x1=%sysfunc(today(),date9.);
%let x2=%sysfunc(intnx(year,%sysfunc(today()),-2,s),date9.);
%put &x1 &x2;

%let x3=%sysfunc(today());
%let x4=%sysfunc(intnx(year,%sysfunc(today()),-2,s));
%put &x3 &x4;

%let x5 = '27jan2016'd;  
%let x6 = '27dec2014'd; 
%put &x5 &x6 ;

%let x7=%sysfunc(today(),monname3.);
%let x8=%sysfunc(intnx(month,%sysfunc(today()),1),monname3.);
%put &x7 &x8 ;

%let x9=%sysfunc(today(),year.);
%let x10=%sysfunc(intnx(month,%sysfunc(today()),-1,s),year.);
%put &x9 &x10;

%let x11=%sysfunc(intnx(year,%sysfunc(today()),-1),year.);
%let x12=%sysfunc(intnx(year,%sysfunc(today()),2),year.);
%put &x11 &x12;

%let x13=%sysfunc(intnx(month,%sysfunc(today()),1));
%let x14=%sysfunc(putn(%eval(&x13-1),year.));
%put &x13 &x14;

%let x15=%sysfunc(intnx(month,'01dec2015'd,1));
%let x16=%sysfunc(putn(%eval(&x15-1),year.));
%let x17=%sysfunc(putn(&x15,monname3.));
%put &x15 &x16 &x17;

Title "Date Geneated on %sysfunc(left(%qsysfunc(today(), worddate.)))";






