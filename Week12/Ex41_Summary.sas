*Ex41_Summary.sas;
options nodate nonumber;
proc iml;
USE sashelp.heart;
 SUMMARY class {sex} var {AgeAtDeath  weight};
CLOSE;
quit;
*Ex41_Summary.sas;
proc iml;
USE sashelp.heart;
summary class {sex} var {AgeAtDeath weight} 
        stat {mean std var} opt {noprint save};
CLOSE;
show names;
print AgeAtDeath[r=sex c={"Mean" "Std"} format=5.1], 
      weight[r=sex c={"Mean" "Std"} format=5.1];
quit;
