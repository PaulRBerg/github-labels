# GitHub Labels

Synchronizing the GitHub labels across repositories.

This repo relies upon a bespoke shell script (`scripts/sync-labels.sh`) that talks to the GitHub API via the
[`gh`](https://cli.github.com) CLI.

## Pre Requisites

Install the following tools:

- [`gh`](https://cli.github.com) — GitHub CLI, authenticated via `gh auth login` or a `GITHUB_TOKEN` environment
  variable with the `repo` scope
- [`yq`](https://github.com/mikefarah/yq) — YAML processor
- [`just`](https://github.com/casey/just) — command runner

## Usage

Run`just --list` to see the available commands.

To apply the labels to all repos:

```sh
just apply-all
```

To apply the labels to one particular repo:

```sh
just apply-repo my-repo
```

To preview what a sync would change without touching anything:

```sh
just dry-run my-repo
```

## Configuration

Labels are defined in `labels/default.yml`. The `just apply-repo` command will preserve existing labels in the
repository, while `just apply-repo-overwrite` will delete any labels not listed in the YAML file.

> [!WARNING]
>
> The `apply-repo-overwrite` command will delete any labels that are not listed in the YAML files. Use with caution.
