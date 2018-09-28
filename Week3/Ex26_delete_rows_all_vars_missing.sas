
data have;
  set sashelp.class(obs=7);
  if mod(_n_,3)=0 then call missing(of _all_);
run;
data have3;
set have;
  if cmiss(of _all_) >0 then delete;
run;

*Quentin McMullen - 9/25/2018;
data have4;
set have;
if compress(cats(of _all_),'.')=' ' then delete;
run;
