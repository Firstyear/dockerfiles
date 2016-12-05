FROM fedora:24
MAINTAINER wibrown@redhat.com
EXPOSE 80 443 389 636
ENV container docker

# Add the copr repos we need
RUN dnf install -y dnf-plugins-core && dnf copr enable firstyear/ds -y

### Need to grab and install pyldap from here somehow!

# Now upgrade, and install useful tools.
# Httpd should be a dep on rest389
RUN /usr/bin/dnf upgrade -y && /usr/bin/dnf -y install httpd 389-ds-base procps-ng iputils && /usr/bin/dnf clean all;

# Add the setup-inf, we have an example with the rest package though.
# Build the instance from the new installer tools.

RUN dnf install -y https://copr-be.cloud.fedoraproject.org/results/firstyear/ds/fedora-rawhide-x86_64/00462962-python-lib389/python3-lib389-1.0.3-1.fc26.noarch.rpm python3-rest389 python3-idm389

RUN /usr/sbin/dsadm -v instance create -f /usr/share/rest389/examples/ds-setup-rest-admin.inf --IsolemnlyswearthatIamuptonogood --containerised

# Finally add the volumes, they will inherit the contents of these directories.
VOLUME /etc/dirsrv
VOLUME /var/log/dirsrv
VOLUME /var/lib/dirsrv

# Use systemd to start our services.
# RUN systemctl enable httpd; systemctl enable dirsrv@localhost
# STOPSIGNAL SIGRTMIN+3
# CMD [ "/sbin/init" ]

# Or, run them as dirsrv
# USER dirsrv
WORKDIR /var/empty
CMD ["/usr/sbin/ns-slapd", "-d", "0", "-D", "/etc/dirsrv/slapd-localhost", "-i", "/var/run/dirsrv/slapd-localhost.pid"]

