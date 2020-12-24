FROM ruby:2.6.5

RUN apt-get update && \
    apt-get clean && \
    apt-get install -y postgresql-client && \
    gem install bundler

RUN mkdir /app
ENV APP_ROOT /app
WORKDIR $APP_ROOT

ENV BUNDLE_GEMFILE=/app/Gemfile \
    BUNDLE_JOBS=2 \
    BUNDLE_PATH=/bundle \
    RAILS_ENV=development

ADD Gemfile* $APP_ROOT/
RUN bundle install

ADD . /app/
