FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
COPY source.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y tzdata vim git ruby-full gem ruby-dev curl python ack-grep build-essential cmake python3-dev openjdk-11-jdk
COPY install-nvm.sh /root/install-nvm.sh
RUN chmod +x /root/install-nvm.sh && /root/install-nvm.sh
RUN rm /root/install-nvm.sh
