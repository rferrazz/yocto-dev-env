VERSION = $(shell git describe --always)

deploy:
	cat dev-env > dev-env_$(VERSION).sh
	echo "" >> dev-env_$(VERSION).sh
	echo "PAYLOAD:" >> dev-env_$(VERSION).sh
	tar -czf - resources Dockerfile.template >> dev-env_$(VERSION).sh
	chmod 555 dev-env_$(VERSION).sh

default: deploy

.PHONY: deploy default