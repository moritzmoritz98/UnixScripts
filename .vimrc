if has('syntax') && (&t_Co > 2)
  syntax on
endif

set list
set ic
set number
set showmode
set showcmd
set nomodeline
set mouse=a
set tw=110
set colorcolumn=80
highlight ColorColumn ctermbg=238

set wildmode=list:longest,full
set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmenu
execute 'set listchars+=tab:' . nr2char(187) . nr2char(183)

set ignorecase
set smartcase
set incsearch
set smartindent
set autoindent
set softtabstop=2
set expandtab
set completeopt=menuone,menu,longest,preview
set clipboard=unnamedplus,autoselect

set t_Co=256
highlight Pmenu ctermbg=236 ctermfg=10 gui=bold

"set spell

augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

"----------------------------------------------------------
"C
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

"let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_global_ycm_extra_conf = "/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_python_binary_path = 'python2'
let g:ycm_server_python_interpreter = 'python2'
"---------------------------------------------------------
"HASKELL
execute pathogen#infect()

map <Leader>s :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_haskell_checkers = ['hlint', 'ghc_mod']

"map <silent> tw :GhcModTypeInsert<CR>
"map <silent> ts :GhcModSplitFunCase<CR>
"map <silent> tq :GhcModType<CR>
"map <silent> te :GhcModTypeClear<CR>

let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>


map <silent> <Leader>t :CtrlP()<CR>
noremap <leader>b<space> :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = '\v[\/]dist$'

"au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
"au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
"au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>
