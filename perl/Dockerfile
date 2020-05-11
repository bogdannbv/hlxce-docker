ARG PERL_VERSION=5.20.2
FROM perl:${PERL_VERSION}

RUN apt-get update && apt-get -y install libdbd-mysql-perl unzip

RUN cpanm MaxMind::DB::Reader
RUN cpanm GeoIP2::Database::Reader
RUN cpanm Syntax::Keyword::Try
RUN cpanm DBI
RUN cpanm DBD::mysql