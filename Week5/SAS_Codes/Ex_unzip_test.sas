
filename inzip zip "c:\Data\h197gssp.zip" ;
filename sit "C:\Users\pmuhuri\downloads\h197g.ssp" ;
data _null_;
infile inzip(h197g.ssp) lrecl=256 recfm=F length=length eof=eof unbuf;
file sit lrecl=256 recfm=N;
input;
put _infile_ $varying256. length;
return;
eof: stop;
run;
