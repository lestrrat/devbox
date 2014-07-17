" set rtp+=$GOROOT/misc/vim
" exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
exe pathogen#infect()

filetype plugin on
set omnifunc=syntaxcomplete#Complete
set completeopt=menu,preview

syntax on
hi Comment ctermfg=yellow cterm=none
hi Constant ctermfg=green cterm=none
    
set nocompatible
set nohlsearch
set showmatch
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set backspace=indent,eol,start 
set binary noeol
set t_kb=
set vb
fixdel
set enc=utf-8

au BufNewFile,BufRead *.psgi set filetype=perl
au BufNewFile,BufRead *.tx set filetype=html
au BufNewFile,BufRead *.tt set filetype=html
au FileType go         setl noet sw=2 sts=2 ts=2

" If you can't tell me the file type, I want to turn ON expandtab
au BufEnter * if &filetype == "" | setl et |endif

let g:go_fmt_autosave = 0
