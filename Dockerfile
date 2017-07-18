FROM ruby:latest

RUN mkdir /app
WORKDIR /app

ADD . /app
RUN bundle

EXPOSE 9292

CMD ["rackup", "-o", "0.0.0.0", "-p", "9292"]
