# Vim in Docker

## Usage

### Pull image from docker hub


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
```

## Examples

### Use for Golang Develoment
```shell
docker run --rm -it \
        --user $(id -u):$(id -g) \
        -w /work  \
        -v ${PWD}:/work \
        --entrypoint vim \
        -v /etc/passwd:/etc/passwd:ro \
        -v $GOPATH:/home/vim/gopath \
        -v /etc/group:/etc/group:ro  \
        registry.cn-shenzhen.aliyuncs.com/juxuny-public/vim:v1.16.0 \
        "$@"
```

## v1.16.1

* ,n for Reveal file in tree
* open NERDTree default
* rm plugins: coc-less, coc-sass, coc-php, coc-pylsp, coc-rename


    
## v1.15.4 
### Use for QEMU development

```shell
# Ubuntu 22.04
git clone https://github.com/qemu/qemu.git
cd qemu
sudo apt install python3-venv flex bison libsdl2-dev ninja-build libjpeg-dev libpixman-1-dev libslirp-dev python3-pip libnfs-dev libbz2-dev libepoxy-dev libibumad-dev
pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
pip3 install sphinx==5.3.0
pip3 install sphinx_rtd_theme==1.1.1
pip3 install meson
pip3 install jinja2
pip3 install requests
./configure --enable-vnc --enable-vnc-jpeg --enable-user --enable-slirp --enable-kvm --enable-opengl --enable-libudev --enable-bzip2 --enable-vhost-user --enable-user --enable-vhost-net --enable-libnfs --enable-system
make -j175


docker run --rm -it \
        --user $(id -u):$(id -g) \
        -w ${PWD}  \
        -v ${PWD}:${PWD} \
	-e C_INCLUDE_PATH=/usr/lib/gcc/x86_64-linux-gnu/11/include \
	-v /usr/lib/x86_64-linux-gnu:/usr/lib/x86_64-linux-gnu:ro \
	-v /usr/include:/usr/include:ro \
        --entrypoint vim \
        -v /etc/passwd:/etc/passwd:ro \
        -v $HOME/.nvim/gopath:/home/vim/gopath \
	-v $HOME/.nvim/coc-settings.json:/home/vim/.vim/coc-settings.json:ro \
        -v /etc/group:/etc/group:ro  \
        registry.cn-shenzhen.aliyuncs.com/juxuny-public/vim:v1.16.0 \
        "$@"
```

file: $HOME/.nvim/coc-settings.json
```json
{
  "diagnostic.displayByAle": false,
  "go.goplsArgs": ["-remote=auto"],
  "go.goplsPath": "/home/vim/gopath/bin/gopls",
  "clangd.path": "/usr/local/bin/clangd",
  "clangd.compilationDatabasePath": "./build",
  "clangd.arguments": [
    "--compile-commands-dir=${cwd}/build"
  ]
}
```

## Update

### v1.15.4 

* add plugins
  * support cql
  * npm prettier format file



### v1.11.3 

* add key map
  * C-Y, C-B 
  * C-H, C-L: Left or Right

### v1.8.0

* add coc-protobuf

### v1.7.6

* add coc-clangd

### v1.7.4

* fix coc-nvim gopls execute args

### go1.20-v1.7.3

* add key map:
  * <F5>: *.tsx file reorder import

### go1.20-v1.7.1

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

