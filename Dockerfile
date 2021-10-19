FROM ruby:2.5-alpine

RUN apk add --no-cache build-base gcc bash cmake git

EXPOSE 4000

# Creating Application Source Code Directory
RUN mkdir -p /srv/jekyll

# Setting Home Directory for containers
WORKDIR /srv/jekyll

RUN gem install jekyll -v 3.8

RUN gem install kramdown
RUN gem install rouge
RUN gem install pygments.rb
RUN gem install jekyll-paginate-v2


# Copying src code to Container
COPY . /srv/jekyll

#RUN jekyll build --incremental

CMD jekyll serve --incremental
