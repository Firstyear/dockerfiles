FEDORA_VERSIONS := 22
FEDORA_CUSTOM := fedora_wibrown
CENTOS_VERSIONS := 6 7
CENTOS_CUSTOM := centos_wibrown

all: fedora_dockers centos_dockers

all_nocache: fedora_dockers_nocache centos_dockers_nocache

clean:
	rm -rf base*
	rm -rf fedora*
	rm -rf centos*
	#Clean docker bits here?

base:
	mkdir -p base
	m4 -I src -DWITHDNF src/ccache.conf.m4 > base/ccache.conf
	m4 -I src -DWITHDNF src/dnf.conf.m4 > base/dnf.conf
	m4 -I src -DWITHDNF src/yum.conf.m4 > base/yum.conf
	m4 -I src -DWITHDNF src/vimrc.m4 > base/vimrc
	m4 -I src -DWITHDNF src/user-sudo.m4 > base/user-sudo
	m4 -I src -DWITHDNF src/zshrc.m4 > base/zshrc

# So to add another, you likely need to add to the mkdir bit, then you add another m4 line
fedora_dockerfiles: base
	for VERSION in $(FEDORA_VERSIONS); do \
	mkdir -p fedora_{389ds,base}_$${VERSION} ;\
	cp base/* fedora_base_$${VERSION}/ ;\
	m4 -I src -DOS=fedora -DVERSION=$${VERSION} -DWITHDNF src/base-Dockerfile.m4 > fedora_base_$${VERSION}/Dockerfile ;\
	m4 -I src -DOS=$(FEDORA_CUSTOM) -DVERSION=$${VERSION} -DWITHDNF src/389ds-Dockerfile.m4 > fedora_389ds_$${VERSION}/Dockerfile ;\
	done

fedora_dockers: fedora_dockerfiles
	for VERSION in $(FEDORA_VERSIONS); do \
	sudo docker build -t $(FEDORA_CUSTOM):$${VERSION} fedora_base_$${VERSION}/ ;\
	sudo docker build -t $(FEDORA_CUSTOM)_389ds:$${VERSION} fedora_389ds_$${VERSION}/ ;\
	done

fedora_dockers_nocache: fedora_dockerfiles
	for VERSION in $(FEDORA_VERSIONS); do \
	sudo docker build --no-cache=true -t $(FEDORA_CUSTOM):$${VERSION} fedora_base_$${VERSION}/ ;\
	sudo docker build --no-cache=true -t $(FEDORA_CUSTOM)_389ds:$${VERSION} fedora_389ds_$${VERSION}/ ;\
	done


# So to add another, you likely need to add to the mkdir bit, then you add another m4 line
centos_dockerfiles: base
	for VERSION in $(CENTOS_VERSIONS); do \
	mkdir -p centos_{base,389ds}_$${VERSION} ;\
	cp base/* centos_base_$${VERSION}/ ;\
	m4 -I src -DOS=centos -DVERSION=$${VERSION} src/base-Dockerfile.m4 > centos_base_$${VERSION}/Dockerfile ;\
	m4 -I src -DOS=$(CENTOS_CUSTOM) -DVERSION=$${VERSION} src/389ds-Dockerfile.m4 > centos_389ds_$${VERSION}/Dockerfile ;\
	done

centos_dockers: centos_dockerfiles
	for VERSION in $(CENTOS_VERSIONS); do \
	sudo docker build -t $(CENTOS_CUSTOM):$${VERSION} centos_base_$${VERSION}/ ;\
	sudo docker build -t $(CENTOS_CUSTOM)_389ds:$${VERSION} centos_389ds_$${VERSION}/ ;\
	done

centos_dockers_nocache: centos_dockerfiles
	for VERSION in $(CENTOS_VERSIONS); do \
	sudo docker build --no-cache=true -t $(CENTOS_CUSTOM):$${VERSION} centos_base_$${VERSION}/ ;\
	sudo docker build --no-cache=true -t $(CENTOS_CUSTOM)_389ds:$${VERSION} centos_389ds_$${VERSION}/ ;\
	done

