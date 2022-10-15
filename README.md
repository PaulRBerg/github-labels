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
$ ./apply.s
```

To apply the basic labels to one particular repo:

```sh
github-label-sync --access-token $GITHUB_TOKEN --allow-added-labels --labels ./priorities.yml owner/repo
```

### Priority Labels

To apply the priority labels to all repos:

```sh
$ ./apply.s
```

To apply the priority labels to one particular repo:

```sh
github-label-sync --access-token $GITHUB_TOKEN --allow-added-labels --labels ./priorities.yml owner/repo
```
