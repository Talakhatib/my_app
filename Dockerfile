# syntax=docker/dockerfile:1
FROM ruby:3.0.4
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /my_app
COPY Gemfile /my_app/Gemfile
COPY Gemfile.lock /my_app/Gemfile.lock
RUN bundle install


EXPOSE 3000

# Configure the main process to run when running the image
CMD bundle exec rails server