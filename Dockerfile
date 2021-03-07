FROM ubuntu:latest
RUN apt-get -y update && apt-get -y upgrade && apt-get -y install openjdk-8-jdk wget && mkdir /usr/local/tomcat
RUN wget https://downloads.apache.org/tomcat/tomcat-8/v8.5.63/bin/apache-tomcat-8.5.63.tar.gz  -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-8.5.63/* /usr/local/tomcat/
ADD https://jithinsrs3.s3.ap-south-1.amazonaws.com/LoginRegisterApp.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run

