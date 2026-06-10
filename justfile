set shell := ["bash", "-euo", "pipefail", "-c"]
set unstable

# ---------------------------------------------------------------------------- #
#                                 DEPENDENCIES                                 #
# ---------------------------------------------------------------------------- #

# https://cli.github.com
gh := require("gh")

# https://github.com/mikefarah/yq
yq := require("yq")

# ---------------------------------------------------------------------------- #
#                                   CONSTANTS                                  #
# ---------------------------------------------------------------------------- #

OWNER := "PaulRBerg"
LABELS_DEFAULT := "./labels/default.yml"
SYNC_LABELS := "./scripts/sync-labels.sh"

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
    {{ SYNC_LABELS }} {{ LABELS_DEFAULT }} {{ OWNER }}/{{ repo }}

# Apply default labels to a specific repository, deleting labels not in labels.yml
[confirm("WARNING: This will delete any labels not listed in labels.yml! Continue? y/N")]
apply-repo-overwrite repo:
    {{ SYNC_LABELS }} --prune {{ LABELS_DEFAULT }} {{ OWNER }}/{{ repo }}

# Preview what a sync would change in a specific repository
dry-run repo:
    {{ SYNC_LABELS }} --dry-run {{ LABELS_DEFAULT }} {{ OWNER }}/{{ repo }}

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
        "prb-taxes"
        "rust-template"
        "typescript-template"
    )

    for repo in "${repos[@]}"; do
        echo "Syncing labels for {{ OWNER }}/$repo..."
        {{ SYNC_LABELS }} {{ LABELS_DEFAULT }} "{{ OWNER }}/$repo"
    done
