# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Comprehensive README documentation
- Contributing guidelines
- GitHub workflows for CI/CD
- Proper project structure with LICENSE and .gitignore
- Docker support with Alpine-based image
- Multi-platform Docker builds (amd64, arm64)
- Docker Hub and GitHub Container Registry publishing

### Changed
- Repository structure reorganization

### Deprecated

### Removed

### Fixed

### Security

## [4.0.0] - 2024-01-XX

### Added
- Multi-marketplace support (VS Code, Open VSX, Coder, Eclipse)
- Multi-editor installation support (Cursor, Windsurf, Trae, VSCodium, VS Code)
- Configuration management with persistent settings
- Search functionality for extensions
- Extension information display
- Batch operations and stdin support
- Version-specific downloads
- Auto-update functionality
- Dry-run mode for previewing operations
- Progress indicators for downloads
- Cross-platform compatibility (Linux, macOS, Windows/WSL)
- Comprehensive help system
- URL parsing for marketplace links
- Error handling and validation
- Colored output with NO_COLOR support
- Quiet and verbose modes

### Changed
- Complete rewrite of the tool architecture
- Improved command-line interface
- Enhanced error messages and user feedback

### Security
- Input validation for extension IDs and URLs
- Safe handling of downloaded files

---

## Release Notes

### v4.0.0 - Major Release

This is a complete rewrite of vsix-cli with significant new features:

**🚀 New Features:**
- **Multi-Marketplace Support**: Download from 4 different marketplaces
- **Multi-Editor Installation**: Install to 6 different editors simultaneously
- **Configuration Management**: Persistent user settings
- **Search & Discovery**: Find extensions by name or keywords
- **Batch Operations**: Process multiple extensions at once
- **Version Control**: Download specific versions or latest

**🔧 Technical Improvements:**
- Robust error handling and validation
- Cross-platform compatibility
- Progress indicators and user feedback
- Comprehensive help system
- Auto-update functionality

**📚 Documentation:**
- Complete README with examples
- Contributing guidelines
- Changelog tracking
- GitHub workflows

**🔄 Breaking Changes:**
- New command structure (may require script updates)
- Configuration file format changes
- Some command-line options renamed

**🐛 Bug Fixes:**
- Improved URL parsing
- Better error messages
- Cross-platform path handling
- Network error handling

For upgrade instructions and migration guide, see the [README](README.md).

---

## How to Read This Changelog

- **Added** for new features
- **Changed** for changes in existing functionality  
- **Deprecated** for soon-to-be removed features
- **Removed** for now removed features
- **Fixed** for any bug fixes
- **Security** in case of vulnerabilities

## Version Links

- [Unreleased]: https://github.com/hongkongkiwi/vsix-cli/compare/v4.0.0...HEAD
- [4.0.0]: https://github.com/hongkongkiwi/vsix-cli/releases/tag/v4.0.0 