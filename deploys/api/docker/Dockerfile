FROM alpine:latest
COPY --from=composer /usr/bin/composer /usr/local/bin/composer
WORKDIR /var/www/html

LABEL maintainer="John Edisson Ortiz"

RUN echo "UTC" > /etc/timezone

RUN apk update && apk upgrade
RUN apk add --no-cache bash
RUN apk add --no-cache php82 php82-common php82-fpm \
    php82-pdo php82-opcache php82-zip php82-phar php82-iconv \
    php82-cli php82-curl php82-openssl php82-mbstring php82-tokenizer \
    php82-fileinfo php82-json php82-xml php82-xmlwriter php82-simplexml \
    php82-dom php82-pdo_mysql php82-pdo_sqlite php82-tokenizer php82-pecl-redis

RUN ln -s /usr/bin/php82 /usr/bin/php

COPY . /var/www/html/
COPY docker/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh