*Ex1_%str_%nrstr1.sas;
%LET mvar1 = Beth%STR(%'s) Assignment Report;
%LET mvar2 = %STR(Beth%'s Assignment Report);
%let Course=%str(   Stat 4197);
%let step=%str(proc print; run;);
%let mvar3 =  %NRSTR(AT&T);
%let mvar4 =  %NRSTR(%of defective bulbs);
%PUT &=mvar1;
%PUT &=mvar2;
%PUT &=mvar3;
%PUT &=mvar4;
%PUT &=step;
%put &=Course;
