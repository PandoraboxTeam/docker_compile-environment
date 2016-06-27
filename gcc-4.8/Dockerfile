FROM ubuntu:14.04

MAINTAINER Arylo Yeung <arylo.open@gmail.com>

LABEL \
  UPDATE_DATE=2016-06-27

ENV \
  LIB_PATH=/work \
  WORK_PATH=/USER

ARG user=pandorabox
ARG group=pandorabox
ARG uid=1000
ARG gid=1000

# Use chinese repo
# RUN \
#   sed -i "s/archive.ubuntu.com/cn.archive.ubuntu.com/g" /etc/apt/sources.list

# Run automated install script
RUN \
  apt-get update && \
  apt-get install -y curl && \
  curl -sL https://raw.githubusercontent.com/PandoraboxTeam/Compile-Environment/master/gcc-4.8/ubuntu.sh | bash

# Clear cache
RUN \
  apt-get clean && \
  apt-get autoclean && \
  apt-get autoremove && \
  rm -rf /tmp/*

RUN \
  mkdir -p $LIB_PATH && \
  mkdir -p $WORK_PATH && \
  mkdir -p /home/${user}

RUN groupadd -g ${gid} ${group} && \
  useradd -d "/home/${user}" -u ${uid} -g ${gid} -m -s /bin/bash ${user} && \
  chown ${user}:${user} /home/${user} && \
  chown ${user}:${user} $WORK_PATH
USER ${user}

EXPOSE 21

VOLUME ["${LIB_PATH}", "${WORK_PATH}"]

WORKDIR $WORK_PATH
