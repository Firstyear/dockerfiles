# FROM centos:7
FROM opensuse/tumbleweed:latest
MAINTAINER william@blackhats.net.au

EXPOSE 80 443

RUN echo HTTP_PROXY="http://proxy-bne1.net.blackhats.net.au:3128" > /etc/sysconfig/proxy

COPY install.sh /bin/
COPY uninstall.sh /bin/

# Sudo is used for occ admin cli tasks
RUN zypper install -y timezone nextcloud apache2 sudo systemd php7-ldap openldap2-client systemd-sysvinit
# May not need redis with maria.
# php7-redis redis

# Timezones
RUN cd /etc && ln -sf ../usr/share/zoneinfo/Australia/Brisbane localtime

# RUN localedef -i en_AU -c -f UTF-8 en_AU.UTF-8

# This is to allow LDAP to work

RUN mkdir -p /etc/pki/tls/certs/
COPY bh_ldap.crt /etc/pki/tls/certs/bh_ldap.crt
COPY ldap.conf /etc/openldap/ldap.conf

COPY ssl.conf /etc/httpd/conf.d/ssl.conf
COPY nextcloud.ini /etc/php.d/nextcloud.ini
# This makes the service available outside of localhost
RUN ln -s /etc/httpd/conf.d/nextcloud-access.conf.avail /etc/httpd/conf.d/z-nextcloud-access.conf

RUN systemctl enable apache2.service && \
    systemctl enable mariadb.service
#    systemctl enable redis.service && \

# volume /var/lib/nextcloud/data
# volume for /etc/nextcloud too!!!

# How do I inject TLS?

VOLUME [ "/sys/fs/cgroup", "/sys/fs/cgroup/systemd", "/tmp", "/run" ]
ENV container docker
STOPSIGNAL SIGRTMIN+3
CMD [ "/sbin/init" ]




