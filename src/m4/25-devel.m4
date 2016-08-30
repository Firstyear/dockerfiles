## `DEVEL.M4'

`USER' root

# Things I use a lot ...
`RUN' /usr/bin/DNFYUM install -y sudo vim screen ccache gcc gdb make iproute iputils findutils strace zsh rpm-build ldapvi valgrind krb5-workstation procps-ng fedpkg bind-utils yum-utils nc dnf-plugins-core autoconf automake libtool man libasan llvm rpmdevtools copr-cli
`RUN' /usr/bin/DNFYUM install -y libevent-devel nspr-devel libtalloc-devel libtevent-devel systemd-devel
# YEAH LETS CRACK OUT THE DEBUGINFO WOOHOO
# `RUN' debuginfo-install -y glibc; true

# Which way is better?
#`VOLUME' /srv:/srv
# Says the directory doesn't exist. Docker volumes are tempermental.
`RUN' mkdir -p /srv/ccache; chown -R USER:USER /srv/ccache; exit 0
`RUN' ln -s /srv/ccache /home/USER/.ccache

`COPY' ccache.conf /etc/ccache.conf

