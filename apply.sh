#!/usr/bin/env zsh

# Personal
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yml paulrberg/create-eth-app
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yml paulrberg/evm-bn
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yml paulrberg/foundry-template
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yml paulrberg/hardhat-packager
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yml paulrberg/hardhat-template
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yml paulrberg/javascript-template
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yml paulrberg/multisol
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yml paulrberg/prb-contracts
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yml paulrberg/prb-math
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yml paulrberg/prb-proxy
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yml paulrberg/prb-test
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yml paulrberg/typescript-template

# Sablier
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yml sablierhq/docs
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yml sablierhq/safe-app
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yml sablierhq/subgraph
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yml sablierhq/v1-interfaces
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yml sablierhq/v2-core
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yml sablierhq/v2-interfaces
github-label-sync --access-token $GITHUB_TOKEN --labels ./labels.yml sablierhq/v2-periphery