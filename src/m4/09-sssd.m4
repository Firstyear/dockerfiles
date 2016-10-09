## `SSSD.M4'
`RUN' mkdir -p /etc/skel/.vim/backup
`RUN' mkdir -p /etc/skel/development
`COPY' zshrc /etc/skel/.zshrc
`COPY' vimrc /etc/skel/.vimrc
`COPY' zshrc /root/.zshrc
`COPY' vimrc /root/.vimrc

`COPY' bh_admins-sudo /etc/sudoers.d/bh_admins-sudo
`COPY' bh_ldap.crt /etc/pki/tls/certs/bh_ldap.crt
`COPY' nsswitch.conf /etc/nsswitch.conf
`COPY' password-auth-ac /etc/pam.d/password-auth-ac
`COPY' password-auth-ac /etc/pam.d/password-auth
`COPY' system-auth-ac /etc/pam.d/system-auth-ac
`COPY' system-auth-ac /etc/pam.d/system-auth
`COPY' sshd_config /etc/ssh/sshd_config
`COPY' sssd.conf /etc/sssd/sssd.conf
`RUN' chown root:root /etc/sssd/sssd.conf; chmod 600 /etc/sssd/sssd.conf

# Do I need to fix any permissions?

`RUN' /usr/bin/DNFYUM install -y sssd openldap-clients sssd-ldap oddjob oddjob-mkhomedir
