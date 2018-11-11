ods html; 
options ls=132 ps=58;
*Matrix_reduction_operators.sas;
proc iml;
A = {1 2 3, 4 5 6, 9 8 7, 3 2 1, 5 4 2};
print 'Entire Matrix', A;
quit;
ods html; 
proc iml;
A = {1 2 3, 4 5 6, 9 8 7, 3 2 1, 5 4 2};
row_sum=A[,+ ];
print A row_sum ;
quit;

ods html;
proc iml;
A = {1 2 3, 4 5 6, 9 8 7, 3 2 1, 5 4 2};
col_sum=A[+, ];
print A, col_sum ;
quit;

ods html;
proc iml;
A = {1 2 3, 4 5 6, 9 8 7, 3 2 1, 5 4 2};
max_c_sum= A[+, <>];
print A,max_c_sum ;
quit;

ods html;
proc iml;
A = {1 2 3, 4 5 6, 9 8 7, 3 2 1, 5 4 2};
min_c_sum= A[+, ><];
print A, min_c_sum ;
quit;



ods html;
proc iml;
A = {1 2 3, 4 5 6, 9 8 7, 3 2 1, 5 4 2};
i_col_maxima=A[<:>,];
print A, i_col_maxima ;
quit;


ods html;
proc iml;
A = {1 2 3, 4 5 6, 9 8 7, 3 4 1, 5 7 2};
i_col_minima=A[>:<,];
print A, i_col_minima ;
quit;


ods html;
proc iml;
A = {1 2 3, 4 5 6, 9 8 7, 3 2 1, 5 4 2};
sum_max_r=A[,<>] [+, ];
print A ,sum_max_r ;
quit;

ods html;
proc iml;
A = {1 2 3, 4 5 6, 9 8 7, 3 2 1, 5 4 2};
sum_c12 = A[+, 1:2];
print A, sum_c12 ;
quit;

ods html;
proc iml;
A = {1 2 3, 4 5 6, 9 8 7, 3 2 1, 5 4 2};
max_row_1_2_col_1_3 = A[1:2, 1:3] [<>];
print A, max_row_1_2_col_1_3 ;
quit;

ods html;
proc iml;
A = {1 2 3, 4 5 6, 9 8 7, 3 2 1, 5 4 2};
min_row_1_2_col_1_3 = A[1:2, 1:3] [><];
print A, min_row_1_2_col_1_3; 
quit;

ods html;
proc iml;
A = {1 2 3, 4 5 6, 9 8 7, 3 2 1, 5 4 2};
mean_1_2_3 = A[:, ] ;
print A, mean_1_2_3;
quit;

