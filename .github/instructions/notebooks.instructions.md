---
applyTo: 'notebooks/**'
---
# Notebook Conventions

## Setup Pattern

All notebooks should start with the standard DrWatson activation:

```julia
using Revise
using DrWatson
quickactivate(@__DIR__, "Linear_Algebra")
using Linear_Algebra
```

## Notebook Guidelines

- Notebooks are for exploration and study, not tested in CI
- Use `println()` for output to make results clear when re-running cells
- Include explanatory markdown cells between code cells
- Use Unicode variable names consistent with the source code (e.g., `v₁`, `θ`, `λ`)
- Reference the documentation sections being studied

## Plotting in Notebooks

- Plots render inline in Jupyter notebooks
- No need for headless mode configuration
- Use the same plotting functions from the package (`plot_param_line`, etc.)
