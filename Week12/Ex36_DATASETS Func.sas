*Ex36_DATASETS Func.sas;

/*The DATASETS function returns the names of all SAS data sets 
in a specified libref*/

libname new 'D:\';
proc iml;
lib = "new";
A = datasets(lib);
First3 = A[1:3];
print First3;
quit;

/*CONTENTS Function in PROC IML
The CONTENTS function returns the names of all variables
in a specified data set.
*/

proc iml;
lib = "SASHELP";          
ds = datasets(lib);      
 
/*Find data sets that contain the same variable names*/

do i = 1 to nrow(ds);
   varnames = upcase( contents(lib, ds[i]) ); 
   if any(varnames = "WEIGHT") then 
      print (ds[i]);
end;
quit;
 
