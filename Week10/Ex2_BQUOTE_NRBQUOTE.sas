*Ex2_BQUOTE_NRBQUOTE.sas;
options symbolgen;
data test;
  store="Kids'Corner";
  call symput('s',store);
run;
%MACRO BQ;
  %IF %BQUOTE(&s) NE %THEN %PUT *** valid ***;
  %ELSE %PUT *** null value ***;
%MEND BQ;
%BQ   

*Ex2_BQUOTE_NRBQUOTE.sas;
%MACRO BQ_x;
  %LOCAL state;
  data _null_;
    State_Name='NE';
	CALL SYMPUT('State', State_Name);
  run;
  %IF %BQUOTE(&State)=%STR(NE) %THEN
      %PUT Nebraska Dept. of Health;
%put &State;
%MEND BQ_x;
%BQ_x 



