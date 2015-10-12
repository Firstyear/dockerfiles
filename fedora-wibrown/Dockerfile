FROM fedora:latest
MAINTAINER william@blackhats.net.au

USER root
# Don't try and use volume mounts from host to the container, it actually adds
# in a relative volume path as: /var/lib/docker/volumes/home/william/development/389ds
## Which is probably okay for *some* tasks, like sharing code folders etc.
## Just need to be careful of that.

# Timezones
WORKDIR /etc
RUN ln -sf ../usr/share/zoneinfo/Australia/Brisbane localtime

WORKDIR /

#RUN cat /proc/net/if_inet6
ADD dnf.conf /etc/dnf/dnf.conf
RUN /usr/bin/dnf upgrade -y; /usr/bin/dnf clean all
RUN /usr/bin/dnf install -y vim vim-nerdtree screen gcc gdb make iproute iputils git ccache findutils strace zsh rpm-build ldapvi valgrind krb5-workstation sudo procps-ng fedpkg; /usr/bin/dnf clean all

RUN useradd -d /home/wibrown -M -G wheel -s /bin/zsh wibrown
ADD zshrc /home/wibrown/.zshrc
ADD vimrc /home/wibrown/.vimrc
VOLUME /home/wibrown/development:/home/wibrown/development

RUN chown -R wibrown: /home/wibrown

# Which way is better?
#VOLUME /development/srv/ccache:/srv/ccache
VOLUME /srv:/srv
# Says the directory doesn't exist. Fucking docker volumes are tempermental.
RUN mkdir -p /srv/ccache; chown -R wibrown: /srv/ccache; exit 0

ADD ccache.conf /etc/ccache.conf
ADD wibrown-sudo /etc/sudoers.d/wibrown

# Probably setup the gitinfo stuff here too ....

USER wibrown
WORKDIR /home/wibrown
CMD /bin/zsh

