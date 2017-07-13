FROM ubuntu:17.04
MAINTAINER Anton Latukha <anton.latukha+docker@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

# Tracking all changes
RUN apt update
RUN apt --yes upgrade
RUN apt --yes autoclean
RUN apt --yes autoremove

# Caching layers
RUN apt-get update
RUN apt-get upgrade
