# GitHub Action to Convert Documents via Pandoc

[![GitHubActions](https://img.shields.io/badge/as%20seen%20on%20-GitHubActions-blue.svg)](https://github-actions.netlify.com/pandoc)

This action lets you use [pandoc](https://pandoc.org/), the **swiss army knife of document conversion**.

It is based on the [`pandoc/latex`](https://hub.docker.com/r/pandoc/latex/) docker image and thus ships with LaTeX, so you can also convert right through to PDF.

The action currently uses pandoc 2.6 and will be upgrade periodically. 
If you would like to see an upgrade, please [file an issue](http://github.com/maxheld83/pandoc/issues).


## Inputs

None.


## Outputs

None.


## Secrets

None.


## Environment Variables

None.


## Example Usage

The string passed to `args` gets appended to the [`pandoc` command](https://pandoc.org/MANUAL.html).
The below example is equivalent to running `pandoc --help`.

```
name: Document Conversion

on: push

jobs:
  convert_via_pandoc:
    name: Convert via Pandoc
    runs-on: ubuntu-18.04
    steps:
      - uses: actions/checkout@v1
      - uses: maxheld83/pandoc@master
        with:
          args: "--help"
```
