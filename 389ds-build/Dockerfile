FROM 389ds-base:latest
MAINTAINER william@blackhats.net.au

# We have to make this a mapped volume because else it won't persist once the build process is actually complete.
# Alternately, what if we ran the build as the CMD?
VOLUME /development/389ds/dsbuild:/usr/src/389ds/dsbuild
WORKDIR /usr/src/389ds/dsbuild/
RUN make clean; echo done
RUN make distclean; echo done
RUN /usr/src/389ds/ds/configure --with-openldap --enable-debug --prefix=$PREFIX
# Can't do the make install here,
#RUN make
#RUN make install
WORKDIR /usr/src/389ds/
CMD /bin/zsh
# Yum install build dependancies?
# ./configure
# make
# sudo make install


# These probably need to be a second site-specific layer
# Create the unattended answer file.
# setup-ds.pl
# ADd the ns-slapd as a start

