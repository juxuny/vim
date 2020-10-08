vim in docker
=============

### Usage


##### Pull image from docker hub

```bash
docker run --rm -it -w /work -v ${PWD}:/work  juxuny/vim /bin/bash
```

##### Build from source

```bash
git clone https://github.com/juxuny/vim.git
docker build -t vim . -f Dockerfile

# run vim in current direcory
docker run --rm -it -w /work -v ${PWD}:/work  vim /bin/bash
```

### plugins install 

```bash
apt-vim install -y https://github.com/preservim/nerdtree.git
apt-vim install -y https://github.com/ctrlpvim/ctrlp.vim.git
apt-vim install -y https://github.com/groenewege/vim-less.git
apt-vim install -y https://github.com/pangloss/vim-javascript.git
apt-vim install -y https://github.com/vim-ruby/vim-ruby.git
apt-vim install -y https://github.com/leafgarland/typescript-vim.git
apt-vim install -y https://github.com/sophacles/vim-bundle-mako.git
apt-vim install -y https://github.com/plasticboy/vim-markdown.git
apt-vim install -y https://github.com/vim-scripts/nginx.vim.git
apt-vim install -y https://github.com/rust-lang/rust.vim.git
apt-vim install -y https://github.com/Vimjas/vim-python-pep8-indent.git
apt-vim install -y https://github.com/altercation/vim-colors-solarized.git
apt-vim install -y https://github.com/mileszs/ack.vim.git
apt-vim install -y https://github.com/itchyny/lightline.vim.git
apt-vim install -y https://github.com/tpope/vim-commentary.git
apt-vim install -y https://github.com/terryma/vim-multiple-cursors.git
apt-vim install -y https://github.com/junegunn/fzf.vim.git
# apt-vim install -y https://github.com/fatih/vim-go.git
apt-vim install -y https://github.com/peitalin/vim-jsx-typescript.git
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
echo "\n\n\n" | ~/.fzf/install

apt-vim install -y https://github.com/ycm-core/YouCompleteMe.git
# apt-get update && apt-get install -y build-essential cmake python3-dev nodejs openjdk-11-jdk
apt-get install -y npm
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
python3 install.py --all
```

### latest

* reopen files at your last edit position
* autoindent
* *Ctrl + o* create a new line in normal or insert mode
* Add Plugin jsx
* *Ctrl + T* run command `:NERDTreeToggle`, toogle the directory tree


### Version 1.0.1

* Remove ctrlp.vim

### Version 1.0.0

* Add YouCompleteMe Plugin

### Version 0.0.2

* default color theme is [solarized](https://github.com/altercation/vim-colors-solarized.git)
* *Ctrl + N* open new file
* *Ctrl + Shift + F* search content in directory
* *Ctrl + 6* switch to last file

