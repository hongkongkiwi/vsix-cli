# Contributing to vsix-cli

Thank you for your interest in contributing to vsix-cli! This document provides guidelines and information for contributors.

## 🤝 Ways to Contribute

- **Bug Reports**: Report issues you encounter
- **Feature Requests**: Suggest new functionality
- **Code Contributions**: Submit pull requests
- **Documentation**: Improve documentation and examples
- **Testing**: Help test the tool on different platforms

## 🐛 Reporting Issues

Before creating an issue, please:

1. **Search existing issues** to avoid duplicates
2. **Use the latest version** of vsix-cli
3. **Provide detailed information**:
   - Operating system and version
   - Shell environment (`echo $SHELL`)
   - Command that failed
   - Full error message
   - Expected vs actual behavior

### Issue Template

```
**Environment:**
- OS: [e.g., macOS 14.0, Ubuntu 22.04, Windows 11]
- Shell: [e.g., bash 5.1, zsh 5.8]
- vsix-cli version: [e.g., 4.0.0]

**Command:**
```bash
vsix-cli command-that-failed
```

**Expected Behavior:**
What you expected to happen.

**Actual Behavior:**
What actually happened.

**Error Output:**
```
Paste the full error message here
```

**Additional Context:**
Any other relevant information.
```

## 💡 Feature Requests

When requesting a feature:

1. **Check existing issues** for similar requests
2. **Describe the use case** and problem it solves
3. **Provide examples** of how it would work
4. **Consider backward compatibility**

## 🔧 Development Setup

### Prerequisites

- **Bash 4.0+** (macOS users may need to install via Homebrew)
- **curl** or **wget** for downloads
- **git** for version control
- **jq** (optional, for JSON parsing)

### Getting Started

```bash
# Fork and clone the repository
git clone https://github.com/your-username/vsix-cli.git
cd vsix-cli

# Make the script executable
chmod +x vsix-cli

# Test basic functionality
./vsix-cli --help
./vsix-cli version
```

### Development Environment

```bash
# Install optional dependencies for development
# macOS
brew install bash jq shellcheck

# Ubuntu/Debian
sudo apt-get update
sudo apt-get install bash jq shellcheck

# Test the script
./vsix-cli search test
./vsix-cli info ms-python.python
```

## 🧪 Testing

### Manual Testing

Before submitting changes, test:

```bash
# Basic functionality
./vsix-cli --help
./vsix-cli version
./vsix-cli search python

# Different marketplaces
./vsix-cli info --marketplace openvsx ms-python.python
./vsix-cli download --dry-run --marketplace coder github.copilot

# Configuration
./vsix-cli config get
./vsix-cli config set default_marketplace openvsx
./vsix-cli config reset

# Error handling
./vsix-cli download invalid.extension
./vsix-cli info --marketplace invalid ms-python.python
```

### Cross-Platform Testing

If possible, test on:
- **Linux** (Ubuntu, CentOS, etc.)
- **macOS** (Intel and Apple Silicon)
- **Windows** (WSL, Git Bash, Cygwin)

### Shell Compatibility

Test with different shells:
- **bash** (primary target)
- **zsh** (macOS default)
- **dash** (Ubuntu default sh)

## 📝 Code Style

### Shell Script Guidelines

1. **Use strict mode**: `set -euo pipefail`
2. **Quote variables**: `"$variable"` not `$variable`
3. **Use readonly for constants**: `readonly CONSTANT="value"`
4. **Function naming**: Use `snake_case`
5. **Error handling**: Always check return codes
6. **Comments**: Document complex logic

### Example

```bash
#!/bin/bash

set -euo pipefail

# Function to validate input
validate_extension_id() {
    local extension_id="$1"
    
    if [[ ! "$extension_id" =~ ^[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$ ]]; then
        error "Invalid extension ID format: $extension_id"
        return 1
    fi
    
    return 0
}
```

### Linting

Use ShellCheck for linting:

```bash
# Install ShellCheck
# macOS: brew install shellcheck
# Ubuntu: sudo apt-get install shellcheck

# Check the script
shellcheck vsix-cli
```

## 📋 Pull Request Process

### Before Submitting

1. **Create a feature branch**: `git checkout -b feature/your-feature`
2. **Test thoroughly** on your platform
3. **Update documentation** if needed
4. **Test thoroughly** to ensure your changes work correctly
5. **Ensure ShellCheck passes**

### Pull Request Guidelines

1. **Clear title and description**
2. **Reference related issues**: "Fixes #123"
3. **Explain the changes** and why they're needed
4. **Include test instructions**
5. **Update version if needed**

### Pull Request Template

```markdown
## Description
Brief description of the changes.

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
- [ ] Tested on Linux
- [ ] Tested on macOS
- [ ] Tested on Windows/WSL
- [ ] Added/updated tests
- [ ] ShellCheck passes

## Related Issues
Fixes #(issue number)

## Additional Notes
Any additional information or context.
```

## 🏷️ Versioning

We use [Semantic Versioning](https://semver.org/):

- **MAJOR**: Breaking changes
- **MINOR**: New features (backward compatible)
- **PATCH**: Bug fixes (backward compatible)

### Version Update Process

1. Update version in script: `readonly SCRIPT_VERSION="x.y.z"`
2. Test the changes thoroughly
3. Create pull request
4. Tag release after merge

## 📚 Documentation

### README Updates

- Keep examples current
- Update feature lists
- Add new command documentation
- Update compatibility information

### Code Documentation

- Comment complex functions
- Document command-line options
- Explain marketplace differences
- Include usage examples

## 🎯 Areas for Contribution

### High Priority

- **Windows compatibility** improvements
- **Error handling** enhancements
- **Test coverage** expansion
- **Performance** optimizations

### Feature Ideas

- **Bulk operations** from file
- **Extension dependencies** resolution
- **Local extension** management
- **Integration** with other tools

### Marketplace Support

- **New marketplaces** integration
- **API improvements** for existing marketplaces
- **Better error messages** for marketplace issues

## 🔍 Code Review Process

### For Maintainers

1. **Check functionality** on multiple platforms
2. **Review code style** and best practices
3. **Test edge cases** and error handling
4. **Verify documentation** updates
5. **Ensure backward compatibility**

### Review Criteria

- ✅ Code follows shell scripting best practices
- ✅ Changes are well-tested
- ✅ Documentation is updated
- ✅ No breaking changes (or properly documented)
- ✅ Error messages are helpful
- ✅ Cross-platform compatibility maintained

## 📞 Getting Help

- **GitHub Issues**: For bugs and features
- **GitHub Discussions**: For questions and ideas
- **Code Review**: Tag maintainers in PRs

## 🙏 Recognition

Contributors will be:
- **Tested thoroughly**
- **Mentioned in release notes**
- **Added to contributors section** (if desired)

Thank you for contributing to vsix-cli! 🎉 