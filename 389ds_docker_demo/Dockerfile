FROM centos:7
MAINTAINER wibrown@redhat.com
EXPOSE 389 636
ENV container docker

### WARNING: Must run as root for now ....

# Add the copr repos we need
RUN /usr/bin/yum install -y wget && /usr/bin/yum clean all;
RUN wget -O /etc/yum.repos.d/firstyear-ds-epel-7.repo https://copr.fedorainfracloud.org/coprs/firstyear/ds/repo/epel-7/firstyear-ds-epel-7.repo

### Need to grab and install pyldap from here somehow!

# Now upgrade, and install useful tools.

RUN /usr/bin/yum upgrade -y && /usr/bin/yum -y install 389-ds-base python2-lib389 && /usr/bin/yum clean all;

# Create the example setup inf. It's valid for containers!
RUN /usr/sbin/dsadm instance example > /root/ds-setup.inf

# Build the instance from the new installer tools.
RUN /usr/sbin/dsadm -v instance create -f /root/ds-setup.inf --IsolemnlyswearthatIamuptonogood --containerised

# Finally add the volumes, they will inherit the contents of these directories.
VOLUME /etc/dirsrv
VOLUME /var/log/dirsrv
VOLUME /var/lib/dirsrv

# Or, run them as dirsrv
# USER dirsrv
CMD ["/usr/sbin/ns-slapd", "-d", "0", "-D", "/etc/dirsrv/slapd-localhost", "-i", "/var/run/dirsrv/slapd-localhost.pid"]


