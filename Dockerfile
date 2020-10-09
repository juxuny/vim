FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y tzdata vim git ruby-full gem ruby-dev curl golang curl python ack-grep build-essential cmake python3-dev nodejs openjdk-11-jdk
RUN apt-get install -y npm
RUN mkdir -p ~/.vim/autoload ~/.vim/bundle 
COPY ./pathogen.vim /root/.vim/autoload/pathogen.vim

RUN mkdir -p /root/gopath
COPY .vimrc /root/.vimrc
WORKDIR /usr/local/lib
RUN git clone https://github.com/egalpin/apt-vim.git
WORKDIR /usr/local/lib/apt-vim

ENV GOPATH=/root/gopath
ENV GOPROXY=https://goproxy.cn
ENV TERM=xterm-256color
ENV PATH=$PATH:/usr/local/lib/apt-vim:/root/.vimpkg/bin:$GOPATH/bin

RUN apt-vim init
COPY install-plugins.sh /root/
RUN bash /root/install-plugins.sh
CMD ["vim"]
