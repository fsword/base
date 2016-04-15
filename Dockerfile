FROM ruby:2.3
MAINTAINER li.jianye@gmail.com 2016.4.16.

COPY sources.list /etc/apt/sources.list
RUN apt-get update && \
    apt-get install vim -y && \
    gem source -r https://rubygems.org/ && \
    gem source -a https://ruby.taobao.org/ 

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD COPY Gemfile /usr/src/app/
ONBUILD COPY Gemfile.lock /usr/src/app/
ONBUILD RUN bundle install


