FROM registry.cn-shenzhen.aliyuncs.com/juxuny-public/vim:base-v1.0.0
# install node
ADD node-v16.20.0-linux-x64.tar.gz /root/
ENV PATH=${PATH}:/root/node-v16.20.0-linux-x64/bin
# init vim plugin manager
RUN mkdir -p ~/.vim/autoload ~/.vim/bundle /root/gopath 
COPY ./pathogen.vim /root/.vim/autoload/pathogen.vim
COPY .vimrc /root/.vimrc
RUN cd /usr/local/lib && git clone https://github.com/egalpin/apt-vim.git

# install golang
ADD go1.18.10.linux-amd64.tar.gz /root/
ENV GOPATH=/root/gopath
ENV GOPROXY=https://goproxy.cn
ENV GOROOT=/root/go
ENV TERM=xterm-256color
ENV PATH=$PATH:/usr/local/lib/apt-vim:/root/.vimpkg/bin:$GOPATH/bin:$GOROOT/bin

RUN cd /usr/local/lib/apt-vim && apt-vim init
RUN apt-get install -y vim-nox mono-complete
#COPY install-plugins.sh /root/
#RUN bash /root/install-plugins.sh
#CMD ["/bin/bash"]
#ENTRYPOINT ["vim"]
RUN apt-vim install -y https://github.com/preservim/nerdtree.git
#apt-vim install -y https://github.com/ctrlpvim/ctrlp.vim.git
RUN apt-vim install -y https://github.com/groenewege/vim-less.git
RUN apt-vim install -y https://github.com/pangloss/vim-javascript.git
RUN apt-vim install -y https://github.com/vim-ruby/vim-ruby.git
RUN apt-vim install -y https://github.com/leafgarland/typescript-vim.git
RUN apt-vim install -y https://github.com/sophacles/vim-bundle-mako.git
RUN apt-vim install -y https://github.com/plasticboy/vim-markdown.git
RUN apt-vim install -y https://github.com/vim-scripts/nginx.vim.git
RUN apt-vim install -y https://github.com/rust-lang/rust.vim.git
RUN apt-vim install -y https://github.com/Vimjas/vim-python-pep8-indent.git
# install color themes
RUN apt-vim install -y https://github.com/vim-scripts/peaksea.git
RUN apt-vim install -y https://github.com/altercation/vim-colors-solarized.git
RUN apt-vim install -y https://github.com/vim-scripts/mayansmoke.git
RUN apt-vim install -y https://github.com/wesgibbs/vim-irblack.git

RUN apt-vim install -y https://github.com/mileszs/ack.vim.git
RUN apt-vim install -y https://github.com/itchyny/lightline.vim.git
RUN apt-vim install -y https://github.com/tpope/vim-commentary.git
RUN apt-vim install -y https://github.com/terryma/vim-multiple-cursors.git
RUN apt-vim install -y https://github.com/junegunn/fzf.vim.git
RUN apt-vim install -y https://github.com/peitalin/vim-jsx-typescript.git
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
RUN echo "\n\n\n" | ~/.fzf/install

#apt-vim install -y https://github.com/ycm-core/YouCompleteMe.git
RUN apt-vim install -y https://github.com/tabnine/YouCompleteMe.git
WORKDIR /root/.vim/bundle/YouCompleteMe 
#RUN cd ~/.vim/bundle/YouCompleteMe 
RUN git submodule update --init --recursive
RUN python3 install.py --all --force-sudo
RUN apt-vim install -y https://github.com/farmergreg/vim-lastplace.git
RUN npm -g install js-beautify

# git plugin
RUN apt-vim install -y https://github.com/tpope/vim-fugitive.git
# switch branch
RUN apt-vim install -y https://github.com/idanarye/vim-merginal.git
# vim-go
RUN apt-vim install -y https://github.com/fatih/vim-go.git
RUN apt-get install -y python3-pip
RUN pip3 install jedi
RUN apt-vim install -y https://github.com/davidhalter/jedi-vim.git
