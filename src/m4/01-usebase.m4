## `USEBASE.m4'

`FROM' OS()_base:VERSION
`MAINTAINER' AUTHOR

# Timezones
`RUN' cd /etc && ln -sf ../usr/share/zoneinfo/TZ localtime

# If centos / el7, we need to build the locale
ifdef(`WITHDNF', , `RUN' localedef -i en_AU -c -f UTF-8 en_AU.UTF-8 )

