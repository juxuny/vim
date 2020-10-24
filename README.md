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

### latest

* add git plugin: `tpope/vim-fugitive`
* don't ignore '.gitignore' file when using *Ctrl + N* open another file
* *Ctrl + n* add a new line above
* *fmt* format javascript file
* set yaml file comment string as '#'
* *Ctrl + h* jump to the beginning of a line
* *Ctrl + l* jump to the end of a line

### v1.0.2

* add colorscheme `peaksea`, and set 'peaksea' as default colorscheme
* *Ctrl + j* scroll down 20 lines
* *Ctrl + k* scroll up 20 lines
* reopen files at your last edit position
* autoindent
* *Ctrl + o* create a new line in normal or insert mode
* Add Plugin jsx
* *Ctrl + T* run command `:NERDTreeToggle`, toogle the directory tree


### v1.0.1

* Remove ctrlp.vim

### v1.0.0

* Add YouCompleteMe Plugin

### v0.0.2

* default color theme is [solarized](https://github.com/altercation/vim-colors-solarized.git)
* *Ctrl + N* open new file
* *Ctrl + Shift + F* search content in directory
* *Ctrl + 6* switch to last file

