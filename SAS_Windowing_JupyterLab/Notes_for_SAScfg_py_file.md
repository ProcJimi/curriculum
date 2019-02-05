**SAScfg_personal.py (configuration file) that resides in the SASPy folder**

Below are some notes taken from Pradip Muhuri’s email communication with Chevell
Parker (SAS Institute) to edit the above configuration file.

1.  Make sure you have all these files in the appropriate folders.

sas.svc.connection.jar

   log4j.jar

   sas.security.sspi.jar

  sas.core.jar

1.  In the SAScfg_personal.py configuration file, verify the path below where
    the saspyiom.jar file resides. Adjust the path as appropriate.

      cpW +=
";C:\\\\Anaconda\\\\Lib\\\\site-packages\\\\saspy\\\\java\\\\saspyiom.jar"

1.  How to find the path for Java? Type the following at the command line:

>   Where Java

1.  In the SAScfg_personal.py configuration file, make sure that the path below
    points to the Java.exe rather than the folder of the JVM. Add the path of
    the Java.exe to the below location.

    winlocal = {'java'      : 'C:\\Program
Files\\Java\\jdk1.8.0_131\\bin\\java.exe',

             'encoding'  : 'windows-1252',

             'classpath' : cpW

             }

jupyter kernelspec list

C:\\Users\\pmuhuri\>jupyter kernelspec list

Available kernels:

sas C:\\Users\\pmuhuri\\AppData\\Roaming\\jupyter\\kernels\\sas

python3 c:\\program files\\python37\\share\\jupyter\\kernels\\python3

pip list

pip show jupyter

[How to configure Python and SASPy - by Michael
McCarthy](http://www.scsug.org/wp-content/uploads/2018/10/McCarthy-How-to-configure-Python-and-SASPy.pdf)
