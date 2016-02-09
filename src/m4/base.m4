## `BASE.M4'

`FROM' OS:VERSION
`MAINTAINER' AUTHOR

`USER' root
# Don't try and use volume mounts from host to the container, it actually adds
# in a relative volume path as: /var/lib/docker/volumes/home/william/development/389ds
## Which is probably okay for *some* tasks, like sharing code folders etc.
## Just need to be careful of that.

# Timezones
`WORKDIR' /etc
`RUN' ln -sf ../usr/share/zoneinfo/TZ localtime

# If centos / el7, we need to build the locale
ifdef(`WITHDNF', , `RUN' localedef -i en_AU -c -f UTF-8 en_AU.UTF-8 )

`WORKDIR' /

# Prove that ipv6 is broken on docker build (yay)
# https://github.com/docker/docker/issues/16913
# `RUN' cat /proc/net/if_inet6

# This is to add local proxy support
`COPY' DNFYUM.conf /etc/DNFYUM/DNFYUM.conf

# Cheats way to determine if centos ...
ifdef(`WITHDNF', , `RUN' /usr/bin/DNFYUM install -y epel-release )
`RUN' /usr/bin/DNFYUM upgrade -y; /usr/bin/DNFYUM clean all
