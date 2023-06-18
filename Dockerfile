FROM webdevops/php-nginx:7.4-alpine
LABEL maintainer="qmmcloud@gmail.com"

ENV INSTALL=true

COPY . /dujiaoka
WORKDIR /dujiaoka

#COPY ./default.conf /opt/docker/etc/nginx/vhost.conf
#COPY ./dujiao.conf /opt/docker/etc/supervisor.d/

RUN [ "sh", "-c", "cat /opt/docker/etc/nginx/vhost.conf" ]
RUN [ "sh", "-c", "cat /opt/docker/etc/supervisor.d/dujiao.conf" ]


RUN [ "sh", "-c", "composer install --ignore-platform-reqs" ]
RUN [ "sh", "-c", "chmod -R 777 /dujiaoka" ]

RUN [ "sh", "-c", "cat /opt/docker/etc/nginx/vhost.conf" ]
RUN [ "sh", "-c", "cat /opt/docker/etc/supervisor.d/dujiao.conf" ]

EXPOSE 80
