GO    		:= GO15VENDOREXPERIMENT=1 go
glide    	:= glide
release    	:= ./release.sh

all: build

deps: 
	@echo ">> getting dependencies"
	mkdir -p "${GOPATH}/bin"
	go get -u github.com/Masterminds/glide
	@$(glide) install

build: deps
	@echo ">> building binaries"
	go test -v github.com/micromdm/micromdm/device
	@$(release)

docker: 
	@echo ">> building micromdm-dev docker container"
	docker build -f Dockerfile.dev -t micromdm-dev .

