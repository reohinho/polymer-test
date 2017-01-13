## BUILDING
##   (from project root directory)
##   $ docker build -t tomcat-for-reohinho-polymer-test .
##
## RUNNING
##   $ docker run -p 8080:8080 tomcat-for-reohinho-polymer-test
##
## CONNECTING
##   Lookup the IP of your active docker host using:
##     $ docker-machine ip $(docker-machine active)
##   Connect to the container at DOCKER_IP:8080
##     replacing DOCKER_IP for the IP of your active docker host

FROM gcr.io/stacksmith-images/minideb:jessie-r8

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="22f1ez9" \
    STACKSMITH_STACK_NAME="Tomcat for reohinho/polymer-test" \
    STACKSMITH_STACK_PRIVATE="1"

# Install required system packages
RUN install_packages libc6 libxext6 libx11-6 libxcb1 libxau6 libxdmcp6 libglib2.0-0 libfreetype6 libfontconfig1 libstdc++6 libgcc1 zlib1g libselinux1 libpng12-0 libexpat1 libffi6 libpcre3 libxml2 liblzma5

RUN bitnami-pkg install java-1.8.0_111-1 --checksum f7705a3955f006eb59a6e4240a01d8273b17ba38428d30ffe7d10c9cc525d7be
RUN bitnami-pkg install tomcat-8.5.8-2 --checksum 014140ec820665e879656d2380873491aa62682b548d2b59fc6a38a659b4e999 -- --username manager --password bitnami

ENV JAVA_HOME=/opt/bitnami/java \
    CATALINA_HOME=/opt/bitnami/tomcat
ENV PATH=$CATALINA_HOME/bin:/opt/bitnami/java/bin:$PATH

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

# Tomcat server template
RUN ln -s $CATALINA_HOME/webapps /app
WORKDIR /app
COPY . /app

EXPOSE 8080
CMD ["nami", "start", "--foreground", "tomcat"]
