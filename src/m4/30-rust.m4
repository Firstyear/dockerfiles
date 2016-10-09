## RUST.M4
ifdef(`WITHDNF', `RUN' /usr/bin/DNFYUM install -y rust cargo ,`RUN' /usr/bin/DNFYUM install -y rust cargo --enablerepo=epel-testing)
