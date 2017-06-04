# Contributors guide

## Packaging

An unsigned Debian package can be created from the repository in a few steps.

Check out the version you want:

```bash
VERSION=1.0
git checkout v$VERSION
```

Write a 'pristine source' tarball from `git`:

```bash
git archive --format tar.gz HEAD --prefix mdcheckr-$VERSION/ mdcheckr tests README.md LICENSE.md > mdcheckr_$VERSION.orig.tar.gz
```

Extract, add the Debian goodies, compile, and cleanup:

```bash
tar -xzf mdcheckr_$VERSION.orig.tar.gz
cp -Rf debian/ mdcheckr-$VERSION/
(cd mdcheckr-$VERSION/ && debuild -us -uc)
rm -Rf mdcheckr-$VERSION/
```

You will then have source and binary packages in the current directory.
