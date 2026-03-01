# Copilot Instructions for Linear_Algebra

> **Note:** These instructions serve as the canonical basis for other repositories in the Julia Math study project. Context-specific instructions (docs, testing, source, notebooks) are in `.github/instructions/` and load automatically based on the file being edited.

## Project Overview

This is a **Julia linear algebra project** using DrWatson for reproducibility, focused on geometric transformations and linear algebra operations with visualization capabilities. The codebase follows a **modular mathematical library pattern** with comprehensive testing and documentation.

### Core Components

- **`src/Linear_Algebra.jl`**: Main module with exports for basic operations and transformation matrices
- **`src/linear_algebra_basic.jl`**: Core linear algebra functions (distances, projections, line operations, intersections)
- **`src/linear_algebra_transform.jl`**: Matrix transformations (projection, rotation, stretch, reflection matrices)
- **`test/`**: Comprehensive test suite with CI-compatible plotting tests
- **`docs/`**: Documenter.jl setup with cross-repository deployment to math_tech_study

## Key Workflows

### Running Tests
```bash
# Local
julia --project=. test/runtests.jl

# CI mode
CI=true julia --project=. test/runtests.jl
```

### Building Documentation
```bash
julia --project=. docs/make.jl
```

**IMPORTANT**: Always run `julia --project=. docs/make.jl` after making changes to documentation files in `docs/src/`. This allows the user to preview changes in the browser immediately without running the build manually.

### Julia Compilation Considerations
- **Be Patient with First Runs**: Julia often needs to precompile packages and rebuild project cache on first run. When running a Julia command in the CLI for the first time, it may take a while to precompile the packages and build the project cache, so you won't see the results of running the command for a while.
- **Typical First Run**: May take 15-30 seconds for precompilation before tests actually start
- **Example Expected Output**: `Precompiling DrWatson... 3 dependencies successfully precompiled in 17 seconds`
- **Subsequent Runs**: Much faster once cache is built
- **Don't Cancel Early**: Allow time for compilation phase to complete
- **IMPORTANT**: This applies to ALL Julia commands including CI testing with `CI=true julia --project=. test/runtests.jl`

## Git Best Practices

- **Never use `git add .`** - Always stage files explicitly by name to avoid accidentally committing development files, notebooks, or temporary files
- Use `git add <specific-file-path>` to stage only the intended files for commit
- **Feature branch naming**: Use descriptive, purpose-driven names that enable GitHub auto-suggestions:
  - ✅ Good: `feature/add-fourm-site-explanation`, `fix/sidebar-center-alignment`, `docs/add-copilot-instructions`
  - ❌ Avoid: `feature/update-content`, `fix/stuff`, `branch1`

### Pull Request Creation
- **ALWAYS push changes first**: Use `git push origin BRANCH_NAME` before creating PR
- **Do NOT use `gh pr create`** - The GitHub CLI command doesn't work properly in this environment
- **Use GitHub web interface with URL parameters**: Create links with embedded title and description for auto-fill
- **PR Link Format with Parameters**: 
  ```
  https://github.com/FourMInfo/Linear_Algebra/compare/main...BRANCH_NAME?title=Your+PR+Title&body=Your+PR+Description
  ```
- **Always provide fallback copy-paste content**: Include separate, copyable title and description in case URL parameters don't work
- **Include comprehensive descriptions**: Detail all changes, test coverage, and architectural improvements
- **Reference issue numbers**: Link to related issues when applicable

#### PR Creation Template:
```markdown
## 🔗 Clickable PR Link:
[Your PR Title](https://github.com/FourMInfo/Linear_Algebra/compare/main...BRANCH_NAME?title=Your+PR+Title&body=Your+PR+Description)

## 📝 Copy-Paste Title:
Your PR Title

## 📋 Copy-Paste Description:
Your comprehensive PR description with:
- Summary of changes
- Technical details
- Testing completed
- Related issues
```

## Azure Integration

- Use Azure Best Practices: When generating code for Azure, running terminal commands for Azure, or performing operations related to Azure, invoke your `azure_development-get_best_practices` tool if available

## Communication Patterns

- Avoid being overly obsequious in responses
    - do not tell me "I am happy to help" or similar phrases
    - do not tell me how amazing I am or how great my work is
    - do not say something is "awesome" or "fantastic" unless it is truly exceptional
    - do not use overly emotional language
    - do not use words like "wonderful" or "great" to describe my work
    - do not use words like "perfect" or "flawless" to describe my work
- When asked to analyze a bug or problem first lay out the problem clearly, then suggest potential solutions or debugging steps and let the user decide on the next steps
- Never say "I see what the problem is" or similar phrases that imply you have fully understood the issue without further discussion and confirmation that you have understood the issue
- Always provide clear, actionable suggestions for next steps in debugging or implementation
    - Acknowledge when you need more information or clarification before proceeding
    - Summarize the current understanding of the issue before discussing potential solutions
    - Document any assumptions made during the analysis
    - Identify any knowledge gaps or areas requiring further investigation
- Notify user immediately if you cannot read a file they provided (e.g., PDFs, binary files) instead of silently substituting other files or faking understanding of the content
- If you are unsure about a solution, clearly state that more information is needed or that further investigation is required
- When providing code examples, ensure they are clear, concise, and directly relevant to the problem at hand
    - Avoid unnecessary complexity in code examples
    - Use comments to explain key parts of the code where necessary
    - Ensure code examples are formatted correctly for readability
- If you find yourself repeating steps stop and explain why you are repeating them and ask if the user would like to proceed with the same steps again
- Always ask for confirmation before proceeding with potentially destructive actions, such as deleting files or making significant changes to the codebase
- When discussing code changes, clearly outline the impact of those changes on the overall project
    - Discuss how changes align with project goals and coding standards
    - Highlight any potential risks or trade-offs associated with the changes
- If you encounter a situation where you need to make assumptions, clearly state those assumptions and their implications
- When discussing project architecture or design decisions, provide a rationale for each decision made
    - Discuss how the design aligns with project goals and coding standards
    - Highlight any trade-offs considered during the design process
- If you need to reference external resources or documentation, provide clear links and context for their relevance
- When discussing project conventions or standards, ensure they are clearly documented and easily accessible
- If you encounter a situation where you need to deviate from established conventions, clearly explain the reasoning behind the deviation
- Always strive for clarity and precision in communication, especially when discussing technical details
- If you need to ask for clarification, do so in a way that encourages open dialogue and collaboration
    - Use open-ended questions to encourage discussion
    - Avoid leading questions that may bias the response
- When providing feedback on code or design, focus on constructive criticism that helps improve the overall quality
    - Highlight both strengths and areas for improvement
    - Provide specific examples to illustrate points
- If you encounter a situation where you need to make a judgment call, clearly outline the criteria used to make that judgment
    - Discuss any relevant factors considered in the decision-making process
- When discussing project goals or objectives, ensure they are clearly defined and measurable
- If you need to prioritize tasks or features, clearly explain the reasoning behind the prioritization
    - Discuss how priorities align with project goals and timelines
