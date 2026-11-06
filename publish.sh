#!/bin/bash
# One-time publish to GitHub Pages. Requires: gh auth login
set -e
cd "$(dirname "$0")"
[ -d .git ] || git init -q -b main
git add -A && git commit -qm "Affinity map" || true
OWNER=$(gh api user -q .login)
gh repo create affinity-map --public --source . --push 2>/dev/null || git push -u origin main
gh api -X POST "repos/$OWNER/affinity-map/pages" -f "source[branch]=main" -f "source[path]=/" 2>/dev/null || true
echo "Live (takes ~1 min): https://$OWNER.github.io/affinity-map/"
