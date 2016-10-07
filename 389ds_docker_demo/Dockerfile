FROM fedora:rawhide
MAINTAINER wibrown@redhat.com
EXPOSE 80 443 389 636
ENV container docker

# Define the user incase it's been altered by a previous layer.
USER root

WORKDIR /

# Add the copr repos we need
RUN dnf install -y dnf-plugins-core && dnf copr enable firstyear/ds -y

### Need to grab and install pyldap from here somehow!

# Now upgrade, and install useful tools.
# Httpd should be a dep on rest389
RUN /usr/bin/dnf upgrade -y && /usr/bin/dnf -y install httpd 389-ds-base python3-lib389 python3-rest389 python3-idm389 procps-ng iputils && /usr/bin/dnf clean all;

# Add the setup-inf, we have an example with the rest package though.
# Build the instance from the new installer tools.

RUN /usr/sbin/dsadm -v instance create -f /usr/share/rest389/examples/ds-setup-rest-admin.inf --IsolemnlyswearthatIamuptonogood --containerised


# Finally add the volumes, they will inherit the contents of these directories.
VOLUME /etc/dirsrv
VOLUME /var/log/dirsrv
VOLUME /var/lib/dirsrv

WORKDIR /var/empty

# Use systemd to start our services.
# RUN systemctl enable httpd; systemctl enable dirsrv@localhost
# STOPSIGNAL SIGRTMIN+3
# CMD [ "/sbin/init" ]

# Or, run them as dirsrv
USER dirsrv
CMD ["/usr/sbin/ns-slapd", "-d", "0", "-D", "/etc/dirsrv/slapd-localhost", "-i", "/var/run/dirsrv/slapd-localhost.pid"]

