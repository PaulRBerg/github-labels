# GitHub Labels

Useful for synchronizing labels across GitHub repositories. See [github-label-sync](https://github.com/Financial-Times/github-label-sync/).

## Pre Requisites

Install the following package with npm:

```sh
npm install -g github-label-sync
```

And make sure that you have your GitHub token set in the environment variable `GITHUB_TOKEN`.

## Usage

To apply the labels to all repos:

```sh
$ ./apply.sh
```

To apply the labels to one particular repo:

```sh
github-label-sync --access-token $GITHUB_TOKEN --allow-added-labels --labels ./labels.yml owner/repo
```

Running these scripts will NOT overwrite any existing labels in the repo.

If you want to overwrite the labels, and also delete the labels that are not listed in the YAML files, remove the `--allow-added-labels` flag.
