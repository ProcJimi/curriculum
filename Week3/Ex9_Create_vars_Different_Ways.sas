*Ex9_Create_vars_Different_Ways.sas (part 1);

data Have1;
 length age_group $11;
 input age @@ ;
datalines;
  0 5 10 17 40 48 50 59 62 81 99 100
  ; 
title 'Have1 Data';
proc freq data=Have1;   
 table age; 
run;

*Ex9_Create_vars_Different_Ways.sas (part 2);
proc format ;
 value agefmt low-17 = '0-17 Years'
              18-49 = '18-49 Years'
			  50-64 = '50-64 Years'
			  65-High = '65+ Years'
			  ;
data Have2;
 input age @@ ;
 datalines;
  0 5 10 17 40 48 50 59 62 81 99 100
  ; 
title 'Have2 Data';
proc freq data=Have2; 
 table age; format age agefmt.;
run;

*Ex9_Create_vars_Different_Ways.sas (part 3);
 data Have3;
 length age_group $11;
  input age @@ ; 

  /*Character-type categorical variables using an assignment statement;
  IF-THEN/Else Statements are used to conditionally assign values to variables.*/

  if age <=17 then age_group='0-17 Years';
  else if 18<=age<=49 then age_group= '18-49 Years';
  else if 50<=age<=64 then age_group= '50-64 Years';
  else if age>=65 then age_group= '65+ Years';
  datalines;
  0 5 10 17 40 48 50 59 62 81 99 100
  ; 
 options center;
 title 'Have3 Data';
 proc freq data=Have3; 
 table age_group ; 
run;

 *Ex9_Create_vars_Different_Ways.sas (part 4);
 proc format ;
 value agefmt low-17 = '0-17 Years'
              18-49 = '18-49 Years'
			  50-64 = '50-64 Years'
			  65-High = '65+ Years'
			  ;
  data Have4;
  	input age @@ ; 
  	*Character-type categorical variables using a PUT function;
  	age_group_x=put(age, agefmt.);
  datalines;
  0 5 10 17 40 48 50 59 62 81 99 100
  ; 
 title 'Have4 Data';
 proc freq data=have4; 
 	table age_group_x ; 
 run;

DATA new_class;
infile datalines missover;
input Name $ score ;
*IF-THEN_ELSE statements to create new variables;
 if score =. then grade_x ='Missing';
 else if score <50 then grade_x= 'E';
 else if  50<=score<56 then grade_x= 'D';
 else if  56<=score<61 then grade_x= 'C-';
 else if  61<=score<71 then grade_x= 'C ';
 else if  71<=score<76 then grade_x= 'B-';
 else if  76<=score<85 then grade_x= 'B ';
 else if  85<=score<90 then grade_x= 'A-';
 else if  score >= 90 then grade_x= 'A';
 
 if 'A'<=grade_x<='D' then grade_xx='Passed';
 else grade_xx='Failed';
 datalines;
 Alfred 91 
 Alice 84 
 Barbara 70 
 Carol 75  
 Henry . 
 Philip 49 
 Ronald 76 
 ;
proc freq DATA=new_class ;
  table grade_x grade_xx;
RUN;

