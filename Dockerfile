FROM ruby:2.7
WORKDIR /app
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
COPY Gemfile Gemfile.lock ./
RUN bundle install 
COPY . .
RUN cat config/database.yml
RUN rails db:create
RUN rails db:migrate
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]


