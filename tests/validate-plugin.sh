#!/bin/bash
set -e

PLUGIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PLUGIN_NAME="yaccp-action"
ERRORS=0

echo "Validating: $PLUGIN_NAME"
echo "========================="

check_file() {
    if [ -f "$PLUGIN_DIR/$1" ]; then
        echo "✓ $1"
    else
        echo "✗ $1 (MISSING)"
        ((ERRORS++))
    fi
}

check_file ".claude-plugin/plugin.json"
check_file ".claude-plugin/marketplace.json"
check_file "README.md"
check_file "CLAUDE.md"
check_file "CHANGELOG.md"
check_file "LICENSE"

echo ""
echo "Commands:"
check_file "commands/yaccp-action.md"

echo ""
echo "Skills:"
check_file "skills/yaccp-action/SKILL.md"

echo ""
echo "Assets:"
check_file "assets/diagrams/architecture.svg"
check_file "assets/diagrams/workflow.svg"

echo ""
if [ $ERRORS -gt 0 ]; then
    echo "Status: FAILED ($ERRORS errors)"
    exit 1
else
    echo "Status: PASSED"
fi
