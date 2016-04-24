## `17-COPY.m4'

`USER' root

# Install the copr's for Firstyear's 389-ds repos.

ifdef(`WITHDNF', `RUN' /usr/bin/DNFYUM install -y yum-plugin-copr, `RUN' /usr/bin/DNFYUM install -y wget )

# if (fedora, centos)
# svrcore
ifdef(`WITHDNF', dnf copr enable firstyear/svrcore -y, `RUN' wget -O /etc/yum.repos.d/firstyear-svrcore-epel-7.repo https://copr.fedorainfracloud.org/coprs/firstyear/svrcore/repo/epel-7/firstyear-svrcore-epel-7.repo    )

# python-lib389
ifdef(`WITHDNF', dnf copr enable firstyear/lib389 -y,  `RUN'  wget -O /etc/yum.repos.d/firstyear-lib389-epel-7.repo https://copr.fedorainfracloud.org/coprs/firstyear/lib389/repo/epel-7/firstyear-lib389-epel-7.repo  )

# python-rest389
ifdef(`WITHDNF', dnf copr enable firstyear/rest389 -y,  `RUN'  wget -O /etc/yum.repos.d/firstyear-rest389-epel-7.repo https://copr.fedorainfracloud.org/coprs/firstyear/rest389/repo/epel-7/firstyear-rest389-epel-7.repo  )

# ds
ifdef(`WITHDNF', dnf copr enable firstyear/ds -y,  `RUN'  wget -O /etc/yum.repos.d/firstyear-ds-epel-7.repo https://copr.fedorainfracloud.org/coprs/firstyear/ds/repo/epel-7/firstyear-ds-epel-7.repo  )

