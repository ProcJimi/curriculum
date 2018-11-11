* Example_LOC.sas;
proc iml;
 sort Sashelp.demographics out=Sorted_countries 
    by descending pop;
 varnames = {'Name', 'Pop'};
 use Sorted_countries;
 read all var varnames; 
 close sashelp.demographics;
 idx = loc(pop>140000000);

 mean_world_pop1=pop[:];
 mean_world_pop2=mean(pop);
 mean_world_pop3=sum(pop)/nrow(pop);
 Number_of_countries=nrow(name);
 print (name[idx]) 
       (pop[idx])[format=comma15.];
  print  
   Number_of_countries,
   mean_world_pop1 [format=comma15.],
   mean_world_pop2 [format=comma15.],
   mean_world_pop3 [format=comma15.];
 quit;

 
