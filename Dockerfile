# syntax = docker/dockerfile:1
FROM ruby:3.3.3
# ARG for Ruby version and Rails environment
# ARG RUBY_VERSION=3.3.3

#debian系のためapt-getを使用してnode.jsとyarnをインストール
RUN apt-get update -qq
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
&& apt-get install -y nodejs
RUN npm install --global yarn

#docker内の作業ディレクトリを作成＆設定
WORKDIR /rails

#Gemfile,Gemfile.lockをローカルからCOPY
COPY Gemfile Gemfile.lock .

#コンテナ内にコピーしたGemfileを用いてbundle install
RUN bundle install
RUN rm -f /rails/tmp/pids/server.pid

#railsを起動する
CMD ["rails", "server", "-b", "0.0.0.0"]
