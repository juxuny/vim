FROM registry.cn-shenzhen.aliyuncs.com/juxuny-public/vim:base-v1.2.0
USER root
ADD entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT /usr/bin/entrypoint.sh

# install node
ADD node-v16.20.0-linux-x64.tar.gz $HOME
ENV PATH=${PATH}:$HOME/node-v16.20.0-linux-x64/bin
RUN chown -R $UID:$GID $HOME
USER vim
# init vim plugin manager
RUN cd /usr/local/lib/apt-vim && apt-vim init
RUN mkdir -p ${HOME}/.vim/autoload $HOME/.vim/bundle $HOME/gopath 
COPY ./pathogen.vim $HOME/.vim/autoload/pathogen.vim
COPY .vimrc $HOME/.vimrc

# install golang
# ADD go1.18.10.linux-amd64.tar.gz $HOME
ADD go1.20.8.linux-amd64.tar.gz $HOME
ENV GOPATH=$HOME/gopath
ENV GOPROXY=https://goproxy.cn
ENV GOROOT=$HOME/go
ENV TERM=xterm-256color
ENV PATH=$PATH:$HOME/.vimpkg/bin:$GOPATH/bin:$GOROOT/bin

RUN apt-vim install -y https://github.com/preservim/nerdtree.git
#RUN apt-vim install -y https://github.com/ctrlpvim/ctrlp.vim.git
RUN apt-vim install -y https://github.com/groenewege/vim-less.git
RUN apt-vim install -y https://github.com/pangloss/vim-javascript.git
RUN apt-vim install -y https://github.com/vim-ruby/vim-ruby.git
RUN apt-vim install -y https://github.com/leafgarland/typescript-vim.git
RUN apt-vim install -y https://github.com/sophacles/vim-bundle-mako.git
RUN apt-vim install -y https://github.com/plasticboy/vim-markdown.git
RUN apt-vim install -y https://github.com/vim-scripts/nginx.vim.git
RUN apt-vim install -y https://github.com/rust-lang/rust.vim.git
#RUN apt-vim install -y https://github.com/Vimjas/vim-python-pep8-indent.git
# install color themes
RUN apt-vim install -y https://github.com/vim-scripts/peaksea.git
RUN apt-vim install -y https://github.com/altercation/vim-colors-solarized.git
RUN apt-vim install -y https://github.com/vim-scripts/mayansmoke.git
#RUN apt-vim install -y https://github.com/joshdick/onedark.nvim.git
RUN apt-vim install -y https://github.com/joshdick/onedark.vim.git
RUN apt-vim install -y https://github.com/wesgibbs/vim-irblack.git

RUN apt-vim install -y https://github.com/mileszs/ack.vim.git
RUN apt-vim install -y https://github.com/itchyny/lightline.vim.git
RUN apt-vim install -y https://github.com/tpope/vim-commentary.git
RUN apt-vim install -y https://github.com/terryma/vim-multiple-cursors.git
RUN apt-vim install -y https://github.com/junegunn/fzf.vim.git
RUN apt-vim install -y https://github.com/peitalin/vim-jsx-typescript.git
RUN apt-vim install -y https://github.com/dense-analysis/ale.git
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
RUN echo "\n\n\n" | ~/.fzf/install

RUN npm -g install js-beautify
RUN apt-vim install -y https://github.com/idanarye/vim-merginal.git
# vim-go
RUN apt-vim install -y https://github.com/fatih/vim-go.git
RUN pip3 install jedi
RUN apt-vim install -y https://github.com/neoclide/coc.nvim.git
RUN npm config set registry http://registry.npmmirror.com
RUN npm install -g yarn
RUN cd $HOME/.vim/bundle/coc.nvim && yarn install
RUN vim +'GoInstallBinaries' +qall
WORKDIR $HOME
COPY coc-settings.json /home/vim/.vim/coc-settings.json
COPY *.vim .
RUN vim -s init.vim 
ADD clangd-linux-16.0.2.zip .
RUN ls -lha
RUN if [ -f clangd-linux-16.0.2.zip ]; then unzip clangd-linux-16.0.2.zip; fi
RUN mv clangd_16.0.2/bin/clangd /usr/local/bin && rm -rf clangd_16.0.2

# install nvm
COPY install-nvm.sh .
COPY install-nvm-wrapper.sh .
COPY bashrc.expand .
RUN cat install-nvm-wrapper.sh | bash


USER root 
RUN chown -R vim:vim /home/vim
USER vim
RUN mkdir -p $HOME/.cache && chmod 777 $HOME/.cache

