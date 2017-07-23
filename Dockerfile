FROM ruby:2.4-alpine

RUN apk update && apk add build-base nodejs postgresql-dev

RUN mkdir /app
WORKDIR /app

COPY Gemfile* ./
RUN bundle install --system

COPY . .

LABEL maintainer="Andrew Porter <partydrone@me.com>"

CMD ["puma", "-C", "config/puma.rb"]
