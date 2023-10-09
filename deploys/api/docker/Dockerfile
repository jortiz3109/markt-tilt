FROM alpine:latest
COPY --from=composer /usr/bin/composer /usr/local/bin/composer
COPY --from=ghcr.io/roadrunner-server/roadrunner:latest /usr/bin/rr /var/www/html/rr

LABEL maintainer="John Edisson Ortiz"

RUN echo "UTC" > /etc/timezone

RUN apk update && apk upgrade
RUN apk add --no-cache bash
RUN apk add --no-cache php82 php82-common php82-fpm \
    php82-pdo php82-opcache php82-zip php82-phar php82-iconv \
    php82-cli php82-curl php82-openssl php82-mbstring php82-tokenizer \
    php82-fileinfo php82-json php82-xml php82-xmlwriter php82-simplexml \
    php82-dom php82-pdo_mysql php82-pdo_sqlite php82-tokenizer php82-pecl-redis \
    php82-pcntl php82-posix php82-bcmath php82-intl

RUN ln -s /usr/bin/php82 /usr/bin/php

COPY . /var/www/html/
WORKDIR /var/www/html/
