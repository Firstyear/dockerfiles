## `DEVEL.M4'

# Things I use a lot ...

# `RUN' /usr/bin/DNFYUM install -y  sudo vim screen ccache gcc gdb make iproute iputils findutils strace zsh rpm-build ldapvi procps-ng bind-utils nc autoconf automake libtool man llvm rpmdevtools&& /usr/bin/DNFYUM clean all

`RUN' /usr/bin/DNFYUM install -y  sudo vim make gdb ccache zsh ldapvi procps-ng && /usr/bin/DNFYUM clean all

# This could have errors that are fixed by : sudo rpm --rebuilddb


# Says the directory doesn't exist. Docker volumes are tempermental.
`RUN' mkdir -p /srv/ccache; chown -R USER:USER /srv/ccache; exit 0
`RUN' ln -s /srv/ccache /home/USER/.ccache

`COPY' ccache.conf /etc/ccache.conf

