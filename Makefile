export GOPATH:=$(CURDIR)/Godeps/_workspace:$(GOPATH)

all:
	go build --ldflags '-extldflags "-static"' -installsuffix cgo -o hub .

