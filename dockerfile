FROM ruby:2.6.1


ENV LANG C.UTF-8
RUN apt-get update -qq && apt-get install -y wget lsb-release gnupg build-essential libpq-dev nodejs


# https://github.com/nodesource/distributions#installation-instructions
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
        && apt-get install -y nodejs

RUN wget https://dev.mysql.com/get/mysql-apt-config_0.8.10-1_all.deb
RUN apt -y update
RUN apt install -y mysql-client

RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
RUN bundle update
COPY . /myapp
# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
