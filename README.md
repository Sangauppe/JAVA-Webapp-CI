# Prerequisites
#
- JDK 1.8 or later
- Maven 3 or later
- MySQL 5.6 or later

# Technologies 
- Spring MVC
- Spring Security
- Spring Data JPA
- Maven
- JSP
- MySQL
# Database
Here,we used Mysql DB 
MSQL DB Installation Steps for Linux ubuntu 14.04:
- $ sudo apt-get update
- $ sudo apt-get install mysql-server

Then look for the file :
- /src/main/resources/accountsdb
- accountsdb.sql file is a mysql dump file.we have to import this dump to mysql db server
- > mysql -u <user_name> -p accounts < accountsdb.sql


# JAVA-Webapp-CI

![image](https://user-images.githubusercontent.com/35370115/181523098-e5dffba0-a421-414d-be56-4d9431b3a04e.png)

# JAVA-Webapp-CD

![image](https://user-images.githubusercontent.com/35370115/181778556-6e0bb7ca-11a7-480d-a3b5-52f3d1428317.png)


# If SonarQube Code Coverage id less that 7% 

![image](https://user-images.githubusercontent.com/35370115/183018244-b2e1f0ce-c35c-4758-ab44-998d80674a81.png)

![image](https://user-images.githubusercontent.com/35370115/183018312-5b4269fc-7bf4-43f2-99dc-12308d50d4c2.png)

# If code Coverage < 6

![image](https://user-images.githubusercontent.com/35370115/183019078-a2ea3fd4-2f48-4844-bb1f-bb93e97773d0.png)

