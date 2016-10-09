include(00-details.m4)
include(01-base.m4)
include(09-sssd.m4)
include(15-localise.m4)
include(17-copr.m4)
include(20-update.m4)

dnl include(25-devel.m4)

# Things I use a lot ...
`RUN' /usr/bin/DNFYUM install -y sudo vim screen ccache gcc gdb make iproute iputils findutils strace zsh rpm-build ldapvi procps-ng bind-utils yum-utils nc autoconf automake libtool man llvm rpmdevtools openssh-server

include(30-rust.m4)
include(99-mlocate.m4)

`RUN' systemctl enable sshd; systemctl enable sssd; systemctl enable oddjobd

include(99-systemd.m4)



