VERSION=1.0

.PHONY: default test

default: test

test:
	bash -n mdcheckr
  # Tests hit the Internet, switching off for offline build
	#(cd tests && ./test.sh)

