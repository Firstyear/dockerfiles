
# Things I use a lot ...
`RUN' /usr/bin/DNFYUM install -y vim vim-nerdtree screen gcc gdb make iproute iputils ccache findutils strace zsh rpm-build ldapvi valgrind krb5-workstation sudo procps-ng fedpkg bind-utils yum-utils nc dnf-plugins-core autoconf automake libtool man libasan llvm rpmdevtools copr-cli ; /usr/bin/DNFYUM clean all
`RUN' /usr/bin/DNFYUM install -y libevent-devel nspr-devel libtalloc-devel libtevent-devel
# YEAH LETS CRACK OUT THE DEBUGINFO WOOHOO
`RUN' /usr/bin/debuginfo-install -y glibc

# I would like to set this to -u `UID'
`RUN' useradd -d /home/USER -s /bin/zsh -M -G wheel -s /bin/zsh USER

# This might not do what I hope ... 
# The volume, while per container, these other commands "don't stick" to it. :(
# Don't make it a volume, leave it as part of the layer

`RUN' mkdir -p /home/USER/build
`RUN' chown -R USER: /home/USER/build
# Only needs to be done once?
`COPY' zshrc /home/USER/.zshrc
`COPY' zshrc /root/.zshrc
`COPY' vimrc /home/USER/.vimrc
`RUN' mkdir -p /home/USER/.vim/backup
`RUN' mkdir -p /home/USER/development

`RUN' chown -R USER: /home/USER

# Which way is better?
#`VOLUME' /srv:/srv
# Says the directory doesn't exist. Docker volumes are tempermental.
`RUN' mkdir -p /srv/ccache; chown -R USER: /srv/ccache; exit 0

`COPY' ccache.conf /etc/ccache.conf
`COPY' user-sudo /etc/sudoers.d/USER-sudo

`USER' USER
`WORKDIR' /home/USER
`CMD' /bin/zsh
