GO := GO15VENDOREXPERIMENT=1 go
PROMU := $(GOPATH)/bin/promu
PKGS := $(shell $(GO) list ./... | grep -v /vendor/)

PREFIX ?= $(shell pwd)
BIN_DIR ?= $(shell pwd)
DOCKER_IMAGE_NAME ?= jenkins_exporter

all: format build test

style:
	@echo ">> checking code style"
	@! gofmt -d $(shell find . -path ./vendor -prune -o -name '*.go' -print) | grep '^'

test:
	@echo ">> running tests"
	@$(GO) test -short $(PKGS)

format:
	@echo ">> formatting code"
	@$(GO) fmt $(PKGS)

vet:
	@echo ">> vetting code"
	@$(GO) vet $(PKGS)

build: promu
	@echo ">> building binaries"
	@$(PROMU) build --prefix $(PREFIX)

tarball: promu
	@echo ">> building release tarball"
	@$(PROMU) tarball $(BIN_DIR) -v --prefix $(PREFIX)

crossbuild:
	@echo ">> building release tarball"
	@$(PROMU) crossbuild -v

docker:
	@echo ">> building docker image"
	@docker build -t "$(DOCKER_IMAGE_NAME)" .

promu:
	@which promu > /dev/null; if [ $$? -ne 0 ]; then \
		$(GO) get -u github.com/prometheus/promu; \
	fi

.PHONY: all style format build test vet tarball docker promu
