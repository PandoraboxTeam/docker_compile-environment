FROM ubuntu:14.04

MAINTAINER Arylo Yeung <arylo.open@gmail.com>

LABEL \
  UPDATE_DATE=2016-06-21

ENV \
  LIB_PATH=/work \
  WORK_PATH=/USER

ADD https://raw.githubusercontent.com/PandoraboxTeam/Compile-Environment/master/ubuntu.sh /tmp/

RUN \
  sed -i "s/archive.ubuntu.com/cn.archive.ubuntu.com/g" /etc/apt/sources.list && \
  bash /tmp/ubuntu.sh &&\
  apt-get clean && \
  apt-get autoclean & \
  rm -rf /tmp/ubuntu.sh && \
  rm -rf /var/cache/apt/archives/partial

RUN \
  mkdir -p $LIB_PATH && \
  mkdir -p $WORK_PATH

EXPOSE 21

VOLUME ["${LIB_PATH}", "${WORK_PATH}"]

WORKDIR $WORK_PATH
