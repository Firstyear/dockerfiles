
FROM opensuse/tumbleweed:latest
MAINTAINER william@blackhats.net.au

RUN echo HTTP_PROXY="http://proxy-bne1.net.blackhats.net.au:3128" > /etc/sysconfig/proxy
# This gets our s4 deps also.
RUN zypper install -y glibc-locale glibc-i18ndata timezone less \
        sudo make gdb ccache zsh procps wget findutils system-group-wheel \
        vim libcmocka-devel \
        cargo rust-std iproute openldap2-client \
        python3 python3-devel python3-pip \
        python3-pip \
        autoconf automake libtool gcc-c++ gcc gdb libevent-devel mozilla-nspr-devel \
        mozilla-nss-devel libdb-4_8-devel cyrus-sasl-devel cyrus-sasl-plain \
        cyrus-sasl-gssapi libicu-devel net-snmp-devel krb5-devel krb5-client \
        systemd-devel openldap2-devel pkgconfig \
        pam-devel pcre-devel \
        krb5-server doxygen cracklib-devel python3-ldap rsync mozilla-nss-tools && \
    zypper clean && \
    pip install argparse-manpage argcomplete

RUN groupadd -g 654401105 william && \
    useradd -l -d /home/william -s /bin/zsh -M -G wheel -s /bin/zsh -u 654401105 -g 654401105 william && \
    groupadd dirsrv && \
    useradd dirsrv

COPY devel/zshrc /home/william/.zshrc
COPY devel/zshrc /root/.zshrc
RUN mkdir -p /home/william/development

RUN chown -R william: /home/william
COPY core/user-sudo /etc/sudoers.d/william-sudo

# Timezones
RUN cd /etc && ln -sf ../usr/share/zoneinfo/Australia/Brisbane localtime

# Setup tinkerer for blogs
RUN /usr/bin/pip3 install sphinx==1.6.7 tinkerer

# Temporal volumes for each instance
VOLUME /opt/dirsrv
VOLUME /usr/local

USER william
WORKDIR /home/william/development
CMD /bin/zsh


