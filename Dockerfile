FROM webdevops/php-nginx:7.4
FROM node

ARG RAILWAY_ENVIRONMENT
ENV RAILWAY_ENVIRONMENT=$RAILWAY_ENVIRONMENT

COPY . /app
WORKDIR /app
RUN [ "sh", "-c", "curl -sS https://getcomposer.org/installer -o composer-setup.php & sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer" ]
RUN [ "sh", "-c", "composer install --ignore-platform-reqs" ]
RUN [ "sh", "-c", "chmod -R 777 /app" ]
