FROM fedora:latest
RUN dnf install -y nmap
RUN cat /proc/net/if_inet6
RUN nmap 172.17.42.1 -p 3128
RUN nmap -6 fe80::1%eth0 -p 3128

