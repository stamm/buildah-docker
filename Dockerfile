FROM ubuntu:focal-20200423

RUN apt-get update -qq && \
  apt-get -qq -y install wget gnupg2 && \
  echo 'deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_20.04/ /' > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list && \
  wget -nv https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable/xUbuntu_20.04/Release.key -O Release.key && \
  apt-key add - < Release.key && \
  apt-get update -qq && \
  apt-get -qq -y install buildah=1.14.9~1 && \
  apt-get remove --purge -y wget gnupg2 && \
  rm -rf /var/lib/apt/lists/*
