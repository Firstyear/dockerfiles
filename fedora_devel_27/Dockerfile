
FROM fedora:27
MAINTAINER wibrown@redhat.com
# EXPOSE 80 389 443 636

# Timezones
RUN cd /etc && ln -sf ../usr/share/zoneinfo/Australia/Brisbane localtime

# I would like to set this to -u `UID'
RUN groupadd -g 1343600009 william && \
    useradd -l -d /home/william -s /bin/zsh -M -G wheel -s /bin/zsh -u 1343600009 -g 1343600009 william && \
    useradd -d / -M -r -s /bin/false dirsrv; true && \
    useradd -d / -M -r -s /bin/false dirsrv_rest; true

COPY devel/zshrc /home/william/.zshrc
COPY devel/zshrc /root/.zshrc
RUN mkdir -p /home/william/development

RUN chown -R william: /home/william
COPY core/user-sudo /etc/sudoers.d/william-sudo

RUN /usr/bin/dnf install -y redhat-rpm-config glibc-locale-source && \
    /usr/bin/dnf upgrade -y && \
    /usr/bin/dnf install -y sudo make gdb ccache zsh procps-ng wget && \
    /usr/bin/dnf clean all

# Temporal volumes for each instance
VOLUME /opt/dirsrv

# Fix the en_au locale.
RUN localedef -i en_AU -c -f UTF-8 en_AU.UTF-8

USER william
WORKDIR /home/william/development
CMD /bin/zsh


