---
applyTo: 'notebooks/**'
---
# Notebook Conventions

## Setup Pattern

All notebooks should start with the standard DrWatson activation, followed by LAlatex initialisation:

```julia
using Revise
using DrWatson
quickactivate(@__DIR__, "Linear_Algebra")
using Linear_Algebra

LAlatex.set_backend!(:symbolics)
LAlatex.reset_display_defaults!()
```

`LAlatex`, `BlockArrays`, and `LaTeXStrings` are re-exported by `Linear_Algebra`, so no separate `using` is needed. In particular, the `L"..."` string macro is available immediately after `using Linear_Algebra`.
`set_backend!(:symbolics)` is required because this package uses Symbolics.jl; the default `:latexify` backend gives worse output for symbolic expressions.
`reset_display_defaults!()` ensures a clean display state on every kernel restart.

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

## LAlatex Display

[LAlatex.jl](https://github.com/ea42gh/LAlatex.jl) (by ea42gh) is re-exported by `Linear_Algebra` and provides clean LaTeX rendering of linear algebra objects in notebooks. Use it instead of raw `println` or `display` whenever presenting mathematical results.

### Core functions

| Function | Purpose |
|---|---|
| `l_show(...)` | Display one or more objects inline or as a display equation |
| `L_show(...)` | Same but returns a `String` instead of displaying |
| `lc(coeffs, vecs)` | Linear combination display |
| `set(...)` | Finite set or set-builder notation |
| `cases(...)` | Piecewise / cases display |
| `aligned(...)` | Multi-line aligned derivation or equation chain |
| `mixed_matrix(...)` / `@mixed_matrix` | Matrix with mixed numeric/symbolic entries |
| `factor_out_denominator(A)` | Factor a common denominator out of a rational matrix |

### Common options for `l_show`

```julia
l_show(L"A = ", A; arraystyle=:bmatrix)          # bracket style: :bmatrix, :pmatrix, :vmatrix, :array
l_show(expr; symopts=(expand=true,))              # symbolic transformations: expand, factor, collect
l_show(A; number_formatter=x -> round_value(x,2)) # custom number formatting
l_show(A; number_formatter=percentage_formatter)  # percentage display
l_show(aligned(...); inline=false, tag="1")        # numbered display equation (no label — see below)
with_display_defaults(arraystyle=:bmatrix) do ... end  # scoped defaults
```

### Block-partitioned matrices

Wrap a plain matrix in `BlockArray` to get visual partition lines (horizontal `\hline` and vertical `|` separators) between blocks:

```julia
B = BlockArray([1 2 4; 3 4 5], [1, 1], [2, 1])   # row sizes [1,1], col sizes [2,1]
display(l_show(L"B = ", B))
```

### KaTeX constraint: no `\label`

Jupyter notebooks render math with **KaTeX**, which supports `\tag{...}` but **not** `\label{...}`. Never pass the `label=` keyword to `l_show` in a notebook — it will produce a parse error. Use `tag=` only:

```julia
# ✅ correct
display(l_show(aligned(...); inline=false, tag="1"))
# ❌ will fail in Jupyter
display(l_show(aligned(...); inline=false, tag="1", label="eq:foo"))
```

`label=` is only valid when rendering to full LaTeX/MathJax (e.g. Documenter.jl docs).

### Reference

- [LAlatex.jl docs](https://ea42gh.github.io/LAlatex.jl/)
- [Demo notebook (upstream)](https://github.com/ea42gh/LAlatex.jl/blob/main/notebooks/LAlatex_demo.ipynb)
- [Interactive Binder demo](https://mybinder.org/v2/gh/ea42gh/LAlatex.jl/main?filepath=notebooks%2FLAlatex_demo.ipynb)

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
