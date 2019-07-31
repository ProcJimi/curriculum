*Ex8_Invalue_statement.sas (Part 1);
options nocenter nonumber nodate nosource;
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
title1 'PROC FORMAT INVALUE Invalue Statement with UPCASE and JUST Options (Part 1)';
proc print data=Grade_data1 noobs ; run;

*Ex8_Invalue_statement.sas (Part 2);
options nocenter nonumber nodate nosource;
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
title1 'PROC FORMAT INVALUE Statement with the UPCASE Option';
title2 'and _SAME_ and OTHER Keywords (Part 2)';
proc print data=GPA_data noobs ;
run;

*Ex8_Invalue_statement.sas (Part 3);
options nocenter nonumber nodate nosource;
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
title1 'PROC FORMAT VALUE Statement (Part 3)'; 
title2;
 proc print data=Fictitious_Data noobs; 
 format Did_you_ever_use_SAS respfmt_1x. freq comma6.;
run;                                              

