<div align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://github.com/user-attachments/assets/1f4f99e6-4a5b-4a36-b6d1-1e68a2aec7ba">
    <img alt="Dark and light mode variations of the homebrew-godot-dev logo" src="https://github.com/user-attachments/assets/a11140e8-b982-4535-ae01-4a801cba373b" width="500">
  </picture>
</div>

# Latest Godot build releases for Homebrew

[![Update Godot Casks](https://github.com/hogdanish/homebrew-godot-dev/actions/workflows/update-cask.yml/badge.svg)](https://github.com/hogdanish/homebrew-godot-dev/actions/workflows/update-cask.yml)
[![Latest Godot Dev Version](https://img.shields.io/github/v/tag/godotengine/godot-builds?label=latest%20version&include_prereleases&sort=semver)](https://github.com/godotengine/godot-builds/releases)
[![License](https://img.shields.io/github/license/hogdanish/homebrew-godot-dev)](LICENSE)

This is a Homebrew tap I made so that I could install development builds of the [Godot Engine](https://godotengine.org/) on macOS using the Homebrew package manager. The main cask is automatically updated using a GitHub Actions workflow to always point to the most recent unstable macOS release from the official [godot-builds repo](https://github.com/godotengine/godot-builds/releases), as opposed to the [official Homebrew cask](https://formulae.brew.sh/cask/godot) which only covers major releases. 

## Installation

> [!WARNING]
> This is an unofficial project created for my own convenience and may not be maintained or updated regularly.
> Use at your own risk!

1. Add this tap to your Homebrew installation:

    ```bash
    brew tap hogdanish/godot-dev
    ```

2. Trust the casks from this tap (Homebrew 6.x+):

    ```bash
    brew trust hogdanish/godot-dev
    ```

3. Install a release from the [godot-builds repo](https://github.com/godotengine/godot-builds/releases):

    For the latest release:

    ```bash
    brew install --cask godot-dev
    ```

    For a specific release:

    ```bash
    brew install --cask godot-dev@4.7-rc2
    ```

    Note that you can only install one `godot-dev` version at a time.

4. Open `Godot Dev.app` or invoke it via the CLI:

    ```bash
    godot-dev --version
    ```

## Updating

To update to the latest development release, run:

```bash
brew update && brew upgrade --cask godot-dev
```

To switch to a specific version:

```bash
brew uninstall --cask godot-dev && brew install --cask godot-dev@[version]
```

## Contributing

Contributions are welcome! Please [open an issue](https://github.com/hogdanish/homebrew-godot-dev/issues) or [submit a pull request](https://github.com/hogdanish/homebrew-godot-dev/pulls).

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
