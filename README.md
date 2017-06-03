# mdcheckr [![Build Status](https://travis-ci.org/mike42/mdcheckr.svg?branch=master)](https://travis-ci.org/mike42/mdcheckr)

Practical CI testing for markdown files.

## Dependencies

Requirements:

- curl
- xmllint
- pandoc

## Installation

```bash
curl https://raw.githubusercontent.com/mike42/mdcheckr/master/mdcheckr -o mdcheckr
chmod +x mdcheckr
sudo cp mdcheckr /usr/local/bin
```

## Usage

Check a single markdown file:

```
mdcheckr README.md
```

Check all the markdown files in the current directory:

```
find . -name '*.md' -print0 | xargs -0 mdcheckr
```

Check all the markdown files in your Git repository:

```bash
git ls-files | grep '\.md$' | tr '\n' '\0' | xargs -0 mdcheckr
```



