FROM tomcat:8-jre11

RUN rm -rf /usr/local/tomcat/webapps/*

COPY  /var/lib/jenkins/workspace/complete_app_deployment-CI/taget/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
