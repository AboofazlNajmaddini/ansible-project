FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    software-properties-common \
    docker.io \
    sshpass \
    curl \
    && apt-add-repository --yes --update ppa:ansible/ansible \
    && apt-get install -y ansible \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /ansible

COPY . /ansible

CMD ["tail", "-f", "/dev/null"]