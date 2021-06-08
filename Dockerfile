FROM centos:latest

RUN yum install https://s3.amazonaws.com/amazoncloudwatch-agent/centos/amd64/latest/amazon-cloudwatch-agent.rpm -y

COPY statsd.json /opt/aws/amazon-cloudwatch-agent/etc

COPY statsd .

ENTRYPOINT ["/opt/aws/amazon-cloudwatch-agent/bin/start-amazon-cloudwatch-agent"]
