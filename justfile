set shell := ["bash", "-euo", "pipefail", "-c"]

# ---------------------------------------------------------------------------- #
#                                 DEPENDENCIES                                 #
# ---------------------------------------------------------------------------- #

# https://github.com/Financial-Times/github-label-sync
github-label-sync := require("github-label-sync")

# ---------------------------------------------------------------------------- #
#                                   CONSTANTS                                  #
# ---------------------------------------------------------------------------- #

LABELS_DEFAULT := "./labels/default.yml"
GITHUB_TOKEN := env("GITHUB_TOKEN")

# ---------------------------------------------------------------------------- #
#                                    RECIPES                                   #
# ---------------------------------------------------------------------------- #

# Show available commands
default:
    @just --list

# Apply default labels to all repositories, preserving existing labels
[confirm("This will sync GitHub labels across all repositories. Continue? y/n")]
@apply-all:
    just apply-all-impl

# Apply default labels to a specific repository, preserving existing labels
apply-repo repo:
    github-label-sync \
        --access-token {{ GITHUB_TOKEN }} \
        --allow-added-labels \
        --labels {{ LABELS_DEFAULT }} \
        {{repo}}

# Apply default labels to a specific repository, overwriting existing labels
[confirm("WARNING: This will delete any labels not listed in labels.yml! Continue? y/n")]
apply-repo-overwrite repo:
    github-label-sync \
        --access-token {{ GITHUB_TOKEN }} \
        --labels {{ LABELS_DEFAULT }} \
        {{repo}}

# Show default labels
show-labels:
    @echo "Default labels configuration:"
    @cat {{ LABELS_DEFAULT }}

# ---------------------------------------------------------------------------- #
#                               RECIPES: HELPERS                               #
# ---------------------------------------------------------------------------- #

# Apply default labels to all repositories
[private]
apply-all-impl:
    #!/usr/bin/env sh
    repos=(
        "PaulRBerg/cryptfolio-scripts"
        "PaulRBerg/dot-claude"
        "PaulRBerg/evm-bn"
        "PaulRBerg/foundry-multibuild"
        "PaulRBerg/foundry-template"
        "PaulRBerg/hardhat-packager"
        "PaulRBerg/hardhat-template"
        "PaulRBerg/javascript-template"
        "PaulRBerg/multisol"
        "PaulRBerg/next-template",
        "PaulRBerg/PaulRBerg.github.io"
        "PaulRBerg/prb-contracts"
        "PaulRBerg/prb-longevity"
        "PaulRBerg/prb-math"
        "PaulRBerg/prb-proxy"
        "PaulRBerg/prb-test"
        "PaulRBerg/rust-template"
        "PaulRBerg/typescript-template"
    )

    for repo in "${repos[@]}"; do
        echo "Syncing labels for $repo..."
        github-label-sync \
            --access-token {{ GITHUB_TOKEN }} \
            --allow-added-labels \
            --labels {{ LABELS_DEFAULT }} \
            "$repo"
    done
