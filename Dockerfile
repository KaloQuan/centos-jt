FROM centos

MAINTAINER KaloQuan "KaloQuan@163.com"

#Install jdk1.8.0_131
RUN yum install wget -y \
    && wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm \
    && rpm -Uvh jdk-8u131-linux-x64.rpm \
    && rm -rf jdk-8u131-linux-x64.rpm

#Install apache tomcat 8.5.15
RUN mkdir /programs \
    && wget -P /programs http://mirror.csclub.uwaterloo.ca/apache/tomcat/tomcat-8/v8.5.15/bin/apache-tomcat-8.5.15.tar.gz \
    && tar -zxf /programs/apache-tomcat-8.5.15.tar.gz -C /programs \
    && rm -rf /programs/apache-tomcat-8.5.15.tar.gz

EXPOSE 8080

CMD ["/programs/apache-tomcat-8.5.15/bin/catalina.sh","run"]
