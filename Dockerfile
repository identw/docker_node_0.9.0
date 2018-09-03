FROM ubuntu:16.04
MAINTAINER Dmitry Sergeev <identw@gmail.com>
ENV DEBIAN_FRONTEND noninteractive 

RUN apt-get update && \
    apt-get install -y wget build-essential python && \
    wget https://nodejs.org/dist/v0.9.0/node-v0.9.0.tar.gz && \
    gzip -d node-v0.9.0.tar.gz -c | tar -x && \
    cd node-v0.9.0 && \
    ./configure && \
    make && \
    make install && \
    apt-get purge -y wget build-essential && \
    apt-get --purge autoremove -y && \
    apt-get clean && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf node-v0.9.0 node-v0.9.0.tar.gz
