apt-vim install -y https://github.com/preservim/nerdtree.git
#apt-vim install -y https://github.com/ctrlpvim/ctrlp.vim.git
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

apt-vim install -y https://github.com/ycm-core/YouCompleteMe.git
# apt-get update && apt-get install -y build-essential cmake python3-dev nodejs openjdk-11-jdk
apt-get install -y npm
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
python3 install.py --all
