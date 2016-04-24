## `LOCALISE.M4'

# Timezones
`WORKDIR' /etc
`RUN' ln -sf ../usr/share/zoneinfo/TZ localtime

# If centos / el7, we need to build the locale
ifdef(`WITHDNF', , `RUN' localedef -i en_AU -c -f UTF-8 en_AU.UTF-8 )

`WORKDIR' /

# This is to add local proxy support
`COPY' DNFYUM.conf /etc/DNFYUM/DNFYUM.conf

