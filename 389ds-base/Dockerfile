FROM fedora-william:latest
MAINTAINER william@blackhats.net.au
EXPOSE 389 636
# Don't try and use volume mounts from host to the container, it actually adds
# in a relative volume path as: /var/lib/docker/volumes/home/william/development/389ds
## Which is probably okay for *some* tasks, like sharing code folders etc.
## Just need to be careful of that.
VOLUME /development/389ds:/usr/src/389ds
#VOLUME /development/389ds/lib389:/usr/src/389ds/lib389

# Temporal volumes for each instance
VOLUME /opt/dirsrv
# Why not just run the dsbuild per container?

VOLUME /usr/src/389ds/dsbuild

RUN /usr/bin/dnf install -y 389-ds-base pytest python-ldap; /usr/bin/dnf clean all
RUN /usr/bin/dnf install -y nspr-devel nss-devel svrcore-devel openldap-devel mozldap-devel db4-devel libdb-devel cyrus-sasl-devel icu libicu-devel pcre-devel gcc-c++ net-snmp-devel lm_sensors-devel bzip2-devel zlib-devel openssl-devel tcp_wrappers pam-devel systemd-units nspr-devel nss-devel svrcore-devel openldap-devel mozldap-devel db4-devel libdb-devel cyrus-sasl-devel libicu-devel pcre-devel libtalloc-devel libevent-devel libtevent-devel; /usr/bin/dnf clean all
ENV PREFIX=/opt/dirsrv
ENV PYTHONPATH=/usr/src/389ds/lib389
ENV CONFIGURE='cd /usr/src/389ds/dsbuild; /usr/src/389ds/ds/configure --with-openldap --enable-debug --prefix=$PREFIX'
WORKDIR /usr/src/389ds/
CMD /bin/zsh

