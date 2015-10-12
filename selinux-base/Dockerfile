FROM fedora-wibrown:latest

USER root
RUN dnf install -y python gawk checkpolicy m4 policycoreutils-devel bzip2

USER wibrown
WORKDIR /home/wibrown
CMD /bin/zsh
