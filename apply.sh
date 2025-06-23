#!/bin/sh

# Strict mode: https://gist.github.com/vncsna/64825d5609c146e80de8b1fd623011ca
set -euo pipefail

# Function to reuse code
sync_labels() {
  github-label-sync --access-token $GITHUB_TOKEN --allow-added-labels --labels ./labels.yml "$1"
}

# Personal repositories
REPOS=(
  "PaulRBerg/cryptfolio-scripts"
  "PaulRBerg/evm-bn"
  "PaulRBerg/foundry-multibuild"
  "PaulRBerg/foundry-template"
  "PaulRBerg/hardhat-packager"
  "PaulRBerg/hardhat-template"
  "PaulRBerg/javascript-template"
  "PaulRBerg/multisol"
  "PaulRBerg/PaulRBerg.github.io"
  "PaulRBerg/prb-contracts"
  "PaulRBerg/prb-longevity"
  "PaulRBerg/prb-math"
  "PaulRBerg/prb-proxy"
  "PaulRBerg/prb-test"
  "PaulRBerg/rust-template"
  "PaulRBerg/typescript-template"
)

# Loop through and sync each repository
for repo in "${REPOS[@]}"; do
  sync_labels "$repo"
done
