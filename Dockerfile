FROM python:3.7-alpine
MAINTAINER ntran@ntdt.fr

ARG ENV_FILE

ENV APP_DIR /env-viz
ENV FLASK_APP app.py
ENV FLASK_RUN_HOST 0.0.0.0
#ENV FLASK_ENV production 
ENV FLASK_ENV development
ENV ENV_CONFIG_FILE=${ENV_FILE:-"/opt/conf/env.conf"}

RUN apk add --no-cache gcc musl-dev linux-headers

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY scripts $APP_DIR/scripts
COPY static $APP_DIR/static
COPY templates $APP_DIR/templates
COPY app.py $APP_DIR

WORKDIR $APP_DIR
EXPOSE 5000

VOLUME [$ENV_CONFIG_FILE]

ENTRYPOINT  [ "./scripts/entrypoint.sh" ]