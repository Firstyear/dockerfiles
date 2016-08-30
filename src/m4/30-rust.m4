## RUST.M4
`USER' root

ifdef(`WITHDNF', `RUN' /usr/bin/DNFYUM install -y rust cargo ,`RUN' /usr/bin/DNFYUM install -y rust-binary)
