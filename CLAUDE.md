# YACCP Action - Claude Context

## Plugin Overview

Central hub for the YACCP plugin ecosystem. Discover, install, update, remove, and launch YACCP plugins.

## Commands

| Command | Purpose |
|---------|---------|
| `/yaccp-action:yaccp-action` | Open the plugin manager hub |

## Key Files

```
.claude-plugin/
├── plugin.json
└── marketplace.json

commands/
└── yaccp-action.md

skills/yaccp-action/
└── SKILL.md
```

## Marketplace URL

```
https://raw.githubusercontent.com/yaccp/marketplace/main/.claude-plugin/marketplace.json
```

## Plugin Management Commands

```bash
# List installed plugins
claude plugins list

# Install a plugin
claude plugin add yaccp/<plugin-name>

# Update a plugin
claude plugin update yaccp/<plugin-name>

# Remove a plugin
claude plugin remove yaccp/<plugin-name>
```

## Available Actions

1. **Browse** - Fetch and display plugins from marketplace by category
2. **Install** - Install a plugin from the marketplace
3. **Update** - Check for and apply plugin updates
4. **Remove** - Uninstall an installed plugin
5. **Launch** - Run an installed plugin's command
