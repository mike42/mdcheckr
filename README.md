# mdcheckr [![Build Status](https://travis-ci.org/mike42/mdcheckr.svg?branch=master)](https://travis-ci.org/mike42/mdcheckr)

`mdcheckr` is a testing tool to detect quality problems with your Markdown documentation. It is designed to act as a quality gate in your continuous integration pipeline.

- **Syntax errors in code blocks** - Syntax-check code blocks that identify their language. Currently works for:
  - bash ([example](tests/04_codeblock_bash_bad.md))
  - PHP ([example](tests/05_codeblock_php_bad.md))
- **Code blocks**- Detection of un-closed code blocks ([example](tests/06_codeblock_plain_bad.md))
- **Broken links**- Flag files that link to relative paths or URLs on the internet which can't be accessed ([example](tests/00_rel_link_bad.md), [example](tests/01_abs_link_bad.md)).
- **Broken images**- Detect broken embeds, local and remote ([example](tests/02_rel_img_bad.md), [example](tests/03_abs_image_bad.md)).

This tool is not intended to enforce a code style, and will not critique aspects of your Markdown code which do not affect the output.

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



