<div align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://github.com/user-attachments/assets/1f4f99e6-4a5b-4a36-b6d1-1e68a2aec7ba">
    <img alt="Dark and light mode variations of the homebrew-godot-dev logo" src="https://github.com/user-attachments/assets/a11140e8-b982-4535-ae01-4a801cba373b" width="500">
  </picture>
</div>

# Latest Godot build releases for Homebrew

[![Update Godot Casks](https://github.com/fractalcounty/homebrew-godot-dev/actions/workflows/update-cask.yml/badge.svg)](https://github.com/fractalcounty/homebrew-godot-dev/actions/workflows/update-cask.yml)
[![Latest Godot Dev Version](https://img.shields.io/github/v/tag/godotengine/godot-builds?label=version&include_prereleases&sort=semver)](https://github.com/godotengine/godot-builds/releases)
[![License](https://img.shields.io/github/license/fractalcounty/homebrew-godot-dev)](LICENSE)

This is a Homebrew tap I made so that I could install development builds of the [Godot Engine](https://godotengine.org/) on macOS using the Homebrew package manager. The main cask is automatically updated using a GitHub Actions workflow to always point to the most recent unstable macOS release from the official [godot-builds repo](https://github.com/godotengine/godot-builds/releases), as opposed to the [official Homebrew cask](https://formulae.brew.sh/cask/godot) which only covers major releases. It also contains casks for the five most recent prereleases (dev snapshots, betas, and/or release candidates) which can be optionally specified.

## Installation

> [!WARNING]
> This is an unofficial project created for my own convenience and may not be frequently maintained. 
> It isn't officially associated with the Godot Engine project in any way.
> Use at your own risk!

1. Add this tap to your Homebrew installation:

    ```zsh
    brew tap hogdanish/homebrew-godot-dev
    ```

2. Install the latest unstable release from the [godot-builds repo](https://github.com/godotengine/godot-builds/releases):

    ```zsh
    brew install --cask godot-dev
    ```

    To optionally specify a specific dev preview/release candidate (only 5 most recent are included):

    ```zsh
    brew install --cask godot-dev@4.3-rc1
    ```

    Note that while `godot-dev` doesn't conflict with the official stable `godot` cask, you can't install multiple `godot-dev` casks from this tap at once as it would conflict with the CLI tool.

3. Open `Godot Dev.app` or invoke it via the CLI:

    ```zsh
    godot-dev --version
    ```

## Updating

To update to the latest  release, run:

```zsh
brew update
brew upgrade --cask godot-dev
```

Note that this will require updating your projects to the new latest version. To avoid this, install a specific version.

## Contributing

Contributions are welcome! Please open an [issue](https://github.com/hogdanish/homebrew-godot-dev/issues) or submit a [pull request](https://github.com/hogdanish/homebrew-godot-dev/pulls) if you have any suggestions or improvements.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
