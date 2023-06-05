FROM jrei/systemd-debian:buster

LABEL maintainer="admin@websupport.sk"
LABEL version="0.1"
LABEL description="Docker image for galera manager."
WORKDIR /root

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y
RUN apt install wget -y

RUN wget https://galeracluster.com/galera-manager/gm-installer && chmod +x gm-installer
COPY answers.yaml answers.yaml
RUN ./gm-installer install --answers-file answers.yaml --show-command-output