*Ex1_%str_%nrstr1.sas;

%LET mvar1 = Beth%STR(%'s) Assignment Report;
%PUT &=mvar1;

%LET mvar2 = %STR(Beth%'s Assignment Report);
%PUT &=mvar2;

%let Course=%str(   Stat 4197);
%put &=Course;

%let step=%str(proc print; run;);
%PUT &=step;

%let mvar3 =  %NRSTR(AT&T)
%PUT &=mvar3;

%let mvar4 =  %NRSTR(%of defective bulbs);
%PUT &=mvar4;



