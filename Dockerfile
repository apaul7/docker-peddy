FROM python:3
MAINTAINER Alexander Paul <alex.paul@.wustl.edu>

LABEL \
  description="Peddy docker image"

RUN apt-get update && apt-get install -y \
  build-essential

ENV PEDDY_VERSION=0.4.3

WORKDIR /opt

RUN wget https://github.com/brentp/peddy/archive/v${PEDDY_VERSION}.tar.gz \
  && tar -zxvf v${PEDDY_VERSION}.tar.gz \
  && rm v${PEDDY_VERSION}.tar.gz \
  && cd peddy-${PEDDY_VERSION} \
  && pip install -r requirements.txt \
  && pip install --editable .

WORKDIR /

