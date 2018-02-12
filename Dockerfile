FROM node:8-alpine

MAINTAINER minuux <minuux@gmail.com>

ARG VERSION=3.2.3

LABEL version=$VERSION

RUN npm install --global gitbook-cli \
        gitbook-plugin-hide-element \
	gitbook-plugin-mermaid-gb3 &&\
	gitbook fetch ${VERSION} &&\
	npm cache clear --force &&\
	rm -rf /tmp/*

ADD . /gitbook
WORKDIR /gitbook
VOLUME /gitbook 

EXPOSE 4000 35729

CMD gitbook serve
