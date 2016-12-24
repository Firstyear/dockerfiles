include(00-details.m4)
include(01-usebase.m4)

EXPOSE 3128
ENV container docker

# Now upgrade, and install useful tools.
# Httpd should be a dep on rest389
RUN /usr/bin/yum makecache && /usr/bin/yum upgrade -y && /usr/bin/yum -y install squid procps-ng iputils iproute && /usr/bin/yum clean all;

COPY squid/squid.conf /etc/squid/squid.conf

RUN squid -z -N -d 0 -f /etc/squid/squid.conf; touch /var/run/squid.pid; chown squid: /var/run/squid.pid
VOLUME /var/spool/squid
# May need to chown the squid pid here....

CMD ["/usr/sbin/squid", "-f", "/etc/squid/squid.conf", "-N", "-d", "0"]



