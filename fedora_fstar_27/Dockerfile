FROM fedora:27

MAINTAINER William Brown <william@blackhats.net.au>

# Install required packages and set versions
RUN dnf upgrade -y
RUN dnf install -y rsync git patch opam bzip2 which gmp gmp-devel m4 \
		ocaml ocaml-z3 ocaml-ocamlbuild hg unzip pkgconfig redhat-rpm-config \
		sudo make gdb ccache procps-ng wget findutils gcc ocaml-ocamldoc \
		ocaml-camlp4

RUN dnf install -y pkgconf-pkg-config ocaml-ulex

# Create user
RUN useradd -ms /bin/bash Work
RUN echo "Work ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers
USER Work
WORKDIR /home/Work

# Define versions of dependencies
ENV z3v 4.5.1.1f29cebd4df6-x64-ubuntu-14.04
ENV OPAMYES true
ENV PATH "/home/Work/z3/bin:~/FStar/bin:~/kremlin:$PATH"
ENV FSTAR_HOME /home/Work/FStar
ENV KREMLIN_HOME /home/Work/kremlin
ENV CHECK_IF_PREINSTALLED=false

# Prepare build (OCaml packages)
RUN opam init
RUN opam switch create 4.02.3
RUN opam switch 4.02.3
RUN echo ". /home/Work/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true" >> .bashrc
RUN opam install batteries fileutils yojson ppx_deriving_yojson zarith fix pprint menhir process stdint ulex
RUN opam install wasm


# Prepare and build Z3
# RUN wget https://github.com/FStarLang/binaries/raw/master/z3-tested/z3-${z3v}.zip
ADD z3-4.5.1.1f29cebd4df6-x64-ubuntu-14.04.zip /home/Work/
RUN unzip z3-${z3v}.zip
RUN ls -al /home/Work/
RUN mv z3-${z3v} z3
WORKDIR /home/Work

# Prepare and build F*
# RUN git clone https://github.com/FStarLang/FStar.git
# RUN wget https://github.com/FStarLang/FStar/archive/stable.zip && \
# 	unzip stable.zip && \
# 	mv FStar-stable Fstar && \
# 	rm stable.zip
ADD fstar-stable.zip /home/Work/
RUN unzip fstar-stable.zip
RUN ls -al /home/Work/
RUN mv FStar-stable FStar
WORKDIR /home/Work/FStar
# RUN git checkout ${fstarv}
RUN opam config exec -- make -C src/ocaml-output -j
RUN opam config exec -- make -C ulib/ml
WORKDIR /home/Work

# Prepare and build KreMLin
# RUN git clone https://github.com/FStarLang/kremlin.git
# https://github.com/FStarLang/kremlin/archive/master.zip
# RUN wget https://github.com/FStarLang/kremlin/archive/master.zip && \
# 	unzip master.zip && \
# 	mv kremlin-master kremlin && \
# 	rm master.zip
ADD kremlin-master.zip /home/Work/
RUN unzip kremlin-master.zip
RUN mv kremlin-master kremlin
WORKDIR /home/Work/kremlin
# RUN git checkout ${kremlinv}
RUN opam config exec -- make
RUN opam config exec -- make test
WORKDIR /home/Work

# # Prepare and build HACL*
# ARG CACHEBUST=1
# RUN git clone https://github.com/mitls/hacl-star.git
# # https://github.com/mitls/hacl-star/archive/master.zip
# RUN wget https://github.com/mitls/hacl-star/archive/master.zip && \
# 	unzip master.zip && \
# 	mv hacl-star-master hacl-star && \
# 	rm master.zip
# WORKDIR /home/Work/hacl-star
# # RUN git checkout master
# RUN opam config exec -- make snapshots/hacl-c -j
# RUN opam config exec -- make build
# WORKDIR /home/Work
