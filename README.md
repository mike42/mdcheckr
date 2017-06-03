# mdcheckr

Practical CI testing for markdown files.

## Installation

Requirements:

- curl
- xmllint
- pandoc

```bash
git clone https://github.com/mike42/mdcheckr
cp mdcheckr/mdcheckr /usr/local/bin
```

## Usage

Check a single markdown file

Check all the markdown files in the current directory:

find . -name '*.md' -print0 | xargs -0 mdcheckr

Check all the markdown files in your Git repository:

```bash
git ls-files | grep '\.md$' | tr '\n' '\0' | xargs -0 mdcheckr
```



