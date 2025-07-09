# GitHub Labels

Synchronizing the GitHub labels across repositories.

This repo relies upon the [`github-label-sync`](https://github.com/Financial-Times/github-label-sync) npm package.

## Pre Requisites

Install the following package:

```sh
npm install -g github-label-sync
```

Install [`just`](https://github.com/casey/just) command runner.

And have your GitHub token set in the environment variable `GITHUB_TOKEN`. The token must have the `repo` and
`public_repo` scopes.

## Usage

Run`just --list` to see the available commands.

To apply the labels to all repos:

```sh
just apply-all
```

To apply the labels to one particular repo:

```sh
just apply-repo owner/repo
```

## Configuration

Labels are defined in `labels/default.yml`. The `just apply-repo` command will preserve existing labels in the
repository, while `just apply-repo-overwrite` will delete any labels not listed in the YAML file.

> [!WARNING]
>
> The `apply-repo-overwrite` command will delete any labels that are not listed in the YAML files. Use with caution.
