*Ex25_date_group.sas;
/* Simulate male and female expense data for 200 days
  between Jan 1-Dec 31, 2016
 */ 
data work.Have (drop=rownum date_a date_b);
call streaminit(123);
  date_a="01JAN2016"d;
  date_b="31DEC2016"d;
  
  do rownum = 1 to 100;
    do gender = 1 to 2; 
   	Date_p=date_a + floorz((date_b-date_a) * rand("uniform"));
    expense = floorz(1000*rand("Uniform"));
	format date_p date9.;
    output;
  end;
 end;
run;
/* Adapted from Pete Lund (2011) */
/* Create format for overlapping date ranges
   (e.g., year-to-date quarter-to-date and 
    month-to-date).
  In VALUE statement with the PROC FORMAT,  
  the multilabel option maps values to more 
  than one label.

The NOTSORTED option is used on the VALUE statement 
to maintain the desired order.
*/
proc format;
value MultiDates (notsorted multilabel)
'1jan2016'd - '31Dec2016'd = 'YTD'  
'1jul2016'd - '19sep2016'd = 'QTD'   
'1sep2016'd - '19sep2016'd = 'MTD'; 

 value gender_fmt 1 = 'Male'
                  2 = 'Female';
run;

/* Calculate expenses for overlapping date ranges.
"The MLF option is used in the reporting procedure to 
allow for processing of formats with multiple labels. 
When we want to use this format in a procedure we need to 
specify the appropriate options for both the 
MULTILABEL and NOTSORTED options." - 
Using SAS® Formats:  So Much More than “M” = “Male” 
Pete Lund - 2011 SAS Global Forum 
Pete Lund
*/
proc tabulate data=work.Have; 
  class date_p gender / mlf preloadfmt order=data;
  var expense;
  format date_p MultiDates.;
tables (gender all),
    date_p*expense*sum*f=dollar10.;
	format gender gender_fmt.;
run; 


