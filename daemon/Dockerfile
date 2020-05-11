ARG PERL_VERSION=5.20.2
FROM bogdannbv/hlxce-perl:${PERL_VERSION}

ARG HLXCE_VERSION='cea346f887289041d9a34273b77634d0d03fae16'
ARG HLXCE_USER='hlxce'

ENV HLXCE_VERSION ${HLXCE_VERSION}
ENV HLXCE_USER ${HLXCE_USER}
ENV HLXCE_PORT ${HLXCE_PORT}

ENV MAX_MIND_API_KEY 'secret'

ENV DB_HOST 'localhost:3306'
ENV DB_DATABASE 'hlxce'
ENV DB_USERNAME 'hlxce'
ENV DB_PASSWORD 'secret'

COPY ./docker-entrypoint.sh /usr/local/bin/

RUN useradd -m -d /home/${HLXCE_USER} ${HLXCE_USER}
WORKDIR /home/${HLXCE_USER}
USER ${HLXCE_USER}

RUN git clone https://github.com/NomisCZ/hlstatsx-community-edition.git hlxce-tmp \
    && cd hlxce-tmp \
    && git reset --hard ${HLXCE_VERSION} \
    && cd .. \
    && mv hlxce-tmp/scripts . \
    && rm -r hlxce-tmp

WORKDIR /home/${HLXCE_USER}/scripts

RUN chmod +x hlstats.pl GeoLiteCity/install_binary.sh

RUN find . -type f -name '*.pl' -exec sed -i 's/#!\/usr\/bin\/perl/#!\/usr\/bin\/env\ perl/' {} +

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 27500/udp

CMD ["./hlstats.pl", "--configfile=hlstats.conf", "--port=27500"]