FROM ruby:2.6.3

ARG RAILS_ENV
ARG RAILS_MASTER_KEY

ENV APP_ROOT /app

ENV RAILS_ENV ${RAILS_ENV}
ENV RAILS_MASTER_KEY ${RAILS_MASTER_KEY}

WORKDIR $APP_ROOT

RUN apt-get update -qq && apt-get install -y \
  build-essential libpq-dev apt-transport-https

RUN \
  curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
  apt-get install -y nodejs

RUN  \
  apt-get update && apt-get install -y curl apt-transport-https wget && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get install -y yarn

# RUN \
#   apt-get update && apt-get install -y \
#   nodejs \
#   yarn \
#   --no-install-recommends && \
#   rm -rf /var/lib/apt/lists/*

# RUN apt-get update
# RUN apt-get install -y nodejs --no-install-recommends
# RUN apt-get install -y yarn --no-install-recommends
# RUN rm -rf /var/lib/apt/lists/*

ADD Gemfile $APP_ROOT
ADD Gemfile.lock $APP_ROOT

RUN \
  gem install bundler -v 2.1.2 && \
  bundle install && \
  rm -rf ~/.gem

ADD . $APP_ROOT

RUN if [ "${RAILS_ENV}" = "production" ]; then bundle exec rails assets:precompile assets:clean; else export RAILS_ENV=development; fi

EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]