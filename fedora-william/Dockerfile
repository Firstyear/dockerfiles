FROM fedora:latest
MAINTAINER william@blackhats.net.au
# Don't try and use volume mounts from host to the container, it actually adds
# in a relative volume path as: /var/lib/docker/volumes/home/william/development/389ds
## Which is probably okay for *some* tasks, like sharing code folders etc.
## Just need to be careful of that.
#VOLUME /var/lib/dirsrv /var/log/dirsrv
VOLUME /development/srv/ccache:/srv/ccache
RUN cat /proc/net/if_inet6
ADD dnf.conf /etc/dnf/dnf.conf
RUN /usr/bin/dnf upgrade -y; /usr/bin/dnf clean all
RUN /usr/bin/dnf install -y vim vim-nerdtree screen gcc gdb make iproute iputils git ccache findutils strace zsh rpm-build ldapvi valgrind ; /usr/bin/dnf clean all
ADD ccache.conf /etc/ccache.conf

