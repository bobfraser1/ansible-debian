FROM python:2.7-slim-stretch

LABEL maintainer bobfraser1@gmail.com

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update -y \
    && apt-get install --no-install-recommends -y \
    openssh-client \
    && apt-get clean \
    && apt-get autoremove -y \
    && pip install -U pip \
    && pip install pyOpenSSL ansible \
    && rm -rf /var/lib/apt/lists/* /tmp/* /root/.cache
CMD [ "/usr/local/bin/ansible", "--version" ]
