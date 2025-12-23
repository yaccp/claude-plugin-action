# Changelog

All notable changes to this project will be documented in this file.

## [1.0.2] - 2025-12-23

### Changed
- Document that `claude plugin add/update/remove` commands must be run manually by user
- Claude cannot execute plugin management CLI commands in batch mode
- Updated command and skill documentation to provide copy-paste commands for users

## [1.0.1] - 2025-12-23

### Changed
- Use local cache file instead of `claude plugins list` for faster plugin detection
- Read from `~/.claude/plugins/installed_plugins.json` directly

## [1.0.0] - 2025-12-23

### Added
- Initial release of YACCP Action plugin
- `yaccp-action` command for plugin management
- Browse plugins by category from marketplace
- Install plugins with one command
- Check and apply plugin updates
- Remove installed plugins
- Launch installed plugin commands
- Architecture and workflow diagrams
- Comprehensive skill documentation
