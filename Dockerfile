FROM openjdk:8-jdk
ENV GATLING_HOME /opt/gatling
ENV GATLING_VERSION 2.3.1
RUN apt-get update \
  && apt-get install -y wget unzip vim
RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.3.0-amd64.deb
RUN dpkg -i filebeat-6.3.0-amd64.deb

COPY filebeat.yml /etc/filebeat/
RUN chmod go-w /etc/filebeat/filebeat.yml

RUN  mkdir -p /opt/gatling

RUN mkdir -p /tmp/downloads && \
    wget -q -O /tmp/downloads/gatling-$GATLING_VERSION.zip \
    https://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/$GATLING_VERSION/gatling-charts-highcharts-bundle-$GATLING_VERSION-bundle.zip && \
    mkdir -p /tmp/archive && cd /tmp/archive && \
    unzip /tmp/downloads/gatling-$GATLING_VERSION.zip && \
    mv /tmp/archive/gatling-charts-highcharts-bundle-$GATLING_VERSION/* /opt/gatling/ && \
    rm -rf /tmp/*


WORKDIR  /opt/gatling

ENV PATH /opt/gatling/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
EXPOSE 8000
ENTRYPOINT ["gatling.sh"]
