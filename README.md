# GitHub Labels

Useful for synchronizing labels across GitHub repositories. See [github-label-sync](https://github.com/Financial-Times/github-label-sync/).

## Usage

Make sure that you have a GitHub token stored in the environment variable `GITHUB_TOKEN`.

To apply to all repos:

```sh
$ ./apply.s
```

To apply to one particular repo:

```sh
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yaml owner/repo
```
