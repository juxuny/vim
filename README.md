vim in docker
=============

### Usage

```bash
docker run --rm -it -w /work -v ${PWD}:/work  juxuny/vim:latest /bin/bash
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
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
echo "\n\n\n" | ~/.fzf/install
```

### Version 0.0.2

* default color theme is [solarized](https://github.com/altercation/vim-colors-solarized.git)
* *Ctrl + N* open new file
* *Ctrl + Shift + F* search content in directory
* *Ctrl + 6* switch to last file
