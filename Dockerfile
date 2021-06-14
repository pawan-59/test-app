FROM centos:latest

RUN yum install httpd -y

RUN echo "Hello" > /var/www/html/index.html

ENTRYPOINT [ "/usr/sbin/httpd" ]

EXPOSE 80

CMD [ "-DFOREGROUND" ]
