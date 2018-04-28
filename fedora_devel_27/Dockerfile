
FROM fedora:27
MAINTAINER william@blackhats.net.au

# Timezones
RUN cd /etc && ln -sf ../usr/share/zoneinfo/Australia/Brisbane localtime

# I would like to set this to -u `UID'
RUN groupadd -g 654401105 william && \
    useradd -l -d /home/william -s /bin/zsh -M -G wheel -s /bin/zsh -u 654401105 -g 654401105 william

COPY devel/zshrc /home/william/.zshrc
COPY devel/zshrc /root/.zshrc
RUN mkdir -p /home/william/development

RUN chown -R william: /home/william
COPY core/user-sudo /etc/sudoers.d/william-sudo

# This gets our s4 deps also.
RUN /usr/bin/dnf install -y redhat-rpm-config glibc-locale-source && \
    /usr/bin/dnf upgrade -y && \
    /usr/bin/dnf install -y sudo make gdb ccache zsh procps-ng wget findutils \
        cargo iproute openldap-clients && \
    /usr/bin/dnf install -y attr bind-utils docbook-style-xsl gcc gdb krb5-workstation \
        libsemanage-python libxslt perl perl-ExtUtils-MakeMaker \
        perl-Parse-Yapp perl-Test-Base pkgconfig policycoreutils-python \
        python-crypto gnutls-devel gpgme-devel jansson-devel libattr-devel \
        keyutils-libs-devel libacl-devel libaio-devel libblkid-devel \
        libxml2-devel openldap-devel pam-devel popt-devel python2-devel \
        readline-devel systemd-devel zlib-devel python-markdown && \
    /usr/bin/dnf clean all

# Setup tinkerer for blogs
RUN /usr/bin/pip-3 install sphinx==1.6.7 tinkerer

# Setup fstar
ADD fstar_0.9.5.0_Linux_x86_64.tar.gz /usr/local

# Temporal volumes for each instance
VOLUME /opt/dirsrv
VOLUME /usr/local/samba

# Fix the en_au locale.
RUN localedef -i en_AU -c -f UTF-8 en_AU.UTF-8

USER william
WORKDIR /home/william/development
CMD /bin/zsh


