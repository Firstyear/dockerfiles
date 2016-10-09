## `17-COPR.m4'

# Install the copr's for Firstyear's 389-ds repos.

ifdef(`WITHDNF', `RUN' /usr/bin/DNFYUM install -y dnf-plugins-core, `RUN' /usr/bin/DNFYUM install -y wget )

# ds
ifdef(`WITHDNF', `RUN' dnf copr enable firstyear/ds -y,  `RUN'  wget -O /etc/yum.repos.d/firstyear-ds-epel-7.repo https://copr.fedorainfracloud.org/coprs/firstyear/ds/repo/epel-7/firstyear-ds-epel-7.repo  )

