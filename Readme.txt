Requirements:

Windows users have to do change the commands table data file and change the shell commands to dos equivalents. They also have to use the whole path to gcc and svn enclosed in ...

You need to have gcc installed (windows users use mingw)

 
You need to create the following directories on your Oracle-DB-Host OS (mkdir) and in the Database itself (create directory as ;). You may need root rights and you need the Oracle SYS password for sure. Linux/Unix Useres do not forget to chown the directories to oracle:dba.

SVN_SPOOL /var/spool/orasvn/cmd

SVN_PROJECTS /var/spool/orasvn/projects

Locate the File libqsmashr.so or .dll on Windows and add the directory path to your database:
ORACLE_LIB /usr/lib/oracle/xe/app/oracle/product/10.2.0/server/lib/

Locate the File oci.h and add the directory path to your database:
OCI_H /usr/lib/oracle/xe/app/oracle/product/10.2.0/server/rdbms/public/


Installation:
1 linux/unix users log in as oracle user!
2 Untar the archive
3 Change into the directory containing install.sql (orasvn_sf)
4 Log into sqlplus with sys as sysdba and issue the install.sql

 
Uninstall:
1 Drop the schema ORASVN
2 Remove the directories created previously


Quick Start:
1 Create a repository in your SVN

2 Add the repository to your Oracle project by issuing SVN.NEW_PROJECT NOTE! You cannot use subdirectories so pass as Url parameter your location of choice like http://xy/z/trunk/yourProject/src/rdbms/

3 Add the Oracle Source to your Project SVN.ADD_SRC. Optional you can use the all_objects_v view to migrate existing sources by calling SVN.ADD_SRC in a for-loop. You can also use the svn_sources_v view to see registered sources (Note: one source can be registered in several projects).

4 Commit changes in your Oracle objects by SVN.SPOOL_AND_COMMIT_SRC or do this for all your Sources registered with your project -> SVN.SPOOL_AND_COMMIT_SRC_ALL

5 Sync your databases by using SVN.UPDATE (tables will be altered if changed)

6 To deploy your project you can generate an install.sql file with SVN.GEN_INSATLL_SQL
