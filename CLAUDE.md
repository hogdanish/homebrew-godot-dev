# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Homebrew tap for installing development and release candidate builds of the Godot Engine on macOS. The tap automatically tracks the latest unstable releases from the official [godot-builds repository](https://github.com/godotengine/godot-builds) via GitHub Actions.

## Repository Structure

- `Casks/` - Contains Homebrew cask formulas:
  - `godot-dev.rb` - Main cask that always points to the latest unstable release
  - `godot-dev@{version}.rb` - Versioned casks for the 5 most recent releases
- `update_casks.rb` - Ruby script that fetches releases and generates/updates cask files
- `.github/workflows/update-cask.yml` - GitHub Actions workflow that runs the updater every 6 hours
- `latest_release.txt` - Tracks the most recent release version to detect changes

## Key Architecture

### Update Script (update_casks.rb)

The script follows this workflow:

1. **Fetch releases** (`fetch_releases`): Queries GitHub API for godot-builds releases with retry logic
2. **Extract versions** (`extract_versions`): Filters for prereleases matching pattern `^\d+\.\d+-(dev|rc)\d*$`, sorts by publish date, takes 5 most recent
3. **Check for updates** (`read_latest_release`): Compares against `latest_release.txt` to avoid redundant updates
4. **Download and hash** (`compute_sha256`): Downloads each release asset to compute SHA256 checksum
5. **Generate casks** (`generate_cask_content`): Creates cask Ruby DSL with version-specific metadata
6. **Write files** (`write_cask_file`): Only writes if content has changed to minimize git churn

### Cask Generation Logic

- **Main cask** (`godot-dev`): Has livecheck enabled, conflicts with versioned casks
- **Versioned casks** (`godot-dev@{version}`): Skip livecheck, conflict with main cask
- Both install to `Godot Dev.app` and provide `godot-dev` CLI binary
- Conflict management prevents multiple installations since they share the same binary name

### GitHub Actions Workflow

Runs on schedule (every 6 hours) or manual trigger:

1. Authenticates using GitHub App token (for signed commits and auto-merge permissions)
2. Runs `update_casks.rb` to regenerate cask files
3. Creates PR with changes using `peter-evans/create-pull-request`
4. Auto-merges the PR if changes exist

## Development Commands

### Testing the Update Script Locally

```bash
# Set GitHub token for API access
export GITHUB_TOKEN=your_token_here

# Run the update script
ruby update_casks.rb
```

### Installing the Tap Locally

```bash
# Tap the local repository
brew tap fractalcounty/homebrew-godot-dev

# Install latest dev build
brew install --cask godot-dev

# Or install specific version
brew install --cask godot-dev@4.5-dev5
```

### Testing Cask Syntax

```bash
# Audit a specific cask
brew audit --cask Casks/godot-dev.rb

# Install in debug mode
brew install --cask --debug godot-dev
```

### Manual Workflow Trigger

```bash
# Trigger the GitHub Actions workflow manually
gh workflow run update-cask.yml
```

## Important Patterns

### Version Pattern Matching

Only releases matching this regex are processed: `^\d+\.\d+-(dev|rc)\d*$`

Examples that match:
- `4.5-dev5`
- `4.4-rc1`
- `4.3-rc3`

### Cask Conflicts

The conflict system ensures only one `godot-dev` variant can be installed at a time since they all provide the same `godot-dev` CLI binary. This is intentional to prevent PATH conflicts.

### SHA256 Computation

The script downloads each release asset to compute checksums rather than relying on GitHub-provided checksums. This is required by Homebrew's cask verification system.

## Workflow Maintenance

The GitHub Actions workflow requires these secrets:
- `APP_ID` - GitHub App ID for authentication
- `APP_PRIVATE_KEY` - GitHub App private key
- `GITHUB_TOKEN` - Automatically provided by GitHub Actions

The workflow uses a GitHub App token instead of `GITHUB_TOKEN` for creating and merging PRs because it allows:
- Triggering other workflows from the PR merge
- Signed commits
- Auto-merge permissions
