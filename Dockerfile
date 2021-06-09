FROM centos:latest

RUN yum install https://s3.amazonaws.com/amazoncloudwatch-agent/centos/amd64/latest/amazon-cloudwatch-agent.rpm -y

RUN yum install https://dl.k6.io/rpm/repo.rpm -y

RUN yum install k6 -y

COPY statsd.json /opt/aws/amazon-cloudwatch-agent/etc/

COPY common-config.toml /opt/aws/amazon-cloudwatch-agent/etc/

COPY script.js .

CMD /opt/aws/amazon-cloudwatch-agent/bin/start-amazon-cloudwatch-agent &&\
    K6_STATSD_ENABLE_TAGS=true k6 run --out statsd script.js
