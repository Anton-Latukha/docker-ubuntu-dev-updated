FROM ubuntu:17.04
MAINTAINER Anton Latukha <anton.latukha+docker@gmail.com>

# Caching layers
RUN apt-get update
RUN apt-get upgrade
