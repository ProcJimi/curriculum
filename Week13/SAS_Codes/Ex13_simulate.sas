*Ex13_simulate.sas;
data temp;
  allowed="123456789abcdefghijklmnopqrstuvwxyz";
  num_ids=100;
  idlen=6;
  length my_id $6;
  num_allowed=length(strip(allowed));
  do i=1 to num_ids;
    do j=1 to 6;
      temp=ceil((num_allowed * rand("uniform")));
      substr(my_id,j,1)=substr(allowed,temp,1);
    end;
    output;
  end;
run;
proc print data=temp; run;
