set shell := ["bash", "-euo", "pipefail", "-c"]
set unstable

# ---------------------------------------------------------------------------- #
#                                 DEPENDENCIES                                 #
# ---------------------------------------------------------------------------- #

# https://github.com/Financial-Times/github-label-sync
github-label-sync := require("github-label-sync")

# ---------------------------------------------------------------------------- #
#                                   CONSTANTS                                  #
# ---------------------------------------------------------------------------- #

OWNER := "PaulRBerg"
LABELS_DEFAULT := "./labels/default.yml"
GITHUB_TOKEN := env("GITHUB_TOKEN")

# ---------------------------------------------------------------------------- #
#                                    RECIPES                                   #
# ---------------------------------------------------------------------------- #

# Show available commands
default:
    @just --list

# Apply default labels to all repositories, preserving existing labels
[confirm("This will sync GitHub labels across all repositories. Continue? y/N")]
@apply-all:
    just apply-all-impl

# Apply default labels to a specific repository, preserving existing labels
[confirm("This will sync GitHub labels to the specified repository. Continue? y/N")]
apply-repo repo:
    github-label-sync \
        --access-token {{ GITHUB_TOKEN }} \
        --allow-added-labels \
        --labels {{ LABELS_DEFAULT }} \
        {{ OWNER }}/{{ repo }}

# Apply default labels to a specific repository, overwriting existing labels
[confirm("WARNING: This will delete any labels not listed in labels.yml! Continue? y/N")]
apply-repo-overwrite repo:
    github-label-sync \
        --access-token {{ GITHUB_TOKEN }} \
        --labels {{ LABELS_DEFAULT }} \
        {{ OWNER }}/{{ repo }}

# Show default labels
show-labels:
    @echo "Default labels configuration:"
    @cat {{ LABELS_DEFAULT }}

# ---------------------------------------------------------------------------- #
#                               RECIPES: HELPERS                               #
# ---------------------------------------------------------------------------- #

# Apply default labels to all repositories
[private]
[script]
apply-all-impl:
    repos=(
        "cryptfolio-scripts"
        "dot-claude"
        "evm-bn"
        "foundry-multibuild"
        "foundry-template"
        "hardhat-packager"
        "hardhat-template"
        "javascript-template"
        "multisol"
        "next-template"
        "PaulRBerg.github.io"
        "prb-contracts"
        "prb-longevity"
        "prb-math"
        "prb-proxy"
        "prb-pulse"
        "prb-test"
        "rust-template"
        "typescript-template"
    )

    for repo in "${repos[@]}"; do
        echo "Syncing labels for {{ OWNER }}/$repo..."
        github-label-sync \
            --access-token {{ GITHUB_TOKEN }} \
            --allow-added-labels \
            --labels {{ LABELS_DEFAULT }} \
            "{{ OWNER }}/$repo"
    done
