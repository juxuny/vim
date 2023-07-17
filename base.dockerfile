FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
ENV NAME=vim
ENV UID=1000
ENV GID=1000
RUN groupadd -g $GID -o $NAME
RUN useradd -m -u $UID -g $GID -o -s /bin/bash $NAME
RUN mkdir -p /home/vim && chown -R $UID:$GID /home/vim
COPY source.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y tzdata git ruby-full gem ruby-dev curl python ack-grep build-essential cmake python3-dev openjdk-11-jdk
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:jonathonf/vim
RUN apt-get update && apt-get install -y  vim
RUN apt-get install -y python3-pip
RUN cd /usr/local/lib && git clone https://github.com/egalpin/apt-vim.git
ENV PATH=$PATH:/usr/local/lib/apt-vim
RUN cd /usr/local/lib/apt-vim && apt-vim init

USER vim
ENV HOME=/home/vim
WORKDIR $HOME
