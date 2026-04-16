#!/bin/bash
# =====================================================
# ADRD Louisiana — One-Command Setup Script
# Run this from the adrd-louisiana directory
# Requires: git, gh (GitHub CLI), vercel CLI
# =====================================================

set -e

REPO_NAME="adrd-louisiana"
TEAM_SLUG="v8-technologies-projects"

echo ""
echo "╔══════════════════════════════════════════╗"
echo "║     ADRD Louisiana — Deploy Script       ║"
echo "╚══════════════════════════════════════════╝"
echo ""

# ── Check dependencies ──
echo "▸ Checking dependencies..."

if ! command -v git &> /dev/null; then
  echo "  ✗ git not found. Install from https://git-scm.com"
  exit 1
fi

if ! command -v gh &> /dev/null; then
  echo ""
  echo "  GitHub CLI (gh) not found."
  echo "  Install: https://cli.github.com"
  echo "  Then run: gh auth login"
  echo ""
  echo "  Alternatively, create the repo manually at:"
  echo "  https://github.com/new  (name: adrd-louisiana)"
  echo "  Then re-run this script."
  echo ""
  USE_GH=false
else
  USE_GH=true
fi

if ! command -v vercel &> /dev/null; then
  echo "  Installing Vercel CLI..."
  npm install -g vercel
fi

# ── Initialize git ──
echo "▸ Initializing git repository..."
git init
git add -A
git commit -m "Initial commit: ADRD Louisiana full website

- index.html: Homepage with Louisiana stats, three-pillar cards
- prevention.html: Risk factors, APOE genetics, MIND diet, action plan
- diagnosis.html: Warning signs, 4 dementia types, diagnostic process, FAQ
- treatment.html: Symptomatic meds table, Leqembi/Kisunla, clinical trials
- resources.html: National + Louisiana-specific resources, caregiver support
- about.html: Mission, team, Louisiana context
- contact.html: Contact form with validation, helpline info
- css/main.css + js/main.js: Shared styles and interactivity

Data sourced from:
- Alzheimer's Association 2025 Facts & Figures
- Alzheimer's Association Louisiana Chapter
- Well-Ahead Louisiana / 2023-2028 Louisiana ADRD State Plan"

# ── Create GitHub repo ──
if [ "$USE_GH" = true ]; then
  echo "▸ Creating GitHub repository..."
  gh repo create "brenlamar88/$REPO_NAME" \
    --public \
    --description "Alzheimer's & Related Dementia Association of Louisiana — public website" \
    --source . \
    --remote origin \
    --push
  echo "  ✓ GitHub repo: https://github.com/brenlamar88/$REPO_NAME"
else
  echo "▸ Skipping GitHub — push manually:"
  echo "  git remote add origin https://github.com/brenlamar88/$REPO_NAME.git"
  echo "  git push -u origin main"
fi

# ── Deploy to Vercel ──
echo ""
echo "▸ Deploying to Vercel..."
echo "  (You may be prompted to log in or confirm project settings)"
echo ""

vercel deploy \
  --prod \
  --yes \
  --name "$REPO_NAME" \
  --scope "$TEAM_SLUG"

echo ""
echo "╔══════════════════════════════════════════╗"
echo "║           ✓ Deployment Complete!         ║"
echo "╚══════════════════════════════════════════╝"
echo ""
echo "  GitHub:  https://github.com/brenlamar88/$REPO_NAME"
echo "  Vercel:  https://$REPO_NAME.vercel.app"
echo "  (custom domain can be added in Vercel dashboard)"
echo ""
