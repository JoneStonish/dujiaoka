FROM webdevops/php-nginx:7.4-alpine
LABEL maintainer="sudo@dov.moe"

ENV INSTALL=true

COPY . /dujiaoka

WORKDIR /dujiaoka

COPY ./default.conf /opt/docker/etc/nginx/vhost.conf
COPY ./dujiao.conf /opt/docker/etc/supervisor.d/

COPY start.sh /

RUN set -xe \
    && composer install -vvv \
    && chmod +x /start.sh \
    && chown -R application:application /dujiaoka/ \
    && chmod -R 755 /dujiaoka/ \
    && sed -i "s?\$proxies;?\$proxies=\'\*\*\';?" /dujiaoka/app/Http/Middleware/TrustProxies.php \


CMD /start.sh
