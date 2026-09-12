#!/usr/bin/env bash
# WeriiHQ Cloud Agent install script.
#
# This repository is currently a documentation/planning monorepo: the web, api,
# and core sub-projects are specified in their READMEs but not yet implemented.
# This script is idempotent and forward-looking: it installs Node dependencies
# for any sub-project that already has a package.json, and no-ops cleanly for the
# folders that are still spec-only. It stays valid as those sub-projects are
# scaffolded, without requiring an environment change.
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

echo "WeriiHQ install: node $(node --version), npm $(npm --version)"

# Node workspaces that are expected to exist per REPO_STRUCTURE.md. The root is
# included so a future top-level package.json (monorepo workspaces) is handled.
candidates=("." "web" "api" "core")
installed_any=0

for dir in "${candidates[@]}"; do
  pkg="$dir/package.json"
  if [[ -f "$pkg" ]]; then
    echo "==> Installing dependencies in '$dir'"
    if [[ -f "$dir/package-lock.json" ]]; then
      ( cd "$dir" && npm ci )
    else
      ( cd "$dir" && npm install )
    fi
    installed_any=1
  fi
done

if [[ "$installed_any" -eq 0 ]]; then
  echo "No package.json found yet in root/web/api/core."
  echo "This is expected while the repo is documentation/spec-only; nothing to install."
fi

echo "WeriiHQ install: done."
