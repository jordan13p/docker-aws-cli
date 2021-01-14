FROM alpine:3.12

ARG CLI_VERSION=1.18.214

RUN apk -v --update add \
        python3 \
        py3-pip \
        groff \
        less \
        mailcap \
        jq \
        && \
    pip3 install --upgrade \
        awscli==$CLI_VERSION \
        s3cmd==2.0.1 \
        python-magic \
        click \
        datetime \
        requests \
        && \
    apk -v --purge del py-pip3 && \
    rm /var/cache/apk/*

VOLUME /root/.aws
VOLUME /project

WORKDIR /project

ENTRYPOINT ["aws"]