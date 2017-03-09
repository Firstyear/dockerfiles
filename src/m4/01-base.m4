## `BASE.M4'

`FROM' OS:VERSION
`MAINTAINER' AUTHOR

# Timezones
`RUN' cd /etc && ln -sf ../usr/share/zoneinfo/TZ localtime

# If centos / el7, we need to build the locale

# You may need to install glibc-locale-source because f26 is fucked


`RUN' localedef -i en_AU -c -f UTF-8 en_AU.UTF-8

