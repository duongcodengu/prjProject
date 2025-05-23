
FROM tomcat:10.1-jdk17

RUN rm -rf /usr/local/tomcat/webapps/ROOT

COPY dist/PrjProject.war /usr/local/tomcat/webapps/ROOT.war


