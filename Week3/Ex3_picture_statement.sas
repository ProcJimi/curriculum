*Ex3_Picture_Statement.sas;
proc format;
  picture test (round)
         low-<0='09.99' (prefix='-')
         0-<10 ='09.99'
		 10-<100='99.9'
		 100-999 ='999';
run;
/*
The Round option with the PICTURE statement rounds the data to the 
nearest integer before formatting.

PREFIX= specifies a character prefix for the formatted value.

Leading 0's as digit selector -> blanks
Nines -> some values
*/
DATA temp;
INPUT  Some_value @@;
 final_value=put(Some_value, test.);
 datalines;
  5.209 0.203 -0.027 95.307 357.897 
  ; 
proc print noobs;  run;



proc format; 
      picture YYYYMONDD other='%Y%b%0d' (datatype=date); 
   run;
/*
   The % followed by a letter indicates a directive.

   %Y - four-digit year.
   %b - abbreviated month name
   %0d - day of the month with no leading zero, 
        if the the day of the month is one digit.

   The Datatype PICTURE option specifies that the above format 
   will be applied to a SAS date, SAS time or SAS datetime. 
   */

 
 data _Null_; 
    current_date=today(); 
	some_date='04Jul2018'd;
    putlog current_date= YYYYMONDD10.
           some_date=YYYYMONDD10.; 
	      
  run;


  * Another Example;

  *** Create formats to display "million" figures in "thousands"
     and "billion" figures in millions;
proc format;
picture thou (round)
      low-high='000,000,000' (mult=.001);
picture mil (round)
      low-high='0,000,000,000' (mult=.000001);
run;
/* 
Keywords low-high -> the range of non-missing values to 
which the format will be applied.

The leading zeros are removed by using 0 as the digit selector. 

Here, the value-label is a template showing digit selectors.
MULT= specifies the number to multiply the variable's value 
before it is formatted.


*/


  data work.Pop2005;
  input name $1-14 pop: comma.;
  pop_x = pop;
  pop_y=pop;
  datalines;
CHINA              1,323,344,591
INDIA              1,103,370,802
UNITED STATES        298,212,895
INDONESIA            222,781,487
BRAZIL               186,404,913
PAKISTAN             157,935,075
RUSSIA               143,201,572
;
proc print data=work.pop2005 noobs split='*';
label pop='Population*Size'
      pop_x= 'Population*Size*(in millions)'
	  pop_y= 'Population*Size*(in thousands)';
Format pop comma14. pop_x mil. pop_y thou.;
run;
  
*Ex3_picture_statement.sas;
PROC FORMAT;
 PICTURE p_fmt (ROUND)
     LOW-<0 = "009.99%" (PREFIX="-" MULT=10000)
         0-HIGH = "009.99%" (MULT=10000);
PICTURE p_fmt_x (ROUND)
     LOW-<0 = "009.99" (PREFIX="-" MULT=10000)
         0-HIGH = "009.99" (MULT=10000);
RUN;
DATA work.have;
 INPUT Value1 @@;
 Value2 = Value1; Value3 = Value1;
 Value4 = Value1; Value5 = Value1;
DATALINES4;
0.0345678  -0.00123456  -0.456789 .120
;;;;
options nodate nonumber;
TITLE 'SAS- and User-Defined Formats Applied';
PROC PRINT DATA=work.have SPLIT="*" NOOBS;
 VAR Value: ;
 FORMAT Value2 PERCENT8.2  Value3 PERCENTN8.2  
        Value4 p_fmt. Value5 p_fmt_x.;
 LABEL Value1="No"*"Format"*"Applied"
       Value2="SAS"*"Percent"*"Format"*"PERCENT8.2"*"Applied"
	   Value3="SAS"*"Percent"*"Format"*"PERCENTN8.2"*"Applied"
       Value4="User"*"Picture"*"Format 1"*"Applied"
	   Value5="User"*"Picture"*"Format 2"*"Applied";
RUN;

