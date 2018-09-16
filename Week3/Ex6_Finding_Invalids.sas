*Ex6_Finding_Invalids.sas;
*Method 1;
options nodate nonumber;
PROC FORMAT;
VALUE date_fmt 
   LOW-HIGH = 'valid date'
    other='invalid date';  
run;
DATA work.HAVE;
infile datalines firstobs=2;
input Name $ 1-7 
      @8 s_date ?? mmddyy10.
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
proc freq DATA=work.Have;
  table s_date /missing ;
  format S_date date_fmt.;
RUN;

Title "Listing of S_DATE_CH values if the S_DATE has a missing value"; 
proc print DATA=HAVE noobs;
  var Name s_date_ch;
  where S_date= .;
RUN;

/*
In the INPUT statement above, the ?? format modifier for the 
S_DATE variable suppresses the invalid data message and, 
in addition, prevents the automatic variable _ERROR_ 
from being set to 1 when invalid data are read.
[See SAS® Documentation for details]

Also see Week2 "Ex11_Question_marks.sas
*/

*Method 2;
options nodate nonumber;
DATA HAVE;
infile 'C:/SASCourse/Week3/Sample_dates.txt' firstobs=2 END=lastobs;
input Name $ 1-7 
      @8 s_date ?? mmddyy10.
      @8 s_date_ch $10.;

/* Use a sum statement to accumulate the count of bad dates (i.e., S_date=.) 
   during DATA step execution */
if s_date = . then invalid_dates+1; 

/*During the first iteration, specify the column position as well as the text
  to the LOG window */
if _n_=1 then put @10 'List of invalid dates:'; 

/* Output to the LOG window the values of bad dates from the 
   "character date variable" (i.e., S_date_ch) at the specified
   column position if the "numeric date variable" (i.e. S_date) 
   has a missing value
*/
if s_date = . then put @10 s_date_ch ;
 
/* Output to the LOG window the values of bad dates from the 
   "character date variable" (i.e., S_date_ch) at the specified
   column position if the "numeric date variable" (i.e. S_date) 
   has a missing value.
   The format argument is the equal sign so that the text (within quotes)
   as well as the variable name precedes it value.
*/
if lastobs then  put @10 'Number of' invalid_dates=;
run;
