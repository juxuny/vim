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
autocmd FileType yaml setlocal commentstring=#\ %s

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
let $FZF_DEFAULT_COMMAND = 'find . -not -path "*.git/*" -not -path "*.svn*" -not -path "*.idea"'
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
imap <C-n> <ESC>O
nmap <C-o> o<ESC><ESC>
nmap <C-j> 20j
imap <C-k> <ESC>20ki
imap <C-j> <ESC>20ji
nmap <C-k> 20k
imap <C-l> <ESC>$a
imap <C-h> <ESC>^i
nmap <C-l> <ESC>$
nmap <C-h> <ESC>^
vmap <C-l> <ESC>$
vmap <C-h> <ESC>^
" nmap <C-B> :MerginalToggle<cr>
nmap <C-B> :Gbranch<cr>

" format code
autocmd FileType javascript nmap <buffer> fmt :!js-beautify % > %.tmp && mv %.tmp % <cr>
autocmd FileType go nmap <buffer> fmt :!go fmt % <cr>

" show branch name on statusline
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'charvaluehex' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveStatusline'
      \ },
      \ }

function! s:changebranch(branch)
    execute 'Git checkout' . a:branch
    " enter insert mode
    " call feedkeys("i")
endfunction

command! -bang Gbranch call fzf#run({
            \ 'source': 'git branch -a --no-color | grep -v "^\* " ',
            \ 'sink': function('s:changebranch')
            \ })
