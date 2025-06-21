## Description

Brief description of the changes in this PR.

## Type of Change

- [ ] 🐛 Bug fix (non-breaking change which fixes an issue)
- [ ] ✨ New feature (non-breaking change which adds functionality)
- [ ] 💥 Breaking change (fix or feature that would cause existing functionality to not work as expected)
- [ ] 📚 Documentation update (changes to README, CONTRIBUTING, etc.)
- [ ] 🔧 Maintenance (dependency updates, CI changes, etc.)
- [ ] 🎨 Code style/formatting changes
- [ ] ⚡ Performance improvements
- [ ] 🔒 Security fixes

## Related Issues

Fixes #(issue number)
Relates to #(issue number)

## Changes Made

- List the specific changes made in this PR
- Include both functional and technical changes
- Mention any new dependencies or requirements

## Testing

### Testing Checklist

- [ ] Tested on Linux
- [ ] Tested on macOS  
- [ ] Tested on Windows/WSL
- [ ] ShellCheck passes (`shellcheck vsix-cli`)
- [ ] Basic functionality works (`./vsix-cli --help`, `./vsix-cli version`)
- [ ] Added/updated tests if applicable

### Test Commands Run

```bash
# List the specific commands you used to test
./vsix-cli --help
./vsix-cli version
# Add other test commands here
```

### Test Results

Describe the results of your testing, including:
- What scenarios were tested
- Any edge cases considered
- Performance impact (if applicable)

## Documentation

- [ ] Updated README.md if needed
- [ ] Updated CHANGELOG.md with changes
- [ ] Updated help text in script if needed
- [ ] Updated CONTRIBUTING.md if workflow changes
- [ ] Added code comments for complex logic

## Backward Compatibility

- [ ] This change is backward compatible
- [ ] This change includes breaking changes (documented in CHANGELOG.md)
- [ ] Migration guide provided for breaking changes

## Security

- [ ] No sensitive information (passwords, keys, tokens) added
- [ ] Input validation added/maintained for new features
- [ ] No unsafe shell practices introduced

## Performance

- [ ] No significant performance regression
- [ ] Performance improvements documented
- [ ] Memory usage considered for new features

## Checklist

- [ ] My code follows the project's style guidelines
- [ ] I have performed a self-review of my own code
- [ ] I have commented my code, particularly in hard-to-understand areas
- [ ] I have made corresponding changes to the documentation
- [ ] My changes generate no new warnings
- [ ] I have added tests that prove my fix is effective or that my feature works
- [ ] New and existing unit tests pass locally with my changes
- [ ] Any dependent changes have been merged and published in downstream modules

## Additional Notes

Add any additional notes, concerns, or context for reviewers.

### Screenshots (if applicable)

Paste any relevant screenshots or terminal output here.

### Reviewers

@hongkongkiwi <!-- Add specific reviewers if needed -->

---

**For Maintainers:**

- [ ] Code review completed
- [ ] All CI checks passing
- [ ] Version updated if needed
- [ ] Ready to merge 