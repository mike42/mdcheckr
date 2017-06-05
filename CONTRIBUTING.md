# Contributors guide

## Packaging

## Source release

A source tarball can be created from the `Makefile`:

```bash
git checkout v1.0
make source-release
```

This is suitable as a "pristine" source for downstream packagers.

## Debian unsigned package

An unsigned Debian package can also be created from the repository in a few steps.

Check out the version you want:

```bash
git checkout v1.0
make unsigned-package
```

You will then have source and binary packages in the current directory.
