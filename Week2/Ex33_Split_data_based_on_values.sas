/*
https://communities.sas.com/t5/SAS-Data-Management/Splitting-variables-based-on-variable-values/m-p/511956#M15903
Splitting data based on the values of the variables; 
 Author: novinosrin
*/
*Ex33_Split_data_based_on_values;
data have;
infile cards;
if mod(_n_,2) ne 0 then input Information $;
else input date;
cards;
X1
120225
G8
180619
;
