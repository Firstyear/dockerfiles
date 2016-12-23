## RUST.M4
`RUN' ifdef(`WITHDNF', /usr/bin/DNFYUM install -y rust cargo , /usr/bin/DNFYUM install -y rust cargo --enablerepo=epel-testing); true && /usr/bin/DNFYUM clean all
