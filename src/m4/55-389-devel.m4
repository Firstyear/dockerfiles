## `389.M4'

# For the flask api
`EXPOSE' 80 389 443 636 5000

`USER' root
`RUN' useradd -d / -M -r -s /bin/false dirsrv; true
`RUN' useradd -d / -M -r -s /bin/false dirsrv_rest; true

`RUN' /usr/bin/DNFYUM install -y pytest python-ldap python-flask krb5-server-ldap krb5-server httpd mod_wsgi
`RUN' /usr/bin/DNFYUM install -y nspr-devel nss-devel svrcore-devel openldap-devel mozldap-devel db4-devel libdb-devel cyrus-sasl-devel icu libicu-devel pcre-devel gcc-c++ net-snmp-devel lm_sensors-devel bzip2-devel zlib-devel openssl-devel tcp_wrappers pam-devel systemd-units nspr-devel nss-devel svrcore-devel openldap-devel mozldap-devel db4-devel libdb-devel cyrus-sasl-devel libicu-devel pcre-devel libtalloc-devel libevent-devel libtevent-devel krb5-devel python-six python-krbV python-pyasn1-modules python-devel python-krbV python2-devel libxslt valgrind-devel systemd-devel systemd-libs
## Look at dnf config-manager
`RUN' /usr/bin/debuginfo-install -y audit-libs cyrus-sasl-gssapi cyrus-sasl-lib cyrus-sasl-md5 keyutils-libs krb5-libs libcom_err libdb libevent libgcc libicu libselinux libstdc++ libtalloc libtevent nspr nss nss-util openldap openssl-libs pam pcre svrcore zlib; true
#ENV PREFIX=/opt/dirsrv

# Temporal volumes for each instance
VOLUME /opt/dirsrv


