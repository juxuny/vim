execute pathogen#infect()
filetype plugin indent on
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
" autocmd BufRead,BufNewFile *.tsx,*.js,*.vue,*.ts,*.jsx setlocal commentstring={/*\ %s\ */}

" color theme
let g:solarized_termcolors=256
if has('gui_running')
    set background=light
else
    set background=dark
endif


colorscheme dracula
" colorscheme onedark
" colorscheme solarized
" colorscheme peaksea

" fzf
set rtp+=~/.fzf
" search files
let $FZF_DEFAULT_COMMAND = 'find . -not -path "*.git/*" -not -path "*.svn*" -not -path "*.idea" -not -path "*node_modules/*"'
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
autocmd vimenter * NERDTree
" autocmd VimLeave * if argc() == 1 && !&modified | NERDTreeClose | endif
" autocmd bufenter * NERDTreeMirror
" autocmd bufleave * NERDTreeClose
nmap tt :NERDTreeToggle <cr>
nmap <C-n> :Files <cr>
nmap ,n :NERDTreeFind<CR>
" search text in directories
nmap <C-S-f> :Ack 
imap <C-o> <ESC>o
imap <C-n> <ESC>O
nmap <C-o> o<ESC><ESC>
nmap <C-j> 20j
imap <C-k> <ESC>20ki
imap <C-j> <ESC>20ji
nmap <C-k> 20k
inoremap <C-Y> <C-\><C-O>b
inoremap <C-B> <C-\><C-O>w
inoremap <C-H> <Left>
inoremap <C-L> <Right>
inoremap <C-J> <Down>
inoremap <C-K> <Up>
" imap <C-l> <ESC>$a
" imap <C-h> <ESC>^i
" nmap <C-l> <ESC>$
" nmap <C-h> <ESC>^
" vmap <C-l> <ESC>$
" vmap <C-h> <ESC>^
" nmap <C-B> :MerginalToggle<cr>
" nmap <C-B> :Gbranch<cr>
"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <C-h> :History <cr>

autocmd FileType go nmap <buffer> gd :GoDef<cr>
autocmd FileType go nmap <buffer> gi :GoImplements<cr>
autocmd FileType go nmap <buffer> gr :GoRefer<cr>

" format code
" autocmd FileType javascript nmap <buffer> fmt :!js-beautify % > %.tmp && mv %.tmp % <cr>
autocmd FileType go nmap <buffer> fmt :!go fmt % <cr>
autocmd FileType go nmap <buffer> <F1> :call go#lsp#Restart()<cr>
" autocmd BufNewFile,BufRead *.html,*.xml,*.json nmap <buffer> fmt :call CocAction('runCommand', 'prettier.formatFile')<cr>
autocmd BufNewFile,BufRead *.html,*.xml,*.json nmap <buffer> fmt :call CocActionAsync('format')<cr>
autocmd BufNewFile,BufRead *.tsx,*.vue,*.ts,*.jsx nmap <buffer> fmt :call CocAction('runCommand', 'editor.action.organizeImport')<cr>:call CocAction('runCommand', 'prettier.formatFile')<cr>
autocmd BufNewFile,BufRead *.tsx,*.vue,*.ts,*.jsx,*.java,*.cc,*.cpp,*.c,*.h,*.hpp nmap <silent> rn <Plug>(coc-rename)

" show branch name on statusline
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'charvaluehex' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ }


"CoC Settings
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"Ultisnips Settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"coc-snippets Settings
"inoremap <silent><expr> <TAB>
"      \ coc#pum#visible() ? coc#_select_confirm() :
"      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"      \ CheckBackspace() ? "\<TAB>" :
"      \ coc#refresh()
"
"function! CheckBackspace() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
"let g:coc_snippet_next = '<tab>'


" set auto indent space width
autocmd BufNewFile,BufRead *.tsx,*.js,*.html,*.xml,*.vue,*.ts,*.jsx,*.json set expandtab tabstop=2 shiftwidth=2
autocmd FileType sh set expandtab tabstop=4 shiftwidth=4
" autocmd BufNewFile,BufRead *.tsx,*.js,*.vue,*.ts,*.jsx nmap <buffer> <F5> :call CocAction('runCommand', 'editor.action.organizeImport')<cr>:call CocAction('runCommand', 'prettier.formatFile')<cr>
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
autocmd BufRead,BufNewFile *.dockerfile set filetype=dockerfile

" jump to errors
" nmap <silent> <F3> <Plug>(ale_previous_wrap)
nmap <silent> <F2> <Plug>(ale_next_wrap)

" disable markdown file folding
let g:markdown_folding = 0

" run golangci-lint in whole package
let g:ale_go_golangci_lint_package=1

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
set statusline+=%F
