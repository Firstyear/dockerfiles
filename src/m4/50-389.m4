## `389.M4'

# For the flask api
`EXPOSE' 80 389 443 636 5000

`USER' root

`RUN' /usr/bin/DNFYUM install -y 389-ds-base python-lib389 python-rest389 ldapvi ;/usr/bin/DNFYUM clean all
## We need to get pyldap here somehow ....
`RUN' /usr/bin/DNFYUM install -y python34-devel python34-setuptools python34-six gcc openldap-devel
`RUN' /usr/bin/easy_install-3.4 pip
`RUN' pip3.4 install pyasn1 pyasn1-modules pyldap


