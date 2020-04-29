FROM alpine:3.6

ARG CLI_VERSION=1.16.209

RUN apk -v --update add \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        jq \
        && \
    pip install --upgrade awscli==$CLI_VERSION s3cmd==2.0.1 python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*

VOLUME /root/.aws
VOLUME /project

WORKDIR /project

ENTRYPOINT ["aws"]