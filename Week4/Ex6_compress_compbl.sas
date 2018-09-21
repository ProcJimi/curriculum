*Ex6_compress_compbl.sas;
data work.HAVE;
 input ICD_string $1-5 +1 label $40.;
   x_string=compress(icd_string, '.');
   x_label=compbl(label);
datalines;
S72.0 Fracture of  head and  neck  of   Fumer
 ;
proc print data=work.HAVE noobs; 
run;

*Another Example;
*http://stackoverflow.com/questions/33881011/using-compress-and-put-input-functions-in-sas;
data work.HAVE1; 
input ID $ 11. State $ 2.;
datalines;
334-99-5246 TX
480-86-3211 MD
449-55-9407 VA
345-12-1778 GA
907-63-6280 NY
790-09-9813 WY
319-86-1601 FL
;
run;

Data work.Have2;
   set work.Have1;
   ncv=COMPRESS(ID, "-");

   * kd means keep-digits;
   ncv_d=COMPRESS(ID," ", "kd"); 
   ncv_n=COMPRESS(ID," ", "kn"); * kn means keep-numbers;

  /* Input Function is used to convert CHAR to NUM        *
   * the best. format applies the nearest matching format */
   newncv=input(ncv_d,best.); 
   ncv_num=input(ncv, 12.);
   
run;
proc contents data=work.Have2 p;
ods select position;
run;

proc print data=work.Have2; 
run;

