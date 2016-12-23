## `SSSD.M4'
`RUN' mkdir -p /etc/skel/.vim/backup
`RUN' mkdir -p /etc/skel/development
`COPY' devel/zshrc /etc/skel/.zshrc
`COPY' devel/vimrc /etc/skel/.vimrc
`COPY' devel/zshrc /root/.zshrc
`COPY' devel/vimrc /root/.vimrc

`COPY' core/bh_admins-sudo /etc/sudoers.d/bh_admins-sudo
`COPY' core/bh_ldap.crt /etc/pki/tls/certs/bh_ldap.crt
`COPY' core/nsswitch.conf /etc/nsswitch.conf
`COPY' core/password-auth-ac /etc/pam.d/password-auth-ac
`COPY' core/password-auth-ac /etc/pam.d/password-auth
`COPY' core/system-auth-ac /etc/pam.d/system-auth-ac
`COPY' core/system-auth-ac /etc/pam.d/system-auth
`COPY' core/sshd_config /etc/ssh/sshd_config
`COPY' core/sssd.conf /etc/sssd/sssd.conf
`RUN' chown root:root /etc/sssd/sssd.conf; chmod 600 /etc/sssd/sssd.conf

# Do I need to fix any permissions?

`RUN' /usr/bin/DNFYUM install -y sssd openldap-clients sssd-ldap oddjob oddjob-mkhomedir && /usr/bin/DNFYUM clean all

`VOLUME' /home

