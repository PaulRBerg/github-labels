#!/usr/bin/env zsh

# Personal
github-label-sync --access-token $GITHUB_TOKEN --allow-added-labels --labels ./labels.yml PaulRBerg/create-eth-app
github-label-sync --access-token $GITHUB_TOKEN --allow-added-labels --labels ./labels.yml PaulRBerg/evm-bn
github-label-sync --access-token $GITHUB_TOKEN --allow-added-labels --labels ./labels.yml PaulRBerg/foundry-template
github-label-sync --access-token $GITHUB_TOKEN --allow-added-labels --labels ./labels.yml PaulRBerg/hardhat-packager
github-label-sync --access-token $GITHUB_TOKEN --allow-added-labels --labels ./labels.yml PaulRBerg/hardhat-template
github-label-sync --access-token $GITHUB_TOKEN --allow-added-labels --labels ./labels.yml PaulRBerg/javascript-template
github-label-sync --access-token $GITHUB_TOKEN --allow-added-labels --labels ./labels.yml PaulRBerg/multisol
github-label-sync --access-token $GITHUB_TOKEN --allow-added-labels --labels ./labels.yml PaulRBerg/prb-contracts
github-label-sync --access-token $GITHUB_TOKEN --allow-added-labels --labels ./labels.yml PaulRBerg/prb-math
github-label-sync --access-token $GITHUB_TOKEN --allow-added-labels --labels ./labels.yml PaulRBerg/prb-proxy
github-label-sync --access-token $GITHUB_TOKEN --allow-added-labels --labels ./labels.yml PaulRBerg/prb-test
github-label-sync --access-token $GITHUB_TOKEN --allow-added-labels --labels ./labels.yml PaulRBerg/typescript-template

# Sablier
github-label-sync --access-token $GITHUB_TOKEN --allow-added-labels --labels ./labels.yml sablier-labs/docs
github-label-sync --access-token $GITHUB_TOKEN --allow-added-labels --labels ./labels.yml sablier-labs/safe-app
github-label-sync --access-token $GITHUB_TOKEN --allow-added-labels --labels ./labels.yml sablier-labs/subgraph
github-label-sync --access-token $GITHUB_TOKEN --allow-added-labels --labels ./labels.yml sablier-labs/v1-interfaces
github-label-sync --access-token $GITHUB_TOKEN --allow-added-labels --labels ./labels.yml sablier-labs/v2-core
github-label-sync --access-token $GITHUB_TOKEN --allow-added-labels --labels ./labels.yml sablier-labs/v2-interfaces
github-label-sync --access-token $GITHUB_TOKEN --allow-added-labels --labels ./labels.yml sablier-labs/v2-periphery