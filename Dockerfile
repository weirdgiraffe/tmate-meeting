FROM ubuntu:14.04
MAINTAINER gr4ph3 version: 0.1
# install tmate
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common
RUN DEBIAN_FRONTEND=noninteractive add-apt-repository ppa:tmate.io/archive
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y ssh tmate vim 
RUN ssh-keygen -t ecdsa -N "" -f /root/.ssh/id_ecdsa
ADD bash.bashrc /etc/bash.bashrc
ADD tmux.conf /etc/tmux.conf
ADD show-session /usr/bin/show-session
# install other things
# maybe copy tmux.conf into docker
# ADD tmux.conf /etc/tmux.conf
# go there, start tmate and give us a code
RUN mkdir /meeting
WORKDIR /meeting
ENTRYPOINT ["/usr/bin/tmate"]

