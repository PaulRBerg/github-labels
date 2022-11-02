# GitHub Labels

Useful for synchronizing labels across GitHub repositories. See [github-label-sync](https://github.com/Financial-Times/github-label-sync/).

## Pre Requisites

Install the following package with npm:

```sh
npm install -g github-label-sync
```

And make sure that you have your GitHub token set in the environment variable `GITHUB_TOKEN`.

## Usage

### Basic Labels

To apply the basic labels to all repos:

```sh
$ ./apply.sh
```

To apply the basic labels to one particular repo:

```sh
github-label-sync --access-token $GITHUB_TOKEN --allow-added-labels --labels ./priorities.yml owner/repo
```

WARNING: running these scripts will overwrite any existing labels in the repo, and will also delete the labels that are
not listed in the YAML files.

If you would like not to not delete the existing labels, you can use the `--allow-added-labels` flag.
