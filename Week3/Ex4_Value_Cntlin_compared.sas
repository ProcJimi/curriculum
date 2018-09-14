*Ex4_Value_cntlin_compared.sas;
proc format ;
value $xcausesfmt A00 =	 "Cholera "
                  A00.0 = "Cholera due to Vibrio cholerae 01, biovar cholerae" 
                  A00.1	= "Cholera due to Vibrio cholerae 01, biovar eltor" 
                  A01.1	= "Paratyphoid fever A" 
                  A01.2	= "Paratyphoid fever B" 
                  A01.3	= "Paratyphoid fever C" 
                  A01.4	= "Paratyphoid fever, unspecified" 
                  A02	= "Other salmonella infections" 
                  A02.0	= "Salmonella enteritis" 
                  A02.1	= "Salmonella septicaemia" 
;
data have1; 
input id $ cause_dth_code $ @@;
format cause_dth_code $xcausesfmt.; 
datalines; 
12345 A01.4 23456 A01.3 34567 A02.0
; 
proc print data=have1 noobs; run;

data causes_of_death;
 retain FMTNAME '$causesfmt' type 'C';;
input START $ LABEL & $50.;
datalines;
A00	    Cholera 
A00.0	Cholera due to Vibrio cholerae 01, biovar cholerae 
A00.1	Cholera due to Vibrio cholerae 01, biovar eltor 
A01.1	Paratyphoid fever A 
A01.2	Paratyphoid fever B 
A01.3	Paratyphoid fever C 
A01.4	Paratyphoid fever, unspecified 
A02	    Other salmonella infections 
A02.0	Salmonella enteritis 
A02.1	Salmonella septicaemia 
;
proc print data=causes_of_death; run;
proc sort data=causes_of_death
  out=causes_of_death nodupkey;
  by START;
run;
proc format cntlin=causes_of_death;
run;

data have2; 
input id $ cause_dth_code $ @@;
format cause_dth_code $causesfmt.; 
datalines; 
12345 A01.4 23456 A01.3 34567 A02.0
; 
proc print data=have2; run;






