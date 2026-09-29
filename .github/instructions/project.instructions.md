---
applyTo: '**'
---
# Linear_Algebra — Repository-Specific Instructions

This file is **this repo's own**: it holds everything specific to this repository and is never
overwritten by propagation from the hub. It can be as detailed as the repo needs. The shared
conventions every study repo follows are in the other files in `.github/instructions/`
(`ecosystem`, `source`, `testing`, `docs`, `notebooks`), which are copied unchanged from
`FourMInfo/math_tech_study/project_resources/instructions/` and must never be edited here. A
learning that holds for every study repo goes into those hub templates, not into this file.

## This Repository

| | |
|---|---|
| GitHub | `FourMInfo/Linear_Algebra` |
| Deployed at | `https://fourm.info/linear_algebra/` |
| `dirname` in `docs/make.jl` | `"linear_algebra"` |
| Subject | Linear algebra: vectors, matrices, systems of equations, analytic geometry, transformations |

## Package and Module

- **Main module**: `src/Linear_Algebra.jl`
- **Source files**: listed under "Core Architecture" in `.github/copilot-instructions.md`
- **Reexported packages**: `GeometryBasics`, `Plots`, `LinearAlgebra`, `RationalRoots`,
  `Symbolics`, `LaTeXStrings` — the core API only. LAlatex and BlockArrays are deliberately
  **not** reexported; they live in the notebooks environment (see Notebooks below).
- The module also reexports the `@variables` macro (`eval(:(export @variables))`).
- **Headless plotting**: tests set `GKSwstype` before loading; the module does no GR
  configuration of its own.

## Subject-Specific Conventions

### Types and Conventions

- **Points**: `GeometryBasics.Point2f(x, y)` for 2D points, consistently
- **Vectors**: regular `[Float64]` arrays in calculations
- **Matrices**: 2D transformation matrices are 2×2; handle both symbolic and numeric forms
- **Angles**: `rotation_matrix(d)` takes **degrees**, `rotation_matrix_ns(θ)` takes **radians** —
  document which one every angle-taking function expects
- **Coordinate system**: standard mathematical coordinates, not screen coordinates

### Function Categories

- **Basic operations**: distance, center of gravity, barycentric coordinates
- **Vector operations**: angles, orthogonality, projections, reflections
- **Line geometry**: parametric/implicit conversions, distances, intersections
- **Matrix transformations**: projection, rotation, stretch, reflection matrices
- **Symbolic functions**: `_symbolic` variants alongside the numeric ones

### Naming Families

- `distance_*` (e.g. `distance_2_points`, `distance_to_implicit_line`)
- `*_matrix` (e.g. `rotation_matrix`, `projection_matrix`)
- `*_line` (e.g. `explicit_line`, `parametric_to_implicit_line`)
- `*_coord` (e.g. `barycentric_coord`)

### Key Signatures

```julia
distance_2_points(p::Point, q::Point) -> Float64
center_of_gravity(p::Point, q::Point, t) -> Point
vector_angle_cos(p::Vector, q::Vector) -> Float64
orthproj(v::Vector, w::Vector) -> Vector
calculate_param_line(p::Point, q::Point, n::Int64) -> Vector{Point2f}
plot_param_line(p::Point, q::Point, n::Int64) -> Vector{Point2f}

rotation_matrix(d::Number) -> Matrix      # degrees
rotation_matrix_ns(θ::Number) -> Matrix   # radians
projection_matrix(x::Vector) -> Matrix
reflection_matrix(U::Vector) -> Matrix

parametric_to_implicit_line(p::Point, v::Vector) -> (Float64, Float64, Float64)
distance_to_implicit_line(a::Number, b::Number, c::Number, r::Point) -> Float64
foot_of_line(P::Point, v::Vector, R::Point, r::Bool=false) -> Tuple(Point, Float64)  # r: round to 3 digits
```

### Symbolics

- Symbolic parameters: `@variables θ`, `@variables λ₁`
- Evaluate at a value with `Symbolics.value.(substitute.(expr, var => value))`

## Tests

- **Test files**: `test_linear_algebra_basic.jl`, `test_linear_algebra_geometry.jl`,
  `test_linear_algebra_transform.jl` — one per source file
- Edge cases worth testing: orthogonal and parallel vectors, zero angles, degenerate lines
- Check return types (`Point2f`, `AbstractVector`, 2×2 matrices)

## Notebooks

Setup cell for this repo:

```julia
using Revise
using Linear_Algebra

# LaTeX display helpers (not reexported by the module — load explicitly)
using LAlatex, BlockArrays

LAlatex.set_backend!(:symbolics)
LAlatex.reset_display_defaults!()
```

- `LAlatex` and `BlockArrays` are **notebooks-environment dependencies only**
  (`notebooks/Project.toml`), so they need their own `using` line.
- `set_backend!(:symbolics)` is required because this package uses Symbolics.jl; the default
  `:latexify` backend gives worse output for symbolic expressions.
- `reset_display_defaults!()` ensures a clean display state on every kernel restart.

### LAlatex Display

[LAlatex.jl](https://github.com/ea42gh/LAlatex.jl) (by ea42gh) renders linear algebra objects as
clean LaTeX in notebooks. Use it instead of raw `println` or `display` when presenting
mathematical results.

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

Common options for `l_show`:

```julia
l_show(L"A = ", A; arraystyle=:bmatrix)          # bracket style: :bmatrix, :pmatrix, :vmatrix, :array
l_show(expr; symopts=(expand=true,))              # symbolic transformations: expand, factor, collect
l_show(A; number_formatter=x -> round_value(x,2)) # custom number formatting
l_show(A; number_formatter=percentage_formatter)  # percentage display
l_show(aligned(...); inline=false, tag="1")        # numbered display equation (no label — KaTeX)
with_display_defaults(arraystyle=:bmatrix) do ... end  # scoped defaults
```

Block-partitioned matrices: wrap a plain matrix in `BlockArray` to get partition lines between
blocks:

```julia
B = BlockArray([1 2 4; 3 4 5], [1, 1], [2, 1])   # row sizes [1,1], col sizes [2,1]
display(l_show(L"B = ", B))
```

Never pass `label=` to `l_show` in a notebook — Jupyter's KaTeX has no `\label` (see
`notebooks.instructions.md`); use `tag=` only.

References: [LAlatex.jl docs](https://ea42gh.github.io/LAlatex.jl/) ·
[demo notebook](https://github.com/ea42gh/LAlatex.jl/blob/main/notebooks/LAlatex_demo.ipynb) ·
[Binder demo](https://mybinder.org/v2/gh/ea42gh/LAlatex.jl/main?filepath=notebooks%2FLAlatex_demo.ipynb)
