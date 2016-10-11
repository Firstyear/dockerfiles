FROM centos:7
MAINTAINER wibrown@redhat.com
EXPOSE 3128
ENV container docker

# Now upgrade, and install useful tools.
# Httpd should be a dep on rest389
RUN /usr/bin/yum upgrade -y && /usr/bin/yum -y install squid procps-ng iputils iproute && /usr/bin/yum clean all;

COPY squid.conf /etc/squid/squid.conf

RUN squid -z -N -d 0 -f /etc/squid/squid.conf; touch /var/run/squid.pid; chown squid: /var/run/squid.pid
VOLUME /var/spool/squid
USER squid
# May need to chown the squid pid here....

CMD ["/usr/sbin/squid", "-f", "/etc/squid/squid.conf", "-N", "-d", "0"]


