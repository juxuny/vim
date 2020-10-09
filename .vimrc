execute pathogen#infect()
set nu
set autoindent
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
set noshowmode

" custom commentstring
autocmd FileType go setlocal commentstring=//\ %s
autocmd FileType vim setlocal commentstring=\"\ %s

" color theme
let g:solarized_termcolors=256
if has('gui_running')
    set background=light
else
    set background=dark
endif
" colorscheme solarized
colorscheme peaksea

" fzf
set rtp+=~/.fzf
" search files
let $FZF_DEFAULT_COMMAND = 'find . -not -path "*.git*" -not -path "*.svn*" -not -path "*.idea"'
set encoding=utf-8

" ----------------------------------------------------------- key mapping ---------------------------------------------------------
" multi cursor mapping
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-g>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-g>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
" NERDTreeToggle
nmap <C-t> :NERDTreeToggle <cr>
nmap <C-n> :Files <cr>
" search text in directories
nmap <C-S-f> :Ack 
imap <C-o> <ESC>o
nmap <C-o> o<ESC><ESC>
nmap <C-j> 20j
imap <C-k> <ESC>20ki
imap <C-j> <ESC>20ji
nmap <C-k> 20k

