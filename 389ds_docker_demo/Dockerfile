FROM fedora:latest
MAINTAINER wibrown@redhat.com
EXPOSE 389 636

# Define the user incase it's been altered by a previous layer.
USER root

WORKDIR /

RUN /usr/bin/dnf upgrade -y; /usr/bin/dnf -y install 389-ds-base procps-ng ; /usr/bin/dnf clean all;

# We ADD a replacement to systemctl as per adelton's work from https://github.com/adelton/docker-freeipa
ADD systemctl /usr/bin/systemctl
ADD systemctl-socket-daemon /usr/bin/systemctl-socket-daemon
RUN chmod -v +x /usr/bin/systemctl /usr/bin/systemctl-socket-daemon

# Add a basic setup.inf
ADD setup.inf /tmp/setup.inf

# Add all the volumes ? Or do we let the container thingy do this.
# VOLUME /etc/dirsrv/slapd-

# Fix the hosts file, then run the installer
## This currently takes a while due to selinux bits missing, but updates to 389's setup-ds.pl will correct this
RUN sed -c -i 's/localhost/localhost.localdomain localhost/g' /etc/hosts; /usr/sbin/setup-ds.pl --file=/tmp/setup.inf --debug --silent; ps aux;  /usr/bin/systemctl stop dirsrv@localhost

# We don't need to keep the answer file around.
RUN rm /tmp/setup.inf

USER nobody
WORKDIR /var/empty
# Start slapd. This is forking so we need a process watcher ... 
CMD /usr/sbin/ns-slapd -D /etc/dirsrv/slapd-localhost -i /var/run/dirsrv/slapd-localhost.pid -w /var/run/dirsrv/slapd-localhost.startpid

