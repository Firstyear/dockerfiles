DOCKERNAME := $(notdir $(CURDIR))

cache:
	docker build -t $(DOCKERNAME):latest .

nocache:
	docker build --no-cache=true -t $(DOCKERNAME):latest .
