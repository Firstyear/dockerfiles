FROM fedora-wibrown:latest
MAINTAINER william@blackhats.net.au
EXPOSE 389 636

USER root
RUN /usr/bin/dnf install -y 389-ds-base pytest python-ldap; /usr/bin/dnf clean all
RUN /usr/bin/dnf install -y nspr-devel nss-devel svrcore-devel openldap-devel mozldap-devel db4-devel libdb-devel cyrus-sasl-devel icu libicu-devel pcre-devel gcc-c++ net-snmp-devel lm_sensors-devel bzip2-devel zlib-devel openssl-devel tcp_wrappers pam-devel systemd-units nspr-devel nss-devel svrcore-devel openldap-devel mozldap-devel db4-devel libdb-devel cyrus-sasl-devel libicu-devel pcre-devel libtalloc-devel libevent-devel libtevent-devel krb5-devel; /usr/bin/dnf clean all
#ENV PREFIX=/opt/dirsrv
# Temporal volumes for each instance
#VOLUME /opt/dirsrv

RUN mkdir -p /home/wibrown/development/389ds
RUN chown -R wibrown: /home/wibrown/development

# This might not do what I hope ... 
# The volume, while per container, these other commands "don't stick" to it. :(
# Don't make it a volume, leave it as part of the layer
#VOLUME /home/wibrown/build
RUN mkdir -p /home/wibrown/build
RUN chown -R wibrown: /home/wibrown/build

USER wibrown
WORKDIR /home/wibrown/development/389ds
CMD /bin/zsh

