## RUST.M4
# `RUN' ifdef(`WITHDNF', /usr/bin/DNFYUM install -y rust cargo , /usr/bin/DNFYUM install -y rust cargo --enablerepo=epel-testing); true && /usr/bin/DNFYUM clean all

`RUN' /usr/bin/DNFYUM install -y wget && /usr/bin/DNFYUM clean all

`RUN' wget https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init && \
    chmod +x rustup-init && \
    ./rustup-init --default-toolchain nightly -y


