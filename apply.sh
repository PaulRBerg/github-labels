#!/usr/bin/env zsh

# Personal
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yaml paulrberg/create-eth-app
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yaml paulrberg/evm-bn
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yaml paulrberg/hardhat-packager
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yaml paulrberg/javascript-template
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yaml paulrberg/multisol
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yaml paulrberg/prb-contracts
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yaml paulrberg/prb-math
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yaml paulrberg/prb-proxy
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yaml paulrberg/solidity-template
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yaml paulrberg/typescript-template

# Sablier
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yaml sablierhq/docs
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yaml sablierhq/frontend
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yaml sablierhq/safe-app
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yaml sablierhq/subgraph
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yaml sablierhq/v2-core