FROM postgres:11

LABEL maintainer="Hugo Baltz"

RUN mkdir -p /tmp/psql_data/

COPY data/data.json /tmp/psql_data/

COPY init_data.sql /docker-entrypoint-initdb.d/