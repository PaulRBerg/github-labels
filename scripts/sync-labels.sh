#!/usr/bin/env bash
set -euo pipefail

# Sync GitHub labels from a YAML file to a repository using the gh CLI.
#
# Usage: sync-labels.sh [--prune] [--dry-run] <labels.yml> <owner/repo>
#
#   --prune    Delete labels on the repository that are not in the YAML file.
#   --dry-run  Print the actions that would be taken without executing them.

prune=false
dry_run=false
while [[ "${1:-}" == --* ]]; do
  case "$1" in
    --prune) prune=true ;;
    --dry-run) dry_run=true ;;
    *)
      echo "Unknown flag: $1" >&2
      exit 1
      ;;
  esac
  shift
done

if [[ $# -ne 2 ]]; then
  echo "Usage: $(basename "$0") [--prune] [--dry-run] <labels.yml> <owner/repo>" >&2
  exit 1
fi

labels_file=$1
repo=$2

run() {
  if $dry_run; then
    echo "    would run: $*"
  else
    "$@"
  fi
}

desired=$(yq -r '.[] | [.name, .color, .description] | @tsv' "$labels_file")
existing=$(
  gh label list --repo "$repo" --limit 1000 --json name,color,description \
    --jq '.[] | [.name, .color, .description // ""] | @tsv'
)

declare -A existing_color existing_desc desired_names
if [[ -n "$existing" ]]; then
  while IFS=$'\t' read -r name color desc; do
    existing_color[$name]=$color
    existing_desc[$name]=$desc
  done <<<"$existing"
fi

while IFS=$'\t' read -r name color desc; do
  desired_names[$name]=1
  if [[ -v "existing_color[$name]" ]]; then
    if [[ "${existing_color[$name]}" == "$color" && "${existing_desc[$name]}" == "$desc" ]]; then
      echo "  unchanged: $name"
    else
      echo "  updating:  $name"
      run gh label create "$name" --repo "$repo" --color "$color" --description "$desc" --force
    fi
  else
    echo "  creating:  $name"
    run gh label create "$name" --repo "$repo" --color "$color" --description "$desc"
  fi
done <<<"$desired"

if $prune && [[ -n "$existing" ]]; then
  for name in "${!existing_color[@]}"; do
    if [[ ! -v "desired_names[$name]" ]]; then
      echo "  deleting:  $name"
      run gh label delete "$name" --repo "$repo" --yes
    fi
  done
fi
