ARG RUBY_VERSION=3.3.0

FROM ruby:$RUBY_VERSION

WORKDIR /app

RUN apt-get update -qq && \
    apt-get install -y \
    build-essential \
    libpq-dev \
    postgresql-client \
    nodejs \
    yarnpkg \
    curl \
    git \
    libvips

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

ENV RAILS_ENV=production

EXPOSE 3000

CMD ["bash", "-c", "bundle exec rails db:migrate && bundle exec rails db:seed && bundle exec rails server -b 0.0.0.0 -p ${PORT:-3000}"]