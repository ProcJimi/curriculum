*Ex13_proc_Report_Basic.sas;
OPTIONS ps=59 ls=72 nonumber nodate ;
DATA work.HC_spend1;
 INFILE DATALINES DLM=',' MISSOVER;
 INPUT service_type: & $ 32. amount_in_B;
 DATALINES;
 Hospital Care, 882.3
 Physician and Clinical Services, 556.0
 Prescription Drugs, 263.3
 Nursing Care, 151.5
 Other Health Care, 138.2
 Dental Services, 110.9
 Home Health Care, 77.8
 Other Medical Products, 95.0
 Other Professional Services, 78.4
 ;
proc report data=work.HC_spend1 nowd SPLIT='*';
column service_type amount_in_B Percent;
define service_type / display  "Type of Services";
define amount_in_B / analysis SUM FORMAT=Dollar8.1
                   "Expenses (in Billions)"  Width=15;
define Percent / computed FORMAT=Percent8.1;

*Create Temporary Variables;
compute before;
 denom=amount_in_b.sum;
endcomp;

* Create a New Variable;
 compute Percent;
   Percent= amount_in_B.sum / denom;
 endcomp;

rbreak after / summarize UL OL;
Title1 "Health Care Expenditures, United States, 2012";
run;
 
