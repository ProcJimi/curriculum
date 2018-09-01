data pdelay1;
   input flight $3. +5 date date7. +2 orig $3. +3 dest $3. +3
         delaycat $15. +2 destype $15. +8 delay;
   informat date date7.;
   format date date7.;
   datalines;
114     01MAR08  LGA   LAX   1-10 Minutes     Domestic                8
202     01MAR08  LGA   ORD   No Delay         Domestic               -5
219     01MAR08  LGA   LON   11+ Minutes      International          18
622     01MAR08  LGA   FRA   No Delay         International          -5
132     01MAR08  LGA   YYZ   11+ Minutes      International          14
271     01MAR08  LGA   PAR   1-10 Minutes     International           5
302     01MAR08  LGA   WAS   No Delay         Domestic               -2
;


data djia;
      input Year HighDate date7. High LowDate date7. Low;
      format highdate lowdate date7.;
      datalines;
1968 03DEC68   985.21 21MAR68   825.13
1969 14MAY69   968.85 17DEC69   769.93
;
proc print data=djia; run;

data Charity;
   input School $ +2 Year +1 Name $ MoneyRaised 
         HoursVolunteered ;
   datalines;
Monroe  2007 Allison 31.65 19
Monroe  2007 Barry   23.76 16
Monroe  2007 Candace 21.11  5
Monroe  2007 Danny    6.89 23
; 
proc print data=Charity; run;
