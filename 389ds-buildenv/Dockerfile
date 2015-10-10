FROM fedora-william:latest
MAINTAINER william@blackhats.net.au
EXPOSE 389 636
# Don't try and use volume mounts from host to the container, it actually adds
# in a relative volume path as: /var/lib/docker/volumes/home/william/development/389ds
## Which is probably okay for *some* tasks, like sharing code folders etc.
## Just need to be careful of that.
VOLUME /var/lib/dirsrv /var/log/dirsrv /development/389ds:/usr/src/389ds
#RUN /usr/bin/dnf upgrade -y
RUN /usr/bin/dnf install -y nspr-devel nss-devel svrcore-devel openldap-devel mozldap-devel db4-devel libdb-devel cyrus-sasl-devel icu libicu-devel pcre-devel gcc-c++ net-snmp-devel lm_sensors-devel bzip2-devel zlib-devel openssl-devel tcp_wrappers pam-devel systemd-units nspr-devel nss-devel svrcore-devel openldap-devel mozldap-devel db4-devel libdb-devel cyrus-sasl-devel libicu-devel pcre-devel libtalloc-devel libevent-devel libtevent-devel 389-ds 389-ds-base pytest; /usr/bin/dnf clean all
# Yum install build dependancies?
# ./configure
# make
# sudo make install


# These probably need to be a second site-specific layer
# Create the unattended answer file.
# setup-ds.pl
# ADd the ns-slapd as a start

