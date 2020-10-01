apt-vim install -y https://github.com/ycm-core/YouCompleteMe.git
# apt-get update && apt-get install -y build-essential cmake python3-dev nodejs openjdk-11-jdk
apt-get install -y npm
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
python3 install.py --all
