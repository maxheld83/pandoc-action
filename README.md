# GitHub Action to Convert Documents via Pandoc

<!-- badges: start -->
[![Actions Status](https://github.com/maxheld83/pandoc/workflows/Document%20Conversion/badge.svg)](https://github.com/maxheld83/pandoc/actions)
<!-- badges: end -->

## Soft-Deprecation

**This action is soft-deprecated, because you no longer need it.**

You can now *directly* [reference container actions](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/configuring-a-workflow#referencing-a-container-on-docker-hub) on GitHub Actions.
This action is thus no longer needed.
(If you disagree, please reopen [#16](https://github.com/maxheld83/pandoc/issues/16).)
You can continue to use the [pandoc containers](https://github.com/maxheld83/pandoc/issues/16) on GitHub Actions, but now you can just reference it by, say, `uses: docker://pandoc/latex:2.9` instead of `uses: maxheld83/pandoc@v2`.

**This action will remain listed, but will no longer receive major updates**.

To learn more about using pandoc on GitHub Actions, see this [example](https://github.com/maxheld83/pandoc-example).

----

This action lets you use [pandoc](https://pandoc.org/), the **swiss army knife of document conversion**.

It is based on the [`pandoc/latex`](https://hub.docker.com/r/pandoc/latex/) docker image and thus ships with LaTeX, so you can also convert right through to PDF.

The action currently uses pandoc 2.6 ~~and will be upgraded periodically.
If you would like to see an upgrade, please [file an issue](http://github.com/maxheld83/pandoc/issues).~~


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
      - uses: maxheld83/pandoc@v2
        with:
          args: "--help"
```


## Advanced Usage

You can:

- create an output directory to compile into; makes it easier to deploy outputs.
- upload the output directory to [GitHub's artifact storage](https://help.github.com/en/articles/managing-a-workflow-run#downloading-logs-and-artifacts); you can quickly download the results from your GitHub Actions tab in your repo.

```
name: Document Conversion

on: push

jobs:
  convert_via_pandoc:
    name: Convert via Pandoc
    runs-on: ubuntu-18.04
    steps:
      - uses: actions/checkout@v1
      - run: mkdir output
      - run: echo "foo" > input.txt
      - uses: maxheld83/pandoc@v2
        with:
          args: "--standalone --output=output/index.html input.txt"
      - uses: actions/upload-artifact@master
        with:
          name: output
          path: output
```
