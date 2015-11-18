CENTOS_VERSIONS := 6 7
CENTOS_CUSTOM := centos_wibrown
# These are ordered in build order ...

CENTOS_VARIANTS := base devel 389ds-devel systemd

#all: fedora_dockers centos_dockers
all: centos_dockers

nocache: centos_dockers_nocache

dockerfiles: centos_dockerfiles

clean:
	rm -rf base*
	rm -rf $(CENTOS_CUSTOM)*
	#Clean docker bits here?

base:
	mkdir -p base
	m4 -I src src/ccache.conf.m4 > base/ccache.conf
	m4 -I src src/dnf.conf.m4 > base/dnf.conf
	m4 -I src src/yum.conf.m4 > base/yum.conf
	m4 -I src src/vimrc.m4 > base/vimrc
	m4 -I src src/user-sudo.m4 > base/user-sudo
	m4 -I src src/zshrc.m4 > base/zshrc

# So to add another, you likely need to add to the mkdir bit, then you add another m4 line
# We can't do loop magic here as we need to define the dependancies
centos_dockerfiles: base
	for VERSION in $(CENTOS_VERSIONS); do \
		for VARIANT in $(CENTOS_VARIANTS); do \
			mkdir -p  $(CENTOS_CUSTOM)_$${VARIANT}_$${VERSION} ;\
			cp base/* $(CENTOS_CUSTOM)_$${VARIANT}_$${VERSION}/ ;\
		done; \
		m4 -I src -DOS=centos -DVERSION=$${VERSION} src/base-Dockerfile.m4 > $(CENTOS_CUSTOM)_base_$${VERSION}/Dockerfile ;\
		m4 -I src -DOS=$(CENTOS_CUSTOM)_base -DVERSION=$${VERSION} src/devel-Dockerfile.m4 > $(CENTOS_CUSTOM)_devel_$${VERSION}/Dockerfile ;\
		m4 -I src -DOS=$(CENTOS_CUSTOM)_devel -DVERSION=$${VERSION} src/389ds-devel-Dockerfile.m4 > $(CENTOS_CUSTOM)_389ds-devel_$${VERSION}/Dockerfile ;\
		m4 -I src -DOS=$(CENTOS_CUSTOM)_base -DVERSION=$${VERSION} src/systemd-Dockerfile.m4 > $(CENTOS_CUSTOM)_systemd_$${VERSION}/Dockerfile ;\
	done

centos_dockers: centos_dockerfiles
	for VERSION in $(CENTOS_VERSIONS); do \
		for VARIANT in $(CENTOS_VARIANTS); do \
			sudo docker build -t $(CENTOS_CUSTOM)_$${VARIANT}:$${VERSION}  $(CENTOS_CUSTOM)_$${VARIANT}_$${VERSION}/ ;\
		done; \
	done

centos_dockers_nocache: centos_dockerfiles
	for VERSION in $(CENTOS_VERSIONS); do \
		for VARIANT in $(CENTOS_VARIANTS); do \
			sudo docker build --no-cache=true -t $(CENTOS_CUSTOM)_$${VARIANT}:$${VERSION}  $(CENTOS_CUSTOM)_$${VARIANT}_$${VERSION}/ ;\
		done; \
	done

