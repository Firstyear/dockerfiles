CENTOS_VERSIONS := 7
CENTOS_CUSTOM := centos
# These are ordered in build order ...

FEDORA_CUSTOM := fedora
FEDORA_VERSIONS := rawhide

# VARIANTS := base devel 389ds-devel systemd
#VARIANTS := devel 389ds-devel
VARIANTS ?= 389ds-devel sshd # 389ds 389ds-test devel

#all: fedora_dockers centos_dockers
all: centos_dockers fedora_dockers

nocache: centos_dockers_nocache fedora_dockers_nocache

dockerfiles: centos_dockerfiles fedora_dockerfiles

clean:
	rm -rf base*
	rm -rf $(CENTOS_CUSTOM)*
	rm -rf $(FEDORA_CUSTOM)*
	#Clean docker bits here?
	#./docker-remove-images.sh; true
	#sudo ./docker-cleanup-volumes.sh; true

base:
	mkdir -p base
	for FILE in $(shell ls -1 src/configs) ; do \
		echo $${FILE} ; \
		m4 -I src/m4 src/configs/$${FILE} > base/$${FILE} ;\
	done

# So to add another, you likely need to add to the mkdir bit, then you add another m4 line
# We can't do loop magic here as we need to define the dependancies
centos_dockerfiles: base
	for VERSION in $(CENTOS_VERSIONS); do \
		for VARIANT in $(VARIANTS); do \
			mkdir -p  $(CENTOS_CUSTOM)_$${VARIANT}_$${VERSION} ;\
			cp base/* $(CENTOS_CUSTOM)_$${VARIANT}_$${VERSION}/ ;\
			m4 -I src/m4 -DOS=centos -DVERSION=$${VERSION} src/$${VARIANT}-Dockerfile.m4 > $(CENTOS_CUSTOM)_$${VARIANT}_$${VERSION}/Dockerfile ;\
		done; \
	done

centos_dockers: centos_dockerfiles
	for VERSION in $(CENTOS_VERSIONS); do \
		for VARIANT in $(VARIANTS); do \
			echo sudo docker build -t $(CENTOS_CUSTOM)_$${VARIANT}:$${VERSION} $(CENTOS_CUSTOM)_$${VARIANT}_$${VERSION} ;\
			sudo docker build -t $(CENTOS_CUSTOM)_$${VARIANT}:$${VERSION} $(CENTOS_CUSTOM)_$${VARIANT}_$${VERSION} ;\
		done; \
	done
	#if [ -e /usr/bin/docker-squash ]; then sudo /usr/bin/docker-squash  --tmp-dir=/var/tmp/docker_squash $(CENTOS_CUSTOM)_$${VARIANT}:$${VERSION}; fi ;\

centos_dockers_nocache: centos_dockerfiles
	for VERSION in $(CENTOS_VERSIONS); do \
		for VARIANT in $(VARIANTS); do \
			echo sudo docker build --no-cache=true -t $(CENTOS_CUSTOM)_$${VARIANT}:$${VERSION} $(CENTOS_CUSTOM)_$${VARIANT}_$${VERSION} ;\
			sudo docker build --no-cache=true -t $(CENTOS_CUSTOM)_$${VARIANT}:$${VERSION} $(CENTOS_CUSTOM)_$${VARIANT}_$${VERSION} ;\
		done; \
	done
	#if [ -e /usr/bin/docker-squash ]; then sudo /usr/bin/docker-squash --tmp-dir=/var/tmp/docker_squash $(CENTOS_CUSTOM)_$${VARIANT}:$${VERSION}; fi ;\

fedora_dockerfiles: base
	for VERSION in $(FEDORA_VERSIONS); do \
		for VARIANT in $(VARIANTS); do \
			mkdir -p  $(FEDORA_CUSTOM)_$${VARIANT}_$${VERSION} ;\
			cp base/* $(FEDORA_CUSTOM)_$${VARIANT}_$${VERSION}/ ;\
			m4 -I src/m4 -DOS=fedora -DWITHDNF -DVERSION=$${VERSION} src/$${VARIANT}-Dockerfile.m4 > $(FEDORA_CUSTOM)_$${VARIANT}_$${VERSION}/Dockerfile ;\
		done; \
	done

fedora_dockers: fedora_dockerfiles
	for VERSION in $(FEDORA_VERSIONS); do \
		for VARIANT in $(VARIANTS); do \
			echo sudo docker build -t $(FEDORA_CUSTOM)_$${VARIANT}:$${VERSION} $(FEDORA_CUSTOM)_$${VARIANT}_$${VERSION} ;\
			sudo docker build -t $(FEDORA_CUSTOM)_$${VARIANT}:$${VERSION} $(FEDORA_CUSTOM)_$${VARIANT}_$${VERSION} ;\
		done; \
	done
	#if [ -e /usr/bin/docker-squash ]; then sudo /usr/bin/docker-squash --tmp-dir=/var/tmp/docker_squash $(FEDORA_CUSTOM)_$${VARIANT}:$${VERSION}; fi ;\

fedora_dockers_nocache: fedora_dockerfiles
	for VERSION in $(FEDORA_VERSIONS); do \
		for VARIANT in $(VARIANTS); do \
			echo sudo docker build --no-cache=true -t $(FEDORA_CUSTOM)_$${VARIANT}:$${VERSION} $(FEDORA_CUSTOM)_$${VARIANT}_$${VERSION} ;\
			sudo docker build --no-cache=true -t $(FEDORA_CUSTOM)_$${VARIANT}:$${VERSION} $(FEDORA_CUSTOM)_$${VARIANT}_$${VERSION} ;\
		done; \
	done
	#if [ -e /usr/bin/docker-squash ]; then sudo /usr/bin/docker-squash --tmp-dir=/var/tmp/docker_squash $(FEDORA_CUSTOM)_$${VARIANT}:$${VERSION}; fi ;\

