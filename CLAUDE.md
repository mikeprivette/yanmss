# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

YANMSS (Yet Another New Mac Setup Script) is a macOS automation script that configures a new Mac with development tools and essential applications. The script is designed to be run directly via curl on a fresh macOS installation.

## Testing and Validation

```bash
# Check script syntax without executing
bash -n setup.sh

# Test specific functions by sourcing and calling them
source setup.sh
detect_architecture  # Tests processor detection logic

# Verify script permissions
ls -la setup.sh  # Should be executable (755)
```

## Script Architecture

The `setup.sh` script follows a specific execution order due to dependencies:

1. **Prerequisite Functions** must be defined before use:
   - `retry()` function must be defined before `install_homebrew()` 
   - `backup_file()` must be defined before `install_terminal_tools()`

2. **Installation Order**:
   - Homebrew installation comes first (required for all other installations)
   - `coreutils` and `bc` are installed early (provides `gdate` and `bc` for .zshrc customizations)
   - XCode Command Line Tools (may be needed for some brew installations)
   - Terminal tools rely on brew being available

3. **Critical Dependencies**:
   - `gdate` command requires `coreutils` package
   - `bc` command required for floating-point calculations in terminal timing
   - Oh My Zsh installation modifies `.zshrc`, so backup happens first

## Common Issues and Fixes

When modifying the script, watch for:
- Function definition order (functions must be defined before being called)
- Timestamp consistency in backup operations (use variables to ensure same timestamp in filename and log)
- Missing commands on fresh macOS (`gdate`, `bc` need explicit installation)

## Direct Execution

The script is designed to be executed directly from GitHub:
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/mikeprivette/yanmss/master/setup.sh)"
```

This means any changes pushed to master are immediately live for users.