#!/bin/bash
set -x
cat install-nvm.sh |bash
cat bashrc.expand >> ~/.bashrc
source ~/.nvm/nvm.sh
nvm install v19.1.0
nvm install v16.20.0
