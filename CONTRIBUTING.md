# Contributing to Linear Algebra

Thank you for your interest in contributing to the Linear Algebra project! This document outlines the development workflow and contribution guidelines.

## 🔄 **Development Workflow**

### **Branch-Based Development**

We use a branch-based development workflow to maintain code quality and enable collaborative development:

1. **Main Branch Protection**: The `main` branch is protected and requires pull requests
2. **Feature Branches**: All development happens in feature branches
3. **Pull Request Reviews**: All changes must be reviewed before merging
4. **Automated Testing**: All PRs run tests automatically

### **Creating a Feature Branch**

```bash
# Start from the latest main branch
git checkout main
git pull origin main

# Create a new feature branch
git checkout -b feature/your-feature-name

# Make your changes
# ... edit files ...

# Commit your changes
git add .
git commit -m "Add descriptive commit message"

# Push the branch
git push origin feature/your-feature-name
```

### **Pull Request Process**

1. **Create PR**: Open a pull request from your feature branch to `main`
2. **Automatic Testing**: GitHub Actions will run tests automatically
3. **Review Process**: Request review from maintainers
4. **Address Feedback**: Make changes based on review comments
5. **Merge**: Once approved, the PR will be merged to main
6. **Documentation Deployment**: Documentation automatically deploys after merge

## 🧪 **Testing**

### **Running Tests Locally**

```bash
# From the repository root
julia --project=. -e "using Pkg; Pkg.test()"

# Or directly
julia --project=. test/runtests.jl
```

### **Continuous Integration**

Our CI pipeline runs on:
- **All Pull Requests**: Tests run to verify code quality
- **Push to Main**: Tests + documentation deployment

**CI Jobs:**
- **Test Job**: Runs on all PRs and pushes
- **Deploy Documentation**: Only runs on push to main (after PR merge)

## 📚 **Documentation**

### **Building Documentation Locally**

```bash
# Build documentation
julia --project=. docs/make.jl

# Serve documentation locally (if using LiveServer.jl)
julia --project=. -e "using LiveServer; serve(dir=\"docs/build\")"
```

### **Documentation Deployment**

- **Automatic**: Documentation deploys to https://study.fourm.info/linear_algebra/ after PR merge
- **Cross-Repository**: This repo deploys to a subdirectory of the main study site
- **Manual Trigger**: Maintainers can trigger manual documentation builds if needed

## 🏗️ **Code Standards**

### **Julia Style Guidelines**

- Follow [Julia Style Guide](https://docs.julialang.org/en/v1/manual/style-guide/)
- Use descriptive function and variable names
- Add docstrings to all public functions
- Include examples in docstrings where helpful

### **Documentation Standards**

```julia
"""
    function_name(param1::Type, param2::Type) -> ReturnType

Brief description of what the function does.

# Arguments
- `param1::Type`: Description of parameter 1
- `param2::Type`: Description of parameter 2

# Returns
- `ReturnType`: Description of return value

# Examples
```julia
julia> function_name(value1, value2)
expected_output
```
"""
function function_name(param1, param2)
    # Implementation
end
```

### **Commit Message Guidelines**

- Use clear, descriptive commit messages
- Start with a verb in the imperative mood
- Keep the first line under 50 characters
- Add detailed explanation in the body if needed

**Good Examples:**
```
Add matrix projection functions
Fix bug in rotation matrix calculation
Update documentation for symbolic functions
```

## 🔒 **Repository Protection Rules**

The main branch is protected with the following rules:
- **Require pull request reviews** before merging
- **Require status checks to pass** before merging
- **Require branches to be up to date** before merging
- **Include administrators** in these restrictions

## 🚀 **Release Process**

1. **Version Bump**: Update version in `Project.toml`
2. **Changelog**: Update `CHANGELOG.md` (if present)
3. **Tag Release**: Create a git tag with the version number
4. **Documentation**: Ensure documentation is updated and deployed

## 🐛 **Issue Reporting**

When reporting bugs or requesting features:

1. **Search Existing Issues**: Check if the issue already exists
2. **Provide Context**: Include relevant code, error messages, and environment details
3. **Minimal Example**: Provide a minimal reproducible example
4. **Expected vs Actual**: Describe what you expected vs what happened

## 📞 **Getting Help**

- **Issues**: Use GitHub Issues for bug reports and feature requests
- **Discussions**: Use GitHub Discussions for questions and general discussion
- **Pull Requests**: Use PR comments for code-specific discussions

## 🏆 **Recognition**

Contributors will be recognized in:
- Repository contributors list
- Documentation acknowledgments
- Release notes (for significant contributions)

Thank you for contributing to the Linear Algebra project! 🎉
