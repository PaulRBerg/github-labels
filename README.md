# GitHub Labels

Useful for synchronizing labels across GitHub repositories. See
[github-label-sync](https://github.com/Financial-Times/github-label-sync/).

## Pre Requisites

Install the following package with npm:

```sh
npm install --global github-label-sync
```

And have your GitHub token set in the environment variable `GITHUB_TOKEN`. The token must have the `repo` and
`public_repo` scopes.

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

If you want to overwrite the labels, and also delete the labels that are not listed in the YAML files, remove the
`--allow-added-labels` flag.

```sh
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yml owner/repo
```

> [!WARNING]
>
> The last command will delete any labels that are not listed in the YAML files. Use with caution.
