GO    		:= GO15VENDOREXPERIMENT=1 go
glide    	:= glide
release    	:= ./release.sh

all: build

deps: 
	@echo ">> getting dependencies"
	mkdir -p "${GOPATH}/bin"
	curl https://glide.sh/get | sh
	@$(glide) install

build: deps
	@echo ">> building binaries"
	@$(release)

docker: 
	@echo ">> building micromdm-dev docker container"
	docker build -f Dockerfile.dev -t micromdm-dev .

