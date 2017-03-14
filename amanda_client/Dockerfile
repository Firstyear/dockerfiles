FROM centos:7
MAINTAINER wibrown@redhat.com

EXPOSE 10080

# Timezones
RUN cd /etc && ln -sf ../usr/share/zoneinfo/Australia/Brisbane localtime

RUN localedef -i en_AU -c -f UTF-8 en_AU.UTF-8

RUN yum install -y amanda-client "/sbin/init" && yum clean all && rpm --rebuilddb

COPY amandahosts /var/lib/amanda/.amandahosts
COPY backup-pubkey.pem /var/lib/amanda/backup-pubkey.pem
RUN touch /var/lib/amanda/exclude
RUN chown amandabackup:disk /var/lib/amanda/{.amandahosts,backup-pubkey.pem,exclude} && chmod 600 /var/lib/amanda/{.amandahosts,backup-pubkey.pem,exclude}

RUN systemctl enable amanda.socket

RUN mkdir /sysroot

ENV container docker
STOPSIGNAL SIGRTMIN+3
CMD [ "/sbin/init" ]


