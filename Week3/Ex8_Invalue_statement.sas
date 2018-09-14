*Ex8_Invalue_statement.sas;
*** Part 1;
proc format ;
    invalue scorefmt (upcase just)
            'A'=95  'B'=84  
            'C'=79  'D'=60;
run;
data Grade_data1;
  input @1 id $4.  @6 grade scorefmt2. ;
datalines;
S001 A 
S002 D 
S003 B 
S004 B
S005  D 
S006 C 
S007 c 
;
title 'Invalue Statement with UPCASE and JUST Options';
proc print data=Grade_data1 noobs ; run;

*** Part 2;
proc format ;
    invalue gpafmt (upcase)
            2.5-4.0 = _SAME_
            'B' = 3.0
            OTHER=. 
;
data GPA_data;
  input id $  GPA :gpafmt3. @@;
datalines;
S001 2.8 S002 3.7 S003 4.0 S004 B 
S005 2.7 S006 3.2 S007 . 
;
title 'Invalue Statement with the UPCASE Option';
title2 'and _SAME_ and OTHER Keywords';
proc print data=GPA_data noobs ;
run;

proc format library=work;                                    
    value respfmt_1x                            
    0="TOTAL"                                              
    1="YES"                                                
    2="NO"   
    -8="DON'T KNOW" 
	-7="REFUSED"
    -9="NOT ASCERTAINED"                                        
    -1="INAPPLICABLE" ;

  value respfmt_2x                            
    0="TOTAL"                                              
    1="YES"                                                
    2="NO"   
    LOW- <0="INVALID"                   
    ;
  run;  
data Fictitious_Data; 
   infile datalines firstobs=2; 
   input @1 Did_you_ever_use_SAS 2. @5 freq 9.;                                                    
datalines;  
0123456789 
-9     251
-8     722
-7       6
-1   28323
 1    4134 
 2    3504 
 0   36940
;                                                                   
 proc print data=Fictitious_Data noobs; 
 format Did_you_ever_use_SAS respfmt_2x. freq comma6.;
run;                                              


proc format library=work;                                    
   invalue myfmt                                                    
    "TOTAL"=0                                              
    "YES"=1                                                
    "NO"=2   
    "DON'T KNOW"=-8 
    "NOT ASCERTAINED"-9                                        
    "INAPPLICABLE" = -1 
	"REFUSED" = -7
	;
  run;                                                                
                                                                    
data Fictitious_Data_Rev;                                                         
   set Fictitious_Data;                                                        
   sortvar=input(Did_you_ever_use_SAS,myfmt.);                                         
run;                                                                
proc sort data=Fictitious_Data_Rev; by sortvar; run;
proc print data=Fictitious_Data_Rev  noobs; run;



*** Another Example;
proc format;
invalue i_smk_fmt 'Non-smoker'=1
               'Light (1-5)'=2
               'Moderate (6-15)'=3
        	   'Heavy (16-25)'=4
        	   'Very Heavy (> 25)'=5
               ' ' =.;
value smk_fmt 1 = 'Non-smoker'
              2 = 'Light (1-5)'
              3 =  'Moderate (6-15)'
        	  4 = 'Heavy (16-25)'
        	  5 = 'Very Heavy (> 25)';

data work.heart_x;
  set sashelp.heart;
  * Convert the original character variable (i.e., Smoking_Status)
    into a new numeric variable (i.e, n_Smoking_Status)
    using the INPUT function;
    n_Smoking_Status=input(Smoking_Status,i_smk_fmt.);
run;

proc freq data=heart_x order=freq;
tables Smoking_Status n_Smoking_status;
format n_Smoking_status smk_fmt.;
run;





