ARG HLXCE_DAEMON_VERSION='cea346f887289041d9a34273b77634d0d03fae16'
FROM bogdannbv/hlxce-daemon:${HLXCE_DAEMON_VERSION}

COPY docker-entrypoint.sh /usr/local/bin

RUN chmod +x hlstats-awards.pl

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["./hlstats-awards.pl", "--configfile=hlstats.conf"]