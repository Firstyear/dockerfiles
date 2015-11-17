include(details.m4)
autoload -U compinit
compinit
autoload -U promptinit
promptinit

PS1="{%n@%m %T} %~ I0> "
zle -N zle-keymap-select

export `EDITOR'="/usr/bin/vim"
export `LC_ALL'="en_AU.UTF-8"
export `NSS_DEFAULT_DB_TYPE'=sql 

export `PREFIX'=/opt/dirsrv
export `PYTHONPATH'=/home/USER/development/389ds/lib389

export `CFLAGS'='-Wall'

alias configure-ds='/home/USER/development/389ds/ds/configure --with-openldap --enable-debug --with-nunc-stans=/opt/nunc-stans/ --enable-nunc-stans  --prefix=$`PREFIX''
alias configure-admin='/home/USER/development/389ds/admin/configure --with-openldap --enable-debug --prefix=$`PREFIX''
alias setup-ds='$`PREFIX'/sbin/setup-ds.pl --silent --debug --file=/home/USER/development/389ds/setup.inf General.FullMachineName=$(hostname) '

export ASAN_SYMBOLIZER_PATH=/usr/bin/llvm-symbolizer
export ASAN_OPTIONS=symbolize=1


