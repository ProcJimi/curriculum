
*Example_DoLoop_Mod_Func.sas;
data YearData (drop=i);
do i = 1 to 10 ;
   do Dates =  '01JAN2012'D to '31DEC2012'D;
  		   if dates ne . then do;
   		     if mod(Dates,8)=0 then Category=1;
      	     else if mod(Dates,4)=0 then Category=2;
             else if mod(Dates,2)=0 then Category=3;
	         else if mod(Dates,3)=0 then Category=4;
	         else if mod(Dates,5)=0 then Category=.;
             else Category=5;
		   end; 
    output;
	end;
  output;
  end;
  run;

data SampleData;
   CALL STREAMINIT(1234);
   retain Category Dates;
   set YearData;
   where RAND("Uniform") <=0.025; 
proc print data=SampleData noobs; 
  format Dates date9.; 
run;
