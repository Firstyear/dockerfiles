include(details.m4)
syntax on

set wrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
"set list listchars=tab:·\ ,trail:·,precedes:<,extends:>

nnoremap <Left>  <NOP>
nnoremap <Right> <NOP>
nnoremap <Up>    <NOP>
nnoremap <Down>  <NOP>
vnoremap <Left>  <NOP>
vnoremap <Right> <NOP>
vnoremap <Up>    <NOP>
vnoremap <Down>  <NOP>

set hlsearch
set incsearch

set wildignore+=*.o,*.obj,.git,*.rbc,.svn,*.pyc

set laststatus=2

set backspace=indent,eol,start

filetype indent plugin on
set modeline
set modelines=10

color desert

set backupdir=~/.vim/backup
set directory=~/.vim/backup
set term=xterm

set paste

set cc=81
set encoding=utf-8
set splitright

