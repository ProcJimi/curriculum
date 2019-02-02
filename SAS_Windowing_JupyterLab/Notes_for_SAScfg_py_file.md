In the SAScfg_personal.py configuration file, you need all these files.

sas.svc.connection.jar

  log4j.jar

  sas.security.sspi.jar

 sas.core.jar

 

1.  Verify the path below where the saspyiom.jar file resides.

 

     cpW +=
";C:\\\\Anaconda\\\\Lib\\\\site-packages\\\\saspy\\\\java\\\\saspyiom.jar"

 

1.  Make sure that the path below points to the Java.exe rather than the folder
    of the JVM. You can verify this running the below command.

     where java

 

 

1.  Add the path of the Java.exe to the below location.

 

   winlocal = {'java'      : 'C:\\Program
Files\\Java\\jdk1.8.0_131\\bin\\java.exe',

            'encoding'  : 'windows-1252',

            'classpath' : cpW

            }
