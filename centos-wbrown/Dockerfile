FROM centos:latest
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
RUN /usr/bin/dnf install -y vim vim-nerdtree screen gcc gdb make iproute iputils git ccache findutils strace zsh rpm-build ldapvi valgrind krb5-workstation sudo procps-ng; /usr/bin/dnf clean all

RUN useradd -d /home/wbrown -M -G wheel -s /bin/zsh wbrown
ADD zshrc /home/wbrown/.zshrc
ADD vimrc /home/wbrown/.vimrc
VOLUME /home/wbrown/development:/home/wbrown/development

RUN chown -R wbrown: /home/wbrown

# Which way is better?
#VOLUME /development/srv/ccache:/srv/ccache
VOLUME /srv:/srv
# Says the directory doesn't exist. Fucking docker volumes are tempermental.
RUN mkdir -p /srv/ccache; chown -R wbrown: /srv/ccache; exit 0

ADD ccache.conf /etc/ccache.conf
ADD wbrown-sudo /etc/sudoers.d/wbrown

# Probably setup the gitinfo stuff here too ....

USER wbrown
WORKDIR /home/wbrown
CMD /bin/zsh

