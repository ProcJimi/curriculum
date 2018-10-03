*Ex12_SUM_Statement_vs_2_SETs.sas;
DATA sale_by_mon ;
  INPUT mon $  sale @@;
  cum_sale+sale;
  DATALINES;
  Jan 164083 Feb 164260 Mar 163747 Apr 164759 
  May 165617 Jun 166098 Jul 167305 Aug 167797 
  Sep 169407 Oct 170681 Nov 171025 Dec 172995
  ;
run;
PROC PRINT DATA=sale_by_mon ; 
  FORMAT sale cum_sale dollar12.;
   SUM sale ;
  run;

DATA xsale;
 /*if _n_=1 then */
  SET sale_by_mon(keep=cum_sale) 
       POINT=last nobs=last;
  SET sale_by_mon (drop=cum_sale);
  Percent_sale = sale/cum_sale;
run;
PROC PRINT DATA=xsale; 
  VAR mon sale Percent_sale;
  SUM sale Percent_sale;
  FORMAT sale dollar10. Percent_sale percent12.2;
run;
