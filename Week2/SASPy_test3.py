import saspy
import pandas
sas = saspy.SASsession() 
tv=pandas.read_csv('c:\SASCourse\Week2\TV_Data.csv')
print(tv, head(5))

