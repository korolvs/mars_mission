FROM ruby:2.3

ENV APP_NAME rubytest

RUN apt-get update -qq && apt-get install -y build-essential

RUN mkdir /$APP_NAME
WORKDIR /$APP_NAME

ADD Gemfile /$APP_NAME/Gemfile
ADD Gemfile.lock /$APP_NAME/Gemfile.lock
RUN bundle install
ADD . /$APP_NAME
CMD ["ruby", "app.rb"]