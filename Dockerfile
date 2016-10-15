FROM ruby:2.3

RUN gem update --system
RUN gem install bundler

# Cache bundle install
COPY Gemfile* /tmp/
WORKDIR /tmp
RUN bundle install

# Add repository files
ADD . /app
WORKDIR /app

EXPOSE 9292
CMD ruby app.rb
