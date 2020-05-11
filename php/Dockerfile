ARG PHP_VERSION=7.2.30-fpm-alpine
FROM php:${PHP_VERSION}

ARG HLXCE_VERSION='cea346f887289041d9a34273b77634d0d03fae16'

ENV HLXCE_VERSION ${HLXCE_VERSION}

ENV DB_HOST 'localhost:3306'
ENV DB_DATABASE 'hlxce'
ENV DB_USERNAME 'hlxce'
ENV DB_PASSWORD 'secret'

COPY docker-entrypoint.sh /usr/local/bin

RUN apk add --no-cache git libxml2-dev libpng-dev freetype-dev

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/freetype
RUN docker-php-ext-install mysqli gd xml

USER www-data

RUN git clone https://github.com/NomisCZ/hlstatsx-community-edition.git hlxce-tmp \
    && cd hlxce-tmp \
    && git reset --hard ${HLXCE_VERSION} \
    && cd .. \
    && mv hlxce-tmp/web . \
    && rm -r hlxce-tmp web/updater

WORKDIR /var/www/html/web

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["php-fpm"]