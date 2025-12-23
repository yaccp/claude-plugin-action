---
description: Central hub for discovering, installing and launching YACCP plugins
---

# YACCP Action - Plugin Manager

Central hub for discovering, installing, updating, removing and launching YACCP plugins.

## Marketplace URL

The YACCP marketplace is located at: `https://raw.githubusercontent.com/yaccp/marketplace/main/.claude-plugin/marketplace.json`

## Interactive Flow

### Step 1: Fetch Available Plugins

Fetch the marketplace to get the list of available plugins:

```bash
curl -s https://raw.githubusercontent.com/yaccp/marketplace/main/.claude-plugin/marketplace.json
```

Parse the JSON to extract the plugins array.

### Step 2: Check Installed Plugins

Read installed plugins from local cache (fast, no CLI call):

```bash
cat ~/.claude/plugins/installed_plugins.json 2>/dev/null
```

Parse the JSON to extract YACCP plugins (keys ending with `@yaccp`):
- Extract plugin name and version from the `plugins` object
- Filter for keys matching `*@yaccp` pattern
- Get version from each plugin's `version` field

Example parsing with jq:
```bash
cat ~/.claude/plugins/installed_plugins.json | jq -r '.plugins | to_entries[] | select(.key | endswith("@yaccp")) | "\(.key):\(.value[0].version)"'
```

### Step 3: Display Menu

Use AskUserQuestion to show the main menu:

**Question:** "What would you like to do?"

**Options:**
- "Browse plugins" - Discover available YACCP plugins by category
- "Install a plugin" - Install a new plugin from the marketplace
- "Update plugins" - Check for and apply plugin updates
- "Remove a plugin" - Uninstall an installed plugin
- "Launch a plugin" - Run an installed plugin's command

### Step 4: Handle Action

#### Browse Plugins

Display plugins grouped by category with descriptions:

```
YACCP Plugins Marketplace
=========================

📦 Deployment
├── yaccp-aws-docusaurus (v1.1.19)
│   Deploy Docusaurus sites to AWS with S3, CloudFront
├── yaccp-aws-api-gateway (v1.1.0)
│   Deploy serverless REST/HTTP APIs with AWS Lambda
└── yaccp-aws-static-site (v1.0.0)
    Deploy static sites to AWS S3 + CloudFront

📋 Productivity
└── yaccp-roadmap-generator (v1.0.1)
    Create product roadmaps with Mermaid Gantt charts

Total: X plugins available
```

Then ask: "What would you like to do with these plugins?"
- "Install one" - Proceed to install flow
- "View details" - Show full description of a plugin
- "Back to menu" - Return to main menu

#### Install a Plugin

Use AskUserQuestion to select which plugin to install:

**Question:** "Which plugin would you like to install?"

Show available (not yet installed) plugins as options.

Then run:
```bash
claude plugin add yaccp/<plugin-repo-name>
```

Show success message:
```
Plugin Installed!
=================

✓ yaccp-<plugin-name> v1.0.0 installed

Available commands:
- /<plugin>:<plugin>-command1
- /<plugin>:<plugin>-command2

To launch: /yaccp-action:yaccp-action → "Launch a plugin"
```

#### Update Plugins

Check installed YACCP plugins against marketplace versions:

```
Plugin Updates
==============

Checking for updates...

Plugin                    Installed    Available    Status
──────────────────────────────────────────────────────────
yaccp-aws-docusaurus      v1.1.18      v1.1.19      ⬆ Update available
yaccp-roadmap-generator   v1.0.1       v1.0.1       ✓ Up to date
```

If updates available, ask:
**Question:** "Which plugins would you like to update?"
- Show plugins with updates as multiSelect options
- "Update all" option

Run for each selected:
```bash
claude plugin update yaccp/<plugin-name>
```

#### Remove a Plugin

Use AskUserQuestion to select which plugin to remove:

**Question:** "Which plugin would you like to remove?"

Show installed YACCP plugins as options.

Confirm with:
**Question:** "Are you sure you want to remove <plugin-name>?"
- "Yes, remove it"
- "No, cancel"

Then run:
```bash
claude plugin remove yaccp/<plugin-name>
```

#### Launch a Plugin

List installed YACCP plugins and their commands:

```
Installed YACCP Plugins
=======================

1. yaccp-aws-docusaurus
   ├── /yaccp-aws-docusaurus:yaccp-aws-docusaurus-init
   ├── /yaccp-aws-docusaurus:yaccp-aws-docusaurus-infra
   ├── /yaccp-aws-docusaurus:yaccp-aws-docusaurus-deploy
   └── /yaccp-aws-docusaurus:yaccp-aws-docusaurus-status

2. yaccp-roadmap-generator
   ├── /yaccp-roadmap-generator:yaccp-roadmap-generator-init
   ├── /yaccp-roadmap-generator:yaccp-roadmap-generator-add
   └── /yaccp-roadmap-generator:yaccp-roadmap-generator-view
```

Use AskUserQuestion:
**Question:** "Which plugin would you like to launch?"

Show installed plugins as options.

Then ask:
**Question:** "Which command would you like to run?"

Show that plugin's commands as options.

Finally, tell the user:
```
To run the command, type:

  /<plugin>:<plugin>-<command>

Or I can run it for you now.
```

Ask:
- "Run it now" - Execute the command
- "I'll run it myself" - Just display the command

### Step 5: Loop or Exit

After completing an action, ask:
**Question:** "What would you like to do next?"
- "Back to main menu" - Show main menu again
- "Exit" - End the session

## Error Handling

### Network Error
```
⚠️ Could not fetch marketplace

Check your internet connection and try again.
Marketplace URL: https://github.com/yaccp/marketplace
```

### No Plugins Installed
```
No YACCP plugins installed yet.

Would you like to browse available plugins?
```

### Plugin Not Found
```
⚠️ Plugin not found in marketplace

The plugin "xyz" is not available in the YACCP marketplace.
Run /yaccp-action:yaccp-action to browse available plugins.
```

## Quick Actions

For power users, support direct actions:

- `/yaccp-action:yaccp-action install` - Jump to install flow
- `/yaccp-action:yaccp-action update` - Jump to update flow
- `/yaccp-action:yaccp-action list` - List installed plugins
- `/yaccp-action:yaccp-action browse` - Browse marketplace
