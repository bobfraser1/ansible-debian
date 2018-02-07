FROM python:2-slim-stretch

LABEL maintainer bobfraser1@gmail.com

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update -y \
    && apt-get install --no-install-recommends -y \
    ansible \
    && apt-get clean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* /tmp/* /root/.cache
CMD [ "/usr/bin/ansible", "--version" ]