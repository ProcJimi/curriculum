

```python
import pandas as pd
from pathlib import Path
import time

p = Path("/SASCourse/Week2")
all_files = []
for i in p.rglob('*.SAS'):
    all_files.append((i.name, i.parent, time.ctime(i.stat().st_ctime)))

columns = ["File_Name", "Parent", "Created"]
df = pd.DataFrame.from_records(all_files, columns=columns)

print(df.iloc[:,0])
```

    0                     Ex10_Modified_List_Input.sas
    1                          Ex11_Question_marks.sas
    2                         Ex12_Dumping_Records.sas
    3                   Ex13_Line_Pointer_controls.sas
    4                  Ex14_Column_Formatted_Input.sas
    5      Ex15_Absolute_Relative_Pointer_Controls.sas
    6                             Ex16_Named_Input.sas
    7                        Ex17_Filename_Libname.sas
    8                      Ex18_Read_Zipped_Files2.sas
    9                                Ex19_Miissing.sas
    10                            Ex1_Column_Input.sas
    11                         Ex20_import_Excel_x.sas
    12                                    Ex21_put.sas
    13                                Ex22__DM_CSV.sas
    14                                 Ex23_Length.sas
    15    Ex24_Informat_List_Input_Formatted_Input.sas
    16                          Ex25_read_from_web.sas
    17                    Ex26_Modified_List_Input.sas
    18                         Ex27_Amper_Modifier.sas
    19                 Ex28_Reading_Multiple_Files.sas
    20              Ex29_Multiple_Input_Statements.sas
    21                 Ex2_Column_Input_PAD_Option.sas
    22                                     Ex30_@@.sas
    23                             Ex31_Datalines4.sas
    24                Ex32_putlog_specify_decimals.sas
    25             Ex33_Split_data_based_on_values.sas
    26                             Ex34_put_putlog.sas
    27           Ex35_input_numeric_character_data.sas
    28                   Ex36_Week_2_List_of_Files.sas
    29         Ex37_Formmatted_Input_Formatted_put.sas
    30           Ex3_Column_Input_TRUNCOVER_Option.sas
    31                         Ex4_Formatted_Input.sas
    32                  Ex5_formatted_column_input.sas
    33                    Ex6_formated_input_dates.sas
    34                       Ex7_Simple_List_Input.sas
    35               Ex8_List_Input_Modified_Input.sas
    36                        Ex9_DLM_DSD_MISSOVER.sas
    37                 Ex1_Column_Input-checkpoint.sas
    Name: File_Name, dtype: object
    


```python
%pwd
```




    'c:\\sascourse\\week2'




```python

```
