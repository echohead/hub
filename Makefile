export GOPATH:=$(CURDIR)/Godeps/_workspace:$(GOPATH)
VERSION=$(shell ./hub --version | grep 'hub version' | sed 's/[[:alpha:][:space:]]//g')

all:
	go build --ldflags '-extldflags "-static"' -installsuffix cgo -o hub .

release: all
	git tag $(VERSION)
	git push origin --tags
	hub release create -a hub $(VERSION)
