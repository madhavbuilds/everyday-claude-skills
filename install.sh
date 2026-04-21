#!/bin/bash
# Viral Claude Skills — Install Script
# Usage: bash install.sh [skill-name|all]
# Example: bash install.sh all
# Example: bash install.sh blood-report-interpreter

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$HOME/.claude/skills"
SKILLS_SOURCE="$REPO_DIR/skills"

AVAILABLE_SKILLS=(
  "blood-report-interpreter"
  "life-admin-autopilot"
  "contract-red-flag-detector"
  "database-schema-whisperer"
  "meeting-minutes-machine"
  "spaced-repetition-forge"
  "podcast-content-multiplier"
  "accessibility-auditor"
  "invoice-expense-intelligence"
  "research-paper-synthesizer"
)

print_header() {
  echo ""
  echo "🧠 Viral Claude Skills — Installer"
  echo "===================================="
  echo ""
}

print_skills() {
  echo "Available skills:"
  for skill in "${AVAILABLE_SKILLS[@]}"; do
    echo "  • $skill"
  done
  echo ""
}

install_skill() {
  local skill=$1
  local dest="$SKILLS_DIR/$skill"
  local src="$SKILLS_SOURCE/$skill"

  if [ ! -d "$src" ]; then
    echo "❌ Skill not found: $skill"
    echo "   Available skills:"
    print_skills
    exit 1
  fi

  mkdir -p "$SKILLS_DIR"

  if [ -d "$dest" ]; then
    echo "⟳  Updating: $skill"
    rm -rf "$dest"
  else
    echo "✓  Installing: $skill"
  fi

  cp -r "$src" "$dest"
  echo "   → $dest"
}

print_header

TARGET=${1:-"all"}

if [ "$TARGET" = "all" ]; then
  echo "Installing all 10 skills to $SKILLS_DIR"
  echo ""
  mkdir -p "$SKILLS_DIR"
  for skill in "${AVAILABLE_SKILLS[@]}"; do
    install_skill "$skill"
  done
  echo ""
  echo "✅ All 10 skills installed successfully!"
elif [ "$TARGET" = "list" ]; then
  print_skills
else
  install_skill "$TARGET"
  echo ""
  echo "✅ Installed: $TARGET"
fi

echo ""
echo "Skills directory: $SKILLS_DIR"
echo ""
echo "Claude will auto-discover these skills next time you start a session."
echo "Try: 'Explain my blood test results' or 'Help me write a complaint letter'"
echo ""
