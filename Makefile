CENTOS_CUSTOM := centos
CENTOS_VERSIONS ?= 7

FEDORA_CUSTOM := fedora
FEDORA_VERSIONS ?= 27 26

VARIANTS ?= 389ds-devel

all: centos_dockers fedora_dockers

nocache: centos_dockers_nocache fedora_dockers_nocache

clean:
	echo do nothing

centos_dockers:
	for VERSION in $(CENTOS_VERSIONS); do \
		for VARIANT in $(VARIANTS); do \
			echo sudo docker build -t $(CENTOS_CUSTOM)_$${VARIANT}:$${VERSION} $(CENTOS_CUSTOM)_$${VARIANT}_$${VERSION} ;\
			sudo docker build -t $(CENTOS_CUSTOM)_$${VARIANT}:$${VERSION} $(CENTOS_CUSTOM)_$${VARIANT}_$${VERSION} ;\
		done; \
	done

centos_dockers_nocache:
	for VERSION in $(CENTOS_VERSIONS); do \
		for VARIANT in $(VARIANTS); do \
			echo sudo docker build --no-cache=true -t $(CENTOS_CUSTOM)_$${VARIANT}:$${VERSION} $(CENTOS_CUSTOM)_$${VARIANT}_$${VERSION} ;\
			sudo docker build --no-cache=true -t $(CENTOS_CUSTOM)_$${VARIANT}:$${VERSION} $(CENTOS_CUSTOM)_$${VARIANT}_$${VERSION} ;\
		done; \
	done

fedora_dockers:
	for VERSION in $(FEDORA_VERSIONS); do \
		for VARIANT in $(VARIANTS); do \
			echo sudo docker build -t $(FEDORA_CUSTOM)_$${VARIANT}:$${VERSION} $(FEDORA_CUSTOM)_$${VARIANT}_$${VERSION} ;\
			sudo docker build -t $(FEDORA_CUSTOM)_$${VARIANT}:$${VERSION} $(FEDORA_CUSTOM)_$${VARIANT}_$${VERSION} ;\
		done; \
	done

fedora_dockers_nocache:
	for VERSION in $(FEDORA_VERSIONS); do \
		for VARIANT in $(VARIANTS); do \
			echo sudo docker build --no-cache=true -t $(FEDORA_CUSTOM)_$${VARIANT}:$${VERSION} $(FEDORA_CUSTOM)_$${VARIANT}_$${VERSION} ;\
			sudo docker build --no-cache=true -t $(FEDORA_CUSTOM)_$${VARIANT}:$${VERSION} $(FEDORA_CUSTOM)_$${VARIANT}_$${VERSION} ;\
		done; \
	done




