Training Registration
=====================
Modification of bowling app that lets users register for training sessions and enables admins to create/remove training sessinos.

###Tools
--------
The tools used to build the application is given below.
- java 8
- apache tomcat 8
- spring framework 4.1.6
- hibernate 
- MySQL 5.6 (database)
- git (revision control)


---

###To run
---------
1. Get eclipse [maven plugin](http://www.eclipse.org/m2e/)  
2. Get [apache tomcat 8](http://tomcat.apache.org/download-80.cgi)  
3. Get [mysql 5.6](http://dev.mysql.com/downloads/mysql/)

4. **Start the mysql server**
5. **Run the [sql script](https://github.com/private-pilot/training-registration/blob/develop/src/main/resources/sql/createtable.sql) in your mysql server**

####Manually
------------
1. Go to the root folder  

```
$ mvn clean install
```

2. Copy the generated war file to tomcat's `webapp` directory.
```
$ cp target/Exploration.war {tomcat-directory}/webapps/
```

3. *To setup mysql, start the mysql server and run the shell script provided!*
```
$ sh setupdb.sh [./src/main/resources/sql/createtable.sql](https://github.com/private-pilot/exploratory-testing/blob/develop/src/main/resources/sql/createtable.sql)
```

4. Run tomcat
```
$ sh {tomcat-directory}/bin/catalina.sh start
```

---

####Eclipse
Import the project. Right click > maven > update project  
Then deploy using tomcat server from eclipse.

---


###TODO
---------


