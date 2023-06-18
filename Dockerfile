FROM webdevops/php-nginx:7.4
COPY . /app
WORKDIR /app

ENV WEB_DOCUMENT_ROOT=/app/public

RUN [ "sh", "-c", "composer install --ignore-platform-reqs" ]
RUN [ "sh", "-c", "chmod -R 777 /app" ]

EXPOSE 80 443
