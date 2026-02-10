---
applyTo: 'src/**'
---
# Source Code Conventions

## Module Structure & Exports

All code uses `@reexport` pattern and exports both computational + plotting functions:

```julia
# Main module uses @reexport for clean interface
using Reexport
@reexport using GeometryBasics, Plots, LinearAlgebra, RationalRoots, Symbolics

# Configure plotting for both interactive and headless environments
if haskey(ENV, "CI") || get(ENV, "GKSwstype", "") == "100"
    ENV["GKSwstype"] = "100"
    gr(show=false)
else
    gr()
end

# Comprehensive exports for all functions
# Pure computational functions (no plotting dependencies)
export calculate_param_line
# Integrated plotting functions (computation + visualization)
export distance_2_points, center_of_gravity, barycentric_coord, plot_param_line
```

## Julia Coding Standards

### Linear Algebra Functions
1. Use GeometryBasics.Point2f for 2D points consistently
2. Use regular Arrays ([Float64]) for vectors in calculations
3. Handle both symbolic and numeric matrix operations
4. Degrees vs radians: `rotation_matrix(d)` takes degrees, `rotation_matrix_ns(θ)` takes radians
5. Matrix functions return 2x2 matrices for 2D transformations
6. Always export new functions in main module
7. Use clear parameter naming (θ for angles, v/w for vectors, p/q for points)

### Function Categories
- **Basic Operations**: Distance, center of gravity, barycentric coordinates
- **Vector Operations**: Angle calculations, orthogonality, projections, reflections
- **Line Geometry**: Parametric/implicit conversions, distance calculations, intersections
- **Matrix Transformations**: Projection, rotation, stretch, reflection matrices
- **Symbolic Functions**: Provide both symbolic and numeric versions

### Documentation & Comments
- Include detailed comments explaining geometric concepts
- Use clear variable names (e.g., `p1`, `p2` for points, `v`, `w` for vectors)
- Document angle conventions (degrees vs radians) in function comments
- Explain mathematical formulas in comments
- Maintain consistency with mathematical notation

### Code Organization
- **Two-File Structure**: Basic operations in `linear_algebra_basic.jl`, matrices in `linear_algebra_transform.jl`
- **Consistent Naming**: Functions end with descriptive suffixes (`_matrix`, `_line`, `_coord`)
- **Symbolic Variants**: Provide `_symbolic` versions for algebraic manipulation
- **Export Everything**: All public functions exported from main module
- **Follow Math_Foundations Pattern**: Separate computational logic from plotting

## Dependencies & Libraries

**Main Dependencies**: GeometryBasics, Plots, LinearAlgebra, RationalRoots, Symbolics

### Mathematical Libraries Used
- **GeometryBasics.jl**: For Point2f types and geometric primitives
- **LinearAlgebra.jl**: For `norm()`, `dot()`, matrix operations
- **Symbolics.jl**: For `@variables` in symbolic matrix functions
  - Pattern: `@variables θ`, `@variables λ₁` for symbolic parameters
  - Use `Symbolics.value.(substitute.(expr, var => value))` for evaluation
- **Plots.jl**: For visualization functions (`scatter!`, `plot!`, `display`)
- **RationalRoots.jl**: For rational approximations

## Project-Specific Conventions

### Mathematical Operations
- **Point Types**: Use `Point2f(x, y)` for 2D points consistently
- **Vector Types**: Use `[Float64]` arrays for vector calculations
- **Angle Conventions**: Document whether functions expect degrees or radians
- **Matrix Size**: All 2D transformation matrices are 2x2
- **Coordinate Systems**: Standard mathematical coordinate system (not screen coordinates)

### Function Naming Patterns
- **Distance Functions**: `distance_*` (e.g., `distance_2_points`, `distance_to_implicit_line`)
- **Matrix Functions**: `*_matrix` (e.g., `rotation_matrix`, `projection_matrix`)
- **Line Functions**: `*_line` (e.g., `explicit_line`, `parametric_to_implicit_line`)
- **Coordinate Functions**: `*_coord` (e.g., `barycentric_coord`)

## Function Signature Patterns

### Basic Linear Algebra
```julia
distance_2_points(p::Point, q::Point) -> Float64
center_of_gravity(p::Point, q::Point, t) -> Point
vector_angle_cos(p::Vector, q::Vector) -> Float64
orthproj(v::Vector, w::Vector) -> Vector
# Pure computational functions (no plotting dependencies)
calculate_param_line(p::Point, q::Point, n::Int64) -> Vector{Point2f}
# Integrated plotting functions (computation + visualization)
plot_param_line(p::Point, q::Point, n::Int64) -> Vector{Point2f}
```

### Matrix Transformations
```julia
rotation_matrix(d::Number) -> Matrix      # Takes degrees
rotation_matrix_ns(θ::Number) -> Matrix   # Takes radians
projection_matrix(x::Vector) -> Matrix
reflection_matrix(U::Vector) -> Matrix
```

### Line Operations
```julia
parametric_to_implicit_line(p::Point, v::Vector) -> (Float64, Float64, Float64)
distance_to_implicit_line(a::Number, b::Number, c::Number, r::Point) -> Float64
foot_of_line(P::Point, v::Vector, R::Point) -> Tuple(Point, Float64)
```
