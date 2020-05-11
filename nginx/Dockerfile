FROM nginx:stable-alpine

ARG HLXCE_VERSION='cea346f887289041d9a34273b77634d0d03fae16'

ENV HLXCE_VERSION ${HLXCE_VERSION}

COPY default.conf /etc/nginx/conf.d/default.conf

RUN apk add git

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

RUN git clone https://github.com/NomisCZ/hlstatsx-community-edition.git hlxce-tmp \
    && cd hlxce-tmp \
    && git reset --hard ${HLXCE_VERSION} \
    && cd .. \
    && mv hlxce-tmp/web . \
    && rm -r hlxce-tmp web/updater

WORKDIR /var/www/html/web