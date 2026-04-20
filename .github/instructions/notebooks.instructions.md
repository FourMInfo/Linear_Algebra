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

## Julia Kernel Gotchas

### Stale variable slot after a failed assignment

If a cell fails mid-execution with an assignment like `foo = some_expr_using_foo`, Julia may
register a declared-but-unassigned global slot for `foo` in `Main`. This slot **persists across
cell re-runs** and shadows any same-named binding from imported modules (e.g., `LinearAlgebra.I`).
Typical symptom: `UndefVarError: foo not defined` even though `foo` is clearly exported by the
package, sometimes accompanied by "Also exported by ..." in the hint.

**Fix: restart the Julia kernel.** Reloading the package (`using Linear_Algebra` again) is not
enough — the stale slot in `Main` survives until the kernel is fully restarted. After restarting,
re-run the setup cell before re-running the failing cell.

### Building a matrix from row vectors

`[v1; v2; v3]` where all three are 1D vectors concatenates them into one long 1D vector, **not**
a matrix. To stack 1D vectors as matrix rows, transpose each one first:

```julia
matrix = [v1'; v2'; v3']   # ✅ 3×n matrix
matrix = [v1; v2; v3]      # ❌ 3n-element vector
```

This comes up whenever building a matrix row-by-row after row operations (e.g. Gauss-Jordan elimination).

### Stale cell state from mutated variables across cells

Cells share the same kernel state. If a variable is mutated across multiple cells (e.g. `I₃ₓ₃`
being updated in Step 1, Step 2, Step 3 ...), re-running a later cell without re-running the
earlier ones first will use the already-mutated value — producing wrong results silently.

**Fix: re-run all dependent cells from the top**, or at minimum from the cell that initialises
the variable. When in doubt, restart the kernel and re-run all cells in order.
