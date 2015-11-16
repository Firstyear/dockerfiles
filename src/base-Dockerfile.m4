include(details.m4)
`FROM' OS:VERSION
`MAINTAINER' AUTHOR

`USER' root
# Don't try and use volume mounts from host to the container, it actually adds
# in a relative volume path as: /var/lib/docker/volumes/home/william/development/389ds
## Which is probably okay for *some* tasks, like sharing code folders etc.
## Just need to be careful of that.

# Timezones
`WORKDIR' /etc
`RUN' ln -sf ../usr/share/zoneinfo/TZ localtime

# If centos, we need to build the locale
ifdef(`WITHDNF', , `RUN' localedef -i en_AU -c -f UTF-8 en_AU.UTF-8 )

`WORKDIR' /

#RUN cat /proc/net/if_inet6

`COPY' DNFYUM.conf /etc/DNFYUM/DNFYUM.conf
# For packages that don't exist in CENTOS how do we manage this?
## Maybe use  ifelse(a,b,c,d) compares the strings a and b. If they match, the macro expands to string c; if not, string d.
ifdef(`WITHDNF', , `RUN' /usr/bin/DNFYUM install -y epel-release )
`RUN' /usr/bin/DNFYUM upgrade -y; /usr/bin/DNFYUM clean all
`RUN' /usr/bin/DNFYUM install -y vim vim-nerdtree screen gcc gdb make iproute iputils ccache findutils strace zsh rpm-build ldapvi valgrind krb5-workstation sudo procps-ng fedpkg bind-utils yum-utils nc dnf-plugins-core autoconf automake libtool man libasan llvm; /usr/bin/DNFYUM clean all
# Maybe I should make a "devel" container ... 
`RUN' /usr/bin/DNFYUM install -y libevent-devel nspr-devel libtalloc-devel libtevent-devel
# YEAH LETS CRACK OUT THE DEBUGINFO WOOHOO
`RUN' /usr/bin/debuginfo-install -y glibc

# I would like to set this to -u `UID'
`RUN' useradd -d /home/USER -s /bin/zsh -M -G wheel -s /bin/zsh USER
`VOLUME' /home:/home

# Only needs to be done once?
`COPY' zshrc /home/USER/.zshrc
`COPY' zshrc /root/.zshrc
`COPY' vimrc /home/USER/.vimrc
`RUN' mkdir -p /home/USER/development

`RUN' chown -R USER: /home/USER

# Which way is better?
#VOLUME /development/srv/ccache:/srv/ccache
`VOLUME' /srv:/srv
# Says the directory doesn't exist. Fucking docker volumes are tempermental.
`RUN' mkdir -p /srv/ccache; chown -R USER: /srv/ccache; exit 0

`COPY' ccache.conf /etc/ccache.conf
`COPY' user-sudo /etc/sudoers.d/USER-sudo

# Probably setup the gitinfo stuff here too ....

`USER' USER
`WORKDIR' /home/USER
`CMD' /bin/zsh

