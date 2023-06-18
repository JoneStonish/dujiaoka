#!/bin/sh

if [ -f "/dujiaoka/.env" ]; then
   
    if [ "$INSTALL" != "true" ]; then
        echo "ok" > install.lock
    fi

    chmod -R 777 storage

    php artisan clear-compiled
    php artisan optimize
    php artisan migrate

    supervisord

    cat /opt/docker/etc/supervisor.d/dujiao.conf
    cat /opt/docker/etc/supervisor.d/nginx.conf
else
    echo "配置文件不存在，请根据文档修改配置文件！"
fi
