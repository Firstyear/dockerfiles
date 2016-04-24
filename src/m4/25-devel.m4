## `DEVEL.M4'

# Things I use a lot ...
`RUN' /usr/bin/DNFYUM install -y vim vim-nerdtree screen gcc gdb make iproute iputils ccache findutils strace zsh rpm-build ldapvi valgrind krb5-workstation sudo procps-ng fedpkg bind-utils yum-utils nc dnf-plugins-core autoconf automake libtool man libasan llvm rpmdevtools copr-cli ; /usr/bin/DNFYUM clean all
`RUN' /usr/bin/DNFYUM install -y libevent-devel nspr-devel libtalloc-devel libtevent-devel systemd-devel
# YEAH LETS CRACK OUT THE DEBUGINFO WOOHOO
`RUN' /usr/bin/debuginfo-install -y glibc

# Which way is better?
#`VOLUME' /srv:/srv
# Says the directory doesn't exist. Docker volumes are tempermental.
`RUN' mkdir -p /srv/ccache; chown -R USER:USER /srv/ccache; exit 0
`RUN' ln -s /srv/ccache /home/USER/.ccache

`COPY' ccache.conf /etc/ccache.conf

