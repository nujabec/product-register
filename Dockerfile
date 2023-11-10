FROM ruby:2.5

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    postgresql-client \
    yarn \
    # キャッシュを削除
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /product-register
COPY Gemfile Gemfile.lock /product-register/

RUN bundle install