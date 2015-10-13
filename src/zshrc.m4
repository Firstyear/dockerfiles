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
alias configure-389ds='/home/USER/development/389ds/ds/configure --with-openldap --enable-debug --prefix=$`PREFIX''


