# Architecture

## Overview

YACCP Action serves as a central hub connecting users to the YACCP plugin ecosystem.

## Components

### Plugin Hub
The main entry point that displays the menu and handles user interactions.

### Marketplace Integration
Fetches plugin data from the YACCP marketplace repository.

### Local Plugin Management
Interfaces with Claude Code's plugin system for install/update/remove operations.

## Data Flow

```
User → /yaccp-action → Menu → Action → Claude Plugin CLI → Result
                         ↑
                         ├── Marketplace (remote)
                         └── Installed Plugins (local)
```

## Marketplace Schema

```json
{
  "plugins": [
    {
      "name": "plugin-name",
      "version": "1.0.0",
      "description": "...",
      "category": "deployment|productivity|...",
      "source": {
        "source": "github",
        "repo": "yaccp/plugin-repo"
      }
    }
  ]
}
```
