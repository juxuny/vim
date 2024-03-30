# Vim in Docker

## Usage

## Pull image from docker hub


```bash
docker run --rm -it -w /work -v ${PWD}:/work  juxuny/vim /bin/bash
```

### Build from source

```bash
git clone https://github.com/juxuny/vim.git
./build-tabnine.sh

# run vim in current direcory
#docker run --rm -it -w /work -v ${PWD}:/work  vim /bin/bash
docker run --rm -it \
  --user $(id -u):$(id -g)
  -w /work -v ${PWD}:/work \
  --entrypoint vim \
  -v /etc/passwd:/etc/passwd:ro \
  -v /etc/group:/etc/group:ro  \
  registry.cn-shenzhen.aliyuncs.com/juxuny-public/vim:v1.11.3 \
  "$@"

# use for developing golang
docker run --rm -it \
        --user $(id -u):$(id -g) \
        -w /work  \
        -v ${PWD}:/work \
        --entrypoint bash \
        -e JAVA_HOME=/home/vim/jdk/jdk-11.0.18 \
        -e MAVEN_HOME=/home/vim/maven/apache-maven-3.9.4 \
        -v /etc/passwd:/etc/passwd:ro \
        -v $GOPATH:/home/vim/gopath \
        -v $HOME/.nvim/maven:/home/vim/maven \
        -v $HOME/.nvim/jdk:/home/vim/jdk \
        -v /etc/group:/etc/group:ro  \
        registry.cn-shenzhen.aliyuncs.com/juxuny-public/vim:v1.15.4 \
        "$@"
```

## v1.15.4 

* add plugins
  * support cql
  * npm prettier format file


## v1.11.3 

* add key map
  * C-Y, C-B 
  * C-H, C-L: Left or Right

## v1.8.0

* add coc-protobuf

## v1.7.6

* add coc-clangd

## v1.7.4

* fix coc-nvim gopls execute args

## go1.20-v1.7.3

* add key map:
  * <F5>: *.tsx file reorder import

## go1.20-v1.7.1

* add key map:
  * gr :GoRefer
  * gd: :GoDef
  * gi : GoImplements

### v1.6.0

* shortcut 
  * F2 jump to next errors (https://github.com/dense-analysis/ale)

### v1.5.0 

* shortcut: 
  * gr: go to references
  * gd: go to definition
  * gi: go to implement
  * ctrl+h: history / recent files  


### v1.4.0

* use `coc.nvim` and `coc-tabnine`
* built-in coc extansions:
  * `coc-tabnine`
  * `coc-tsserver`
  * `coc-json`
  * `coc-html`
  * `coc-sql`
  * `coc-lua`
  * `coc-css`
  * `coc-less`
  * `coc-sass`
  * `coc-eslint`
  * `coc-wxml`
  * `coc-xml`
  * `coc-stylelint`
  * `coc-tslint`
  * `coc-go`
  * `coc-php`
  * `coc-sh`
  * `coc-flutter`
  * `coc-dlang`
  * `coc-java`
  * `coc-markdownlint`
  * `coc-pylsp`
  * `coc-snippets`

### v1.2.0

* add *jedi-vim* and *pip3*
* *F1* restart go-lsp
* *gr* :GoReferrers
* *tt* NERDTreeToggle
* add *vim-go* plugin, :GoDef, :GoDoc, :GoReferrers
* *Ctrl + B* git branch switcher
* show branch name on statusline
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




