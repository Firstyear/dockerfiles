DOCKERNAME := $(notdir $(CURDIR))
FEDORA_VERSIONS := 21 22 23
FEDORA_CUSTOM := fedora_wibrown

all: fedora_dockers

all_nocache: fedora_dockers_nocache

clean:
	rm -rf base*
	rm -rf fedora_base*
	rm -rf 389ds_base*
	#Clean docker bits here?

base:
	mkdir -p base
	m4 -I src -DWITHDNF src/ccache.conf.m4 > base/ccache.conf
	m4 -I src -DWITHDNF src/dnf.conf.m4 > base/dnf.conf
	m4 -I src -DWITHDNF src/vimrc.m4 > base/vimrc
	m4 -I src -DWITHDNF src/user-sudo.m4 > base/user-sudo
	m4 -I src -DWITHDNF src/zshrc.m4 > base/zshrc

# So to add another, you likely need to add to the mkdir bit, then you add another m4 line
fedora_dockerfiles: base
	for VERSION in $(FEDORA_VERSIONS); do \
	mkdir -p {fedora,389ds}_base_$${VERSION} ;\
	cp base/* fedora_base_$${VERSION}/ ;\
	m4 -I src -DOS=fedora -DVERSION=$${VERSION} -DWITHDNF src/fedora-base-Dockerfile.m4 > fedora_base_$${VERSION}/Dockerfile ;\
	m4 -I src -DOS=$(FEDORA_CUSTOM) -DVERSION=$${VERSION} -DWITHDNF src/389ds-base-Dockerfile.m4 > 389ds_base_$${VERSION}/Dockerfile ;\
	done

fedora_dockers: fedora_dockerfiles
	for VERSION in $(FEDORA_VERSIONS); do \
	sudo docker build -t $(FEDORA_CUSTOM):$${VERSION} fedora_base_$${VERSION}/ ;\
	sudo docker build -t 389ds_base:$${VERSION} 389ds_base_$${VERSION}/ ;\
	done

fedora_dockers_nocache: fedora_dockerfiles
	for VERSION in $(FEDORA_VERSIONS); do \
	sudo docker build --no-cache=true -t $(FEDORA_CUSTOM):$${VERSION} fedora_base_$${VERSION}/ ;\
	sudo docker build --no-cache=true -t 389ds_base:$${VERSION} 389ds_base_$${VERSION}/ ;\
	done


