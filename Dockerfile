FROM python:alpine

WORKDIR /usr/src/app

RUN apk update && apk add postgresql py3-pip postgresql-dev gcc python3-dev musl-dev

EXPOSE 3000
COPY . ./

ENV BOTO_CONFIG /dev/null

RUN pip3 install -r requirements.txt
RUN pip3 freeze

# USER root
# RUN psql -c 'create database helios;' -U postgres

CMD python3 -Wall manage.py test -v 2
