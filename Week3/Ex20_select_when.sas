*Ex20_SELECT_WHEN.sas;
 data month_data;
    LENGTH Season $ 12 Quarter $ 9;
   INPUT Month $ @@;
   	 If Month in ('Jun', 'Jul', 'Aug') then Season = 'Summer';
     else if Month in ('Mar', 'Apr', 'May') then Season ='Spring';
     else Season = 'Fall/Winter';

   select (Month);
     when ('Jan','Feb','Mar')   Quarter = 'Quarter 1';
     when ('Apr', 'May', 'Jun') Quarter = 'Quarter 2';
     when ('Jul', 'Aug', 'Sep') Quarter = 'Quarter 3';
     when ('Oct', 'Nov', 'Dec') Quarter = 'Quarter 4';
	 otherwise;
   end;
    datalines;
  Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec
  ; 
  run;
 proc print noobs; 
   var Month Season Quarter ; 
 run;


 * Adapted/Expanded from the code originally 
  writted by Rick Wicklin at his Blog or SAS-L;
/* example of using the SELECT statement */

/* PROC FORMAT added  to Wicklin's code */
proc format;
value smk_fmt 1 = 'Non-smoker'
              2 = 'Light (1-5)'
              3 =  'Moderate (6-15)'
        	  4 = 'Heavy (16-25)'
        	  5 = 'Very Heavy (> 25)';
 
data Heart ;
set sashelp.heart;
select (Smoking_Status);
   when ('Non-smoker')        Smoking_Cat=1;
   when ('Light (1-5)')       Smoking_Cat=2;
   when ('Moderate (6-15)')   Smoking_Cat=3;
   when ('Heavy (16-25)')     Smoking_Cat=4;
   when ('Very Heavy (> 25)') Smoking_Cat=5;
   otherwise                  Smoking_Cat=.;
end;
run;

/* PROC FREQ added  to Wicklin's code */
proc freq data=heart order=freq;
tables Smoking_Status Smoking_Cat;
format Smoking_Cat smk_fmt.;
run;




