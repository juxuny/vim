FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y tzdata vim git ruby-full gem ruby-dev curl golang curl python ack-grep build-essential cmake python3-dev nodejs openjdk-11-jdk
RUN apt-get install -y npm
RUN mkdir -p ~/.vim/autoload ~/.vim/bundle /root/gopath 
COPY ./pathogen.vim /root/.vim/autoload/pathogen.vim

COPY .vimrc /root/.vimrc
RUN cd /usr/local/lib && git clone https://github.com/egalpin/apt-vim.git

ENV GOPATH=/root/gopath
ENV GOPROXY=https://goproxy.cn
ENV TERM=xterm-256color
ENV PATH=$PATH:/usr/local/lib/apt-vim:/root/.vimpkg/bin:$GOPATH/bin

RUN cd /usr/local/lib/apt-vim && apt-vim init
COPY install-plugins.sh /root/
RUN bash /root/install-plugins.sh
CMD ["/bin/bash"]
ENTRYPOINT ["vim"]
