## RUST.M4
`USER' root
`RUN' /usr/bin/wget -O /etc/yum.repos.d/_copr_fabiand-rust-binary.repo https://copr.fedorainfracloud.org/coprs/fabiand/rust-binary/repo/epel-7/fabiand-rust-binary-epel-7.repo
`RUN' /usr/bin/DNFYUM install -y rust-binary

