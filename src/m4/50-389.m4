## `389.M4'

# For the flask api
`EXPOSE' 80 389 443 636
# These should all come from the rpm specs
# `RUN' /usr/bin/DNFYUM install -y 389-ds-base python-lib389 python-rest389 ldapvi
## We need to get pyldap here somehow, without pip
# `RUN'  /usr/bin/DNFYUM install -y ifdef(`WITHDNF',python3 python3-devel python3-setuptools python3-six python3-pyasn1 python3-pyasn1-modules python3-pip ,python34-devel python34-setuptools python34-six) gcc openldap-devel
# ifdef(`WITHDNF', , `RUN' /usr/bin/easy_install-3.4 pip)
## Can I fix this to only run on el7
# `RUN' pip3 install ifdef(`WITHDNF', , pyasn1 pyasn1-modules ) pyldap

# Data volume for this DS instance.
# Does this fuck the perms for setup-ds.pl
# VOLUME /var/lib/dirsrv
# VOLUME /var/log/dirsrv


