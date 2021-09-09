FROM python:alpine

WORKDIR /usr/src/app

# Create the app user
# RUN addgroup -S app && adduser -S -G app app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV BOTO_CONFIG=/dev/null

RUN apk update && apk add postgresql py3-pip postgresql-dev gcc python3-dev musl-dev

RUN pip install --upgrade pip
COPY requirements.txt .
RUN pip install -r requirements.txt
# RUN pip3 freeze

COPY ./entrypoint.sh .
RUN sed -i 's/\r$//g' ./entrypoint.sh
RUN chmod +x ./entrypoint.sh

COPY . .

# RUN chown -R app:app .
# USER app
# RUN psql -c 'create database helios;' -U postgres

# EXPOSE 3000

# CMD python3 -Wall manage.py test -v 2
ENTRYPOINT ["./entrypoint.sh"]