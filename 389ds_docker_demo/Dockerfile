FROM fedora:latest
MAINTAINER wibrown@redhat.com
EXPOSE 80 443 389 636
ENV container docker

# Define the user incase it's been altered by a previous layer.
USER root

WORKDIR /

# Add the copr repos we need
RUN dnf install -y dnf-plugins-core; dnf copr enable firstyear/svrcore -y; dnf copr enable firstyear/lib389 -y; dnf copr enable firstyear/rest389 -y; dnf copr enable firstyear/ds -y;

# Now upgrade, and install useful tools.
# Can't add rest389 yet til I fix the copr build .... :(
RUN /usr/bin/dnf upgrade -y; /usr/bin/dnf -y install httpd 389-ds-base procps-ng iputils; /usr/bin/dnf clean all;

# Add the setup-inf, we have an example with the rest package though.
# Build the instance from the new installer tools.
RUN /usr/sbin/dsadm -v instance create -f /usr/share/rest389/examples/ds-setup-rest-admin.inf --IsolemnlyswearthatIamuptonogood


# Finally add the volumes, they will inherit the contents of these directories.
VOLUME /etc/dirsrv
VOLUME /var/log/dirsrv
VOLUME /var/lib/dirsrv

WORKDIR /var/empty
# Use systemd to start our services.

RUN systemctl enable httpd; systemctl enable dirsrv@localhost

STOPSIGNAL SIGRTMIN+3
CMD [ "/sbin/init" ]

