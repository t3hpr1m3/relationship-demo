FROM ruby:2.2.1

RUN apt-get update && apt-get install -y \
	ca-certificates \
	nodejs \
	sqlite3 \
	--no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle install

ADD . /usr/src/app

EXPOSE 3000

CMD ["bundle", "exec", "unicorn", "-c", "config/unicorn.rb", "-p", "3000"]
