FROM ruby:2.2.2
MAINTAINER li.jianye@gmail.com 2015.7.28.

COPY sources.list /etc/apt/sources.list

RUN ["apt-get", "update"]
RUN ["apt-get", "install", "nano", "libmysqlclient-dev", "locales", "-y", "-q"]

RUN gem source -r https://rubygems.org/ \
        && gem source -a http://ruby.taobao.org

RUN echo 'zh_CN.UTF-8 UTF-8' >> /etc/locale.gen \
        && echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen \
        && locale-gen

# throw errors if Gemfile has been modified since Gemfile.lock
# RUN bundle config --global frozen 1
RUN mkdir -p /opt/bin /opt/app

ENV TERM xterm
ENV LC_ALL zh_CN.UTF-8

COPY bin/* /opt/bin/
WORKDIR /opt/app

EXPOSE 9292

ONBUILD COPY . /opt/app
ONBUILD RUN bundle install
