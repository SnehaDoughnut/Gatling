FROM ubuntu:16.04
ENV GATLING_HOME /opt/gatling
ENV GATLING_VERSION 2.3.1
ENV PATH /opt/gatling/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN apt-get update \
  && apt-get install -y openjdk-8-jre wget 
RUN  mkdir -p /opt/gatling
WORKDIR /opt/gatling
RUN wget -O gatling-$GATLING_VERSION.zip https://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/2.3.1/gatling-charts-highcharts-bundle-2.3.1-bundle.zip
RUN unzip gatling-$GATLING_VERSION.zip
ENTRYPOINT ["gatling.sh"]
