VERSION=1.0

.PHONY: default test offline-test source-tarball unsigned-package

default: test

test:
	bash -n mdcheckr
	(cd tests && ./test.sh)

source-tarball: mdcheckr_$(VERSION).orig.tar.gz

mdcheckr_$(VERSION).orig.tar.gz:
	tar --transform "s/^/mdcheckr-$(VERSION)\//" -cvzf \
		mdcheckr_$(VERSION).orig.tar.gz \
		LICENSE.md \
		README.md \
		mdcheckr \
		tests

unsigned-package: mdcheckr_$(VERSION)-1_all.deb

mdcheckr_$(VERSION)-1_all.deb: mdcheckr_$(VERSION).orig.tar.gz
	tar -xzf mdcheckr_$(VERSION).orig.tar.gz
	cp -Rf debian/ mdcheckr-$(VERSION)/
	(cd mdcheckr-$(VERSION)/ && debuild -us -uc)
	rm -Rf mdcheckr-$(VERSION)/

clean:
	rm -Rf mdcheckr-$(VERSION)* mdcheckr_$(VERSION)*
