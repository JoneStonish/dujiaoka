FROM webdevops/php-nginx:7.4
COPY . /dujiaoka
WORKDIR /dujiaoka

RUN [ "sh", "-c", "composer install --ignore-platform-reqs" ]
RUN [ "sh", "-c", "chmod -R 777 /dujiaoka" ]

EXPOSE 80
