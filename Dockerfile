FROM centos:latest

RUN yum install https://s3.amazonaws.com/amazoncloudwatch-agent/centos/amd64/latest/amazon-cloudwatch-agent.rpm -y

RUN mkdir /opt/aws/amazon-cloudwatch-agent/etc

COPY statsd.json /opt/aws/amazon-cloudwatch-agent/etc

RUN amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -s -c file:/opt/aws/amazon-cloudwatch-agent/etc/statsd.json

RUN yum install https://dl.k6.io/rpm/repo.rpm -y

RUN yum install k6 -y

COPY script.js .

RUN K6_STATSD_ENABLE_TAGS=true k6 run --out statsd script.js


