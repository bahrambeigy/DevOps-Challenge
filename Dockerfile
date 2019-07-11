FROM python:3.7-alpine
LABEL maintainer="Bahram Bahrambeigy <bahram@bahrambeigy.ir>"

ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name="DevOps-Challenge" \
      org.label-schema.vendor="TradeByte" \
      org.label-schema.url="https://www.tradebyte.com/en/" \
      org.label-schema.description="This is a challenge from Tradebyte" \
      org.label-schema.vcs-ref="${VCS_REF}" \
      org.label-schema.build-date="${BUILD_DATE}" \
      org.label-schema.schema-version="1.0" \
      org.label-schema.license="GPL"

#### ENVs
ARG ENVIRONMENT
ENV ENVIRONMENT         ${ENVIRONMENT:-DEV}

ARG HOST
ENV HOST         ${HOST:-localhost}

ARG PORT
ENV PORT         ${PORT:-8000}

ARG REDIS_HOST
ENV REDIS_HOST         ${REDIS_HOST:-localhost}

ARG REDIS_PORT
ENV REDIS_PORT         ${REDIS_PORT:-6379}

ARG REDIS_DB
ENV REDIS_DB         ${REDIS_DB:-0}


#### Start the build process
USER root

WORKDIR "/srv"

COPY [ ".", "/srv" ]

COPY [ "./docker/wait_for_redis.sh", "/wait_for_redis.sh" ]


RUN set -eux && apk add bash redis && pip install -r requirements.txt

EXPOSE 8000/TCP

CMD [ "python", "hello.py" ]
