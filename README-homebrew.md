# Homebrew Tap for vsix-cli

This is the official Homebrew tap for [vsix-cli](https://github.com/hongkongkiwi/vsix-cli), a command-line tool for downloading VS Code extensions from various marketplaces.

## Installation

### Add the tap and install

```bash
brew tap hongkongkiwi/vsix-cli
brew install vsix-cli
```

### Install directly (without adding the tap)

```bash
brew install hongkongkiwi/vsix-cli/vsix-cli
```

## Usage

After installation, you can use `vsix-cli` from anywhere in your terminal:

```bash
# Search for extensions
vsix-cli search python

# Download an extension
vsix-cli download ms-python.python

# Install to Cursor
vsix-cli install --editors cursor ms-python.python

# Show help
vsix-cli --help
```

## Updating

To update to the latest version:

```bash
brew update
brew upgrade vsix-cli
```

## Uninstalling

To uninstall:

```bash
brew uninstall vsix-cli
brew untap hongkongkiwi/vsix-cli  # Optional: remove the tap
```

## Requirements

The formula automatically installs the following dependencies:
- `bash` (for script execution)
- `curl` (for downloading)
- `jq` (for JSON processing)

## Issues

If you encounter any issues with the Homebrew installation, please:

1. Check the [main repository issues](https://github.com/hongkongkiwi/vsix-cli/issues)
2. Report Homebrew-specific issues in this tap repository
3. For general tool issues, report them in the [main repository](https://github.com/hongkongkiwi/vsix-cli)

## Contributing

Contributions to improve the Homebrew formula are welcome! Please see the [main repository's contributing guidelines](https://github.com/hongkongkiwi/vsix-cli/blob/main/CONTRIBUTING.md).

## License

This Homebrew tap is licensed under the same MIT License as the main project. 