
*Example_Print_proc_sql;
options nocenter nodate ls=90;
libname SDS 'C:\SASCourse\Week1';
libname library 'C:\SASCourse\Week1';
proc sql;
select region 
       ,fips
       ,name 
       ,pop format=comma12. 
       ,pop18p format=comma12.
       ,percent_pop18p format=comma5.1
from
   SDS.pop2013
   where name like 'A%';
quit;

proc sql;
select region, 
       sum(pop) as Sum_pop_by_region format=comma12.
from
   SDS.pop2013
group by region
order by sum_pop_by_region desc
union corresponding all
select sum(pop) as total_pop format=comma12.
from
   SDS.pop2013;
quit;
