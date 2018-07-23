FROM maven:3.5-jdk-8 as build-env

ARG OPSIN_COMMIT=59112cea2a3c
ARG OPSIN_WS_COMMIT=a5ffd031670e

# Download and install OPSIN
RUN wget https://bitbucket.org/dan2097/opsin/get/$OPSIN_COMMIT.tar.gz
RUN mkdir -p /opsin
RUN tar --strip-components=1 -C /opsin -xzf $OPSIN_COMMIT.tar.gz
WORKDIR /opsin
RUN mvn install

# Download and install OPSIN-ws
RUN wget https://bitbucket.org/dan2097/opsin-ws/get/$OPSIN_WS_COMMIT.tar.gz
RUN mkdir -p /opsin-ws
RUN tar --strip-components=1 -C /opsin-ws -xzf $OPSIN_WS_COMMIT.tar.gz
WORKDIR /opsin-ws
RUN mvn install

FROM tomcat:8.5-jre8

RUN rm -r /usr/local/tomcat/webapps/ROOT
COPY --from=build-env /opsin-ws/target/opsin.war /usr/local/tomcat/webapps/ROOT.war
