*Example_Choose1.sas;
proc iml;
id = {1,2,3,4,5};
quiz1= {12,18,13,9,7};
makeup={10, 17, 17, 12, 13};
r_quiz1=choose(makeup>quiz1, makeup, quiz1);
print  id quiz1 makeup r_quiz1;
quit;
