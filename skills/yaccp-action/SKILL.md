# YACCP Action Skill

Central hub for the YACCP plugin ecosystem. This skill enables Claude to help users discover, install, manage, and launch YACCP plugins.

## Overview

YACCP Action is the entry point to the YACCP plugin ecosystem. It provides a unified interface for:

- **Discovering** available plugins from the YACCP marketplace
- **Installing** new plugins with a single command
- **Updating** installed plugins to their latest versions
- **Removing** plugins that are no longer needed
- **Launching** installed plugin commands

## Workflow

```
┌─────────────────┐
│  /yaccp-action  │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│   Main Menu     │
├─────────────────┤
│ • Browse        │
│ • Install       │
│ • Update        │
│ • Remove        │
│ • Launch        │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Execute Action │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Loop or Exit   │
└─────────────────┘
```

## Commands

| Command | Description |
|---------|-------------|
| `/yaccp-action:yaccp-action` | Open the main plugin manager menu |

## Marketplace Integration

The skill fetches plugin data from the YACCP marketplace:

```
https://raw.githubusercontent.com/yaccp/marketplace/main/.claude-plugin/marketplace.json
```

### Available Plugin Categories

- **deployment** - Cloud deployment plugins (AWS, GCP, Azure)
- **productivity** - Development workflow tools
- **documentation** - Documentation generators
- **testing** - Testing and validation tools
- **security** - Security scanning and auditing

## Plugin Management Commands

The skill uses Claude Code's built-in plugin management:

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

## Example Interactions

### Browse and Install

```
User: /yaccp-action:yaccp-action

Claude: What would you like to do?
● Browse plugins
○ Install a plugin
○ Update plugins
○ Remove a plugin
○ Launch a plugin

User: Browse plugins

Claude:
YACCP Plugins Marketplace
=========================

📦 Deployment
├── yaccp-aws-docusaurus (v1.1.19)
├── yaccp-aws-api-gateway (v1.1.0)
└── yaccp-aws-static-site (v1.0.0)

📋 Productivity
└── yaccp-roadmap-generator (v1.0.1)

What would you like to do?
● Install one
○ View details
○ Back to menu

User: Install one

Claude: Which plugin would you like to install?
● yaccp-aws-docusaurus
○ yaccp-aws-api-gateway
○ yaccp-aws-static-site
○ yaccp-roadmap-generator
```

### Launch a Plugin

```
User: /yaccp-action:yaccp-action

Claude: What would you like to do?
○ Browse plugins
○ Install a plugin
○ Update plugins
○ Remove a plugin
● Launch a plugin

User: Launch a plugin

Claude: Which plugin would you like to launch?
● yaccp-aws-docusaurus
○ yaccp-roadmap-generator

User: yaccp-aws-docusaurus

Claude: Which command would you like to run?
● yaccp-aws-docusaurus-init
○ yaccp-aws-docusaurus-infra
○ yaccp-aws-docusaurus-deploy
○ yaccp-aws-docusaurus-status
```

## Tips

1. **First time?** Start with "Browse plugins" to see what's available
2. **Quick install:** Choose "Install a plugin" and select from the list
3. **Stay updated:** Periodically check "Update plugins" for new versions
4. **Discover commands:** Use "Launch a plugin" to see available commands

## Related Plugins

Once installed, explore these popular YACCP plugins:

- **yaccp-aws-docusaurus** - Deploy documentation sites to AWS
- **yaccp-aws-api-gateway** - Deploy serverless APIs
- **yaccp-aws-static-site** - Deploy static websites
- **yaccp-roadmap-generator** - Create product roadmaps
