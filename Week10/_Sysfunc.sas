
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
