VERSION=1.0

.PHONY: default test

default: test

test:
	bash -n mdcheckr
	(cd tests && ./test.sh)

