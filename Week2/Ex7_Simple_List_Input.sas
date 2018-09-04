*Ex7_Simple_List_Input.sas;
OPTIONS nodate nonumber ps=58 ls=98;
DATA Work.Have1;
    INPUT  st_name $ pop percent_pop18p ;
	DATALINES;
    Alabama 4833722          77
    ;
  PROC PRINT noobs; run;
  
  DATA Work.Have2;   
   LENGTH st_name $ 10;                        
    INPUT st_name $ pop percent_pop18p ;
    DATALINES;								
    Alabama            4833722  77
    California 38332521             76.1
  ;
 PROC PRINT noobs; run;
  
DATA Work.Have3;   
   INFORMAT st_name $ 10.;                        
    INPUT st_name $ pop percent_pop18p ;
    DATALINES;								
    Alabama 4833722  77
    California 38332521 76.1
  ;
 PROC PRINT noobs; run;

 DATA Work.Have4;   
   INFORMAT st_name $ 10.;                        
    INPUT st_name $ pop percent_pop18p ;
    DATALINES;								
    Alabama .    77
    California 38332521 76.1
  ;
 PROC PRINT noobs; run;

 /* Note:  You must assign a placeholder for the missing value 
    for fields  in the middle of the record of the space-delimited 
    file (in the first line of data record).
 */
