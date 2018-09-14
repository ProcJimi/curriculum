/* Divide the data into valid vs. invalid dates 
   GROUPS - Flag only invalid dates */

*Ex6_Finding_Invalids.sas;
options nodate nonumber;
PROC FORMAT;
VALUE date_fmt 
   LOW-HIGH = 'Valid Date'
    . = 'Invalid Date';   
VALUE invalid_date_fmt 
        . = 'Invalid Date'; 
run;
DATA HAVE;
infile datalines firstobs=2;
input Name $ 1-7 
      @8 s_date ?? :mmddyy10.
      @8 s_date_ch $10.;
format s_date mmddyy10. ;
datalines;
12345678901234567890
Alfred 04/22/2005
Alice  01/15/2005
Barbara12/20/2004
Carol  10/29/1999
Henry  02/31/2007
Philip 02/31/2005
Ronald 02/29/2006
;
 Title 'Table lookup using a user-defined format';
proc freq DATA=Have;
  table s_date /missing ;
  format S_date date_fmt.;
RUN;

Title 'Subset the data based on the formatted value of the variable'; 
proc print DATA=HAVE noobs;
  var Name s_date_ch;
  where PUT(S_date, date_fmt.) ='Invalid Date';
RUN;




