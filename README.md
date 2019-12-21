# GitHub Action to Convert Documents via Pandoc

<!-- badges: start -->
[![Actions Status](https://github.com/maxheld83/pandoc-action/workflows/Document%20Conversion/badge.svg)](https://github.com/maxheld83/pandoc-action/actions)
<!-- badges: end -->

## Soft-Deprecation: Better Alternatives

**This action is soft-deprecated, because you no longer need it.**

**This action will remain listed, but will no longer receive major updates**.

There are now two better ways to use pandoc on GitHub Actions:

### Container Actions

You can now *directly* [reference container actions](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/configuring-a-workflow#referencing-a-container-on-docker-hub) on GitHub Actions.

You can continue to use the [pandoc containers](https://github.com/maxheld83/pandoc/issues/16) on GitHub Actions, but now you can just reference it by, say, `uses: docker://pandoc/latex:2.9` instead of `uses: maxheld83/pandoc@v2`.

To learn more about using pandoc on GitHub Actions in this way, see these [examples](https://github.com/maxheld83/pandoc-example).


### `setup-pandoc` Action

In the above, you're using pandoc from a pre-build docker image, that you're running as a *container* on your GitHub Actions host machine.

Alternatively, you can use [Jim Hester](https://www.jimhester.com)'s [setup-pandoc](https://github.com/r-lib/actions/tree/master/setup-pandoc) action.
This action will accept a `pandoc-version` as an input and install the respective version directly into your GitHub Actions *host machine*.
This may take longer (?), and does not include LaTeX, but you can use pandoc in any of your steps and can even run a matrix build over different pandoc versions.


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
