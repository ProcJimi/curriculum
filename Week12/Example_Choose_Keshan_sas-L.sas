*Example_Choose_Keshan_sas-L.sas;
*Acknowledgements: Xia Kesan SAS-L;
proc iml;
 faulty = {15   12   13,    
           16   29   13,
           15   12   13,
           18   58   11 };
 updates = {.   .    .,       
           16   29   .,
            .   .    .,
           18   58   .};
 want=choose(updates^=.,updates,faulty );
 print want;
 quit;

