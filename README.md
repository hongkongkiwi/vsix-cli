# VSIX Command Line Tools

[![GitHub](https://img.shields.io/badge/GitHub-hongkongkiwi%2Fvsix--cli-blue?logo=github)](https://github.com/hongkongkiwi/vsix-cli)
[![Version](https://img.shields.io/badge/version-4.0.1-green)](#)
[![License](https://img.shields.io/badge/license-MIT-blue)](#license)

A powerful command-line tool for downloading and installing VS Code extensions (.vsix files) from multiple marketplaces. Supports batch operations, multiple editors, and various extension sources.

## 🚀 Features

- **Multi-Marketplace Support**: Download from VS Code Marketplace, Open VSX Registry, Coder Marketplace, and Eclipse Marketplace
- **Multi-Editor Support**: Install to Cursor, Windsurf, Trae, VSCodium, VS Code, or all at once
- **Flexible Input**: Accept extension IDs, marketplace URLs, or batch operations via stdin
- **Version Control**: Download specific versions or latest releases
- **Search & Info**: Search for extensions and get detailed information
- **Configuration Management**: Persistent settings with `config` command
- **Auto-Update**: Built-in script update functionality
- **Cross-Platform**: Works on Linux, macOS, Windows (including WSL)
- **Multiple Installation Methods**: Direct download, Git, Docker, or Homebrew
- **Progress Indicators**: Visual feedback for downloads
- **Dry Run Mode**: Preview operations without executing them

## 📋 Table of Contents

- [Installation](#installation)
- [Quick Start](#quick-start)
- [Commands](#commands)
- [Examples](#examples)
- [Supported Marketplaces](#supported-marketplaces)
- [Supported Editors](#supported-editors)
- [Configuration](#configuration)
- [URL Formats](#url-formats)
- [Advanced Usage](#advanced-usage)
- [Contributing](#contributing)
- [License](#license)

## 🛠️ Installation

### Direct Download

```bash
# Download the script
curl -O https://raw.githubusercontent.com/hongkongkiwi/vsix-cli/main/vsix-cli

# Make it executable
chmod +x vsix-cli

# Move to a directory in your PATH (optional)
sudo mv vsix-cli /usr/local/bin/
```

### Using Git

```bash
git clone https://github.com/hongkongkiwi/vsix-cli.git
cd vsix-cli
chmod +x vsix-cli

# Optionally add to PATH
sudo ln -s "$(pwd)/vsix-cli" /usr/local/bin/vsix-cli
```

### Docker

```bash
# Pull the image
docker pull hongkongkiwi/vsix-cli:latest

# Or from GitHub Container Registry
docker pull ghcr.io/hongkongkiwi/vsix-cli:latest

# Run directly
docker run --rm hongkongkiwi/vsix-cli:latest --help

# Download extensions to current directory
docker run --rm -v $(pwd):/output hongkongkiwi/vsix-cli:latest download ms-python.python

# Search for extensions
docker run --rm hongkongkiwi/vsix-cli:latest search python
```

### Homebrew

```bash
# Add the tap and install
brew tap hongkongkiwi/vsix-cli
brew install vsix-cli

# Or install directly without adding the tap
brew install hongkongkiwi/vsix-cli/vsix-cli
```

**Using the tap repository:**
The Homebrew formula is maintained in the [hongkongkiwi/homebrew-vsix-cli](https://github.com/hongkongkiwi/homebrew-vsix-cli) repository and is automatically updated with each release.

**Update to latest version:**
```bash
brew update
brew upgrade vsix-cli
```

**Uninstall:**
```bash
brew uninstall vsix-cli
brew untap hongkongkiwi/vsix-cli  # Optional: remove the tap
```

### Dependencies

The script requires one of the following for downloads:
- `curl` (recommended)
- `wget`

Optional dependencies for enhanced functionality:
- `jq` - For JSON parsing and better extension info display
- `git` - For auto-update functionality

**Note:** When installing via Homebrew, all required dependencies (`bash`, `curl`, `jq`) are automatically installed.

**Homebrew Formula Updates:** The formula is automatically updated when new releases are published, ensuring you always have access to the latest version through Homebrew.

## ⚡ Quick Start

```bash
# Search for extensions
vsix-cli search python

# Download an extension
vsix-cli download ms-python.python

# Install to Cursor editor
vsix-cli install --editors cursor ms-python.python

# Install from marketplace URL
vsix-cli install "https://marketplace.visualstudio.com/items?itemName=ms-python.python"

# Install from Open VSX Registry
vsix-cli install --marketplace openvsx ms-python.python
```

## 📖 Commands

### `search <term>`
Search for extensions matching the given term.

```bash
vsix-cli search "python formatter"
vsix-cli search --limit 5 jupyter
```

### `info <extension-id-or-url>`
Show detailed information about an extension.

```bash
vsix-cli info ms-python.python
vsix-cli info --version 2021.5.842923320 ms-python.python
```

### `download <ext-id-or-url>...`
Download extension(s) to local files.

```bash
vsix-cli download ms-python.python
vsix-cli download --output ~/extensions/ ms-python.python github.copilot
vsix-cli download --marketplace openvsx ms-python.python
```

### `install <ext-id-or-url>...`
Download and install extension(s) to editor(s).

```bash
vsix-cli install ms-python.python
vsix-cli install --editors cursor,vscode ms-python.python
vsix-cli install --editors all github.copilot
```

### `config [get|set|reset]`
Manage configuration settings.

```bash
vsix-cli config get
vsix-cli config set default_marketplace openvsx
vsix-cli config set default_editors "cursor,vscode"
```

### `update`
Update the script to the latest version.

```bash
vsix-cli update
vsix-cli update --check  # Check for updates only
```

### `help [command]`
Show help information.

```bash
vsix-cli help
vsix-cli help download
```

## 🎯 Examples

### Basic Operations

```bash
# Download Python extension
vsix-cli download ms-python.python

# Install GitHub Copilot to Cursor
vsix-cli install --editors cursor github.copilot

# Search for React extensions
vsix-cli search react
```

### Version-Specific Downloads

```bash
# Download specific version
vsix-cli download --version 2021.5.842923320 ms-python.python

# Version in extension ID format
vsix-cli download ms-python.python@2021.5.842923320
```

### Multi-Marketplace Usage

```bash
# From Open VSX Registry
vsix-cli download --marketplace openvsx ms-python.python

# From Coder Marketplace
vsix-cli download --marketplace coder github.copilot

# From marketplace URLs
vsix-cli download "https://open-vsx.org/extension/ms-python/python"
```

### Batch Operations

```bash
# Multiple extensions at once
vsix-cli install --editors cursor ms-python.python github.copilot prettier.prettier

# From file
cat extensions.txt | vsix-cli install --editors all

# Pipe from echo
echo "ms-python.python github.copilot" | vsix-cli download
```

### Advanced Usage

```bash
# Dry run to preview actions
vsix-cli install --dry-run --editors all ms-python.python

# Quiet mode for scripts
vsix-cli download --quiet --yes ms-python.python

# Verbose output for debugging
vsix-cli download --verbose ms-python.python

# Disable colors for logging
vsix-cli download --no-color ms-python.python
```

## 🏪 Supported Marketplaces

| Marketplace | Identifier | Description | Status |
|-------------|------------|-------------|---------|
| **VS Code Marketplace** | `official` | Microsoft's official marketplace | ✅ Full Support |
| **Open VSX Registry** | `openvsx` | Open-source alternative | ✅ Full Support |
| **Coder Marketplace** | `coder` | For code-server environments | ✅ Full Support |
| **Eclipse Marketplace** | `eclipse` | Eclipse Foundation marketplace | ⚠️ Experimental |

## 💻 Supported Editors

| Editor | Identifier | Description |
|--------|------------|-------------|
| **Cursor** | `cursor` | AI-first code editor |
| **Windsurf** | `windsurf` | Codeium's editor |
| **Trae** | `trae` | Lightweight editor |
| **VSCodium** | `vscodium` | Open-source VS Code |
| **VS Code** | `vscode` | Microsoft's editor |
| **All** | `all` | Install to all detected editors |

## ⚙️ Configuration

### Configuration File
Settings are stored in: `${XDG_CONFIG_HOME:-$HOME/.config}/vsix-cli/config`

### Available Settings

| Setting | Description | Default | Values |
|---------|-------------|---------|---------|
| `default_marketplace` | Default marketplace to use | `official` | `official`, `openvsx`, `coder`, `eclipse` |
| `default_editors` | Default editors for install | `cursor` | Comma-separated editor list |
| `show_progress` | Show progress indicators | `true` | `true`, `false` |
| `auto_yes` | Auto-answer prompts | `false` | `true`, `false` |
| `no_color` | Disable colored output | `false` | `true`, `false` |

### Configuration Examples

```bash
# Set Open VSX as default marketplace
vsix-cli config set default_marketplace openvsx

# Set multiple default editors
vsix-cli config set default_editors "cursor,vscode,vscodium"

# Disable progress indicators
vsix-cli config set show_progress false

# View current configuration
vsix-cli config get

# Reset to defaults
vsix-cli config reset
```

## 🔗 URL Formats

The tool supports various URL formats from different marketplaces:

### VS Code Marketplace
```
https://marketplace.visualstudio.com/items?itemName=publisher.name
https://marketplace.visualstudio.com/items/publisher.name
```

### Open VSX Registry
```
https://open-vsx.org/extension/publisher/name
```

### Coder Marketplace
```
https://extensions.coder.com/extension/publisher/name
```

### Eclipse Marketplace
```
https://marketplace.eclipse.org/content/extension-name
```

## 🔧 Advanced Usage

### Environment Variables

- `VSIX_CLI_UPDATE_URL` - Custom update URL
- `VSIX_CLI_VERSION_URL` - Custom version check URL
- `NO_COLOR` - Disable colors globally

### Scripting Integration

```bash
#!/bin/bash
# Install development extensions
extensions=(
    "ms-python.python"
    "github.copilot"
    "prettier.prettier"
    "esbenp.prettier-vscode"
)

for ext in "${extensions[@]}"; do
    vsix-cli install --quiet --yes --editors cursor "$ext"
done
```

### CI/CD Usage

```yaml
# GitHub Actions example - Direct download
- name: Install extensions
  run: |
    curl -O https://raw.githubusercontent.com/hongkongkiwi/vsix-cli/main/vsix-cli
    chmod +x vsix-cli
    ./vsix-cli install --quiet --yes --editors all ms-python.python

# GitHub Actions example - Homebrew (macOS runners)
- name: Install via Homebrew
  run: |
    brew tap hongkongkiwi/vsix-cli
    brew install vsix-cli
    vsix-cli install --quiet --yes --editors all ms-python.python

# GitHub Actions example - Docker
- name: Download extensions
  run: |
    docker run --rm -v ${{ github.workspace }}:/output \
      hongkongkiwi/vsix-cli:latest download ms-python.python github.copilot
```

### Docker Examples

```bash
# Download extensions with custom marketplace
docker run --rm -v $(pwd):/output \
  hongkongkiwi/vsix-cli:latest download --marketplace openvsx ms-python.python

# Search with limit and save results
docker run --rm hongkongkiwi/vsix-cli:latest search --limit 5 python

# Get extension info
docker run --rm hongkongkiwi/vsix-cli:latest info ms-python.python

# Run with custom config (mount config directory)
docker run --rm -v $(pwd):/output -v ~/.config/vsix-cli:/home/vsix/.config/vsix-cli \
  hongkongkiwi/vsix-cli:latest download ms-python.python

# Dry run to preview downloads
docker run --rm hongkongkiwi/vsix-cli:latest download --dry-run ms-python.python

# Batch download from file
cat extensions.txt | docker run --rm -i -v $(pwd):/output \
  hongkongkiwi/vsix-cli:latest download
```

## 🔄 Global Options

| Option | Short | Description |
|--------|-------|-------------|
| `--quiet` | `-q` | Suppress non-error output |
| `--verbose` | `-V` | Show detailed output |
| `--yes` | `-y` | Auto-answer yes to prompts |
| `--no-color` | `-c` | Disable colored output |
| `--marketplace` | `-m` | Use specific marketplace |
| `--help` | `-h` | Show help message |

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

### Repositories

- **Main Project**: [hongkongkiwi/vsix-cli](https://github.com/hongkongkiwi/vsix-cli) - Main script and documentation
- **Homebrew Formula**: [hongkongkiwi/homebrew-vsix-cli](https://github.com/hongkongkiwi/homebrew-vsix-cli) - Homebrew tap repository (auto-updated)

### Development Setup

```bash
git clone https://github.com/hongkongkiwi/vsix-cli.git
cd vsix-cli
chmod +x vsix-cli
```

### Testing

```bash
# Test basic functionality
./vsix-cli --help
./vsix-cli search test
./vsix-cli info ms-python.python
```

## 📝 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## 🐛 Issues and Support

If you encounter any issues or have questions:

1. Check the [existing issues](https://github.com/hongkongkiwi/vsix-cli/issues)
2. Create a new issue with detailed information
3. Include your OS, shell, and the command that failed

## 🎉 Acknowledgments

- VS Code team for the marketplace API
- Open VSX Registry for the open-source alternative
- All contributors and users of this tool

---

**Made with ❤️ for the developer community**


