# Copilot Instructions for Linear_Algebra

## Project Architecture

This is a **Julia linear algebra computing project** using DrWatson for reproducibility, focused on geometric transformations and linear algebra operations with visualization capabilities. The codebase follows a **modular mathematical library pattern** with comprehensive testing and documentation.

### Core Components

- **`src/Linear_Algebra.jl`**: Main module with exports for basic operations and transformation matrices
- **`src/linear_algebra_basic.jl`**: Core linear algebra functions (distances, projections, line operations, intersections)
- **`src/linear_algebra_transform.jl`**: Matrix transformations (projection, rotation, stretch, reflection matrices)
- **`test/`**: Comprehensive test suite with CI-compatible plotting tests (49 total tests)
- **`docs/`**: Documenter.jl setup with cross-repository deployment to math_tech_study

## Critical Development Patterns

### Module Structure
```julia
# Main module uses @reexport for clean interface
@reexport using GeometryBasics, Plots, LinearAlgebra, RationalRoots, Symbolics
# Comprehensive exports for all functions
export distance_2_points, center_of_gravity, barycentric_coord, plot_param_line
# ... matrix functions, line functions, etc.
```

### Test Setup (Uses @quickactivate)
```julia
# Tests use DrWatson @quickactivate pattern
using DrWatson, Test
@quickactivate "Linear_Algebra"
using Linear_Algebra
using GeometryBasics, LinearAlgebra
```

### CI-Compatible Plotting Pattern
```julia
# Environment detection for plotting tests
if get(ENV, "CI", "false") == "true" || get(ENV, "GITHUB_ACTIONS", "false") == "true"
    # In CI, just test that the function exists
    @test hasmethod(plot_param_line, (typeof(p), typeof(q), Int64))
else
    # Local testing - allow plotting but capture any display issues
    try
        points = plot_param_line(p, q, 3)
        # ... test plotting results
    catch e
        # Graceful fallback for plotting failures
        @test hasmethod(plot_param_line, (typeof(p), typeof(q), Int64))
    end
end
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
8. **Basic Operations**: Distance, center of gravity, barycentric coordinates
9. **Vector Operations**: Angle calculations, orthogonality, projections, reflections
10. **Line Geometry**: Parametric/implicit conversions, distance calculations, intersections
11. **Matrix Transformations**: Projection, rotation, stretch, reflection matrices
12. **Symbolic Functions**: Provide both symbolic and numeric versions

### Documentation & Comments
13. Include detailed comments explaining geometric concepts
14. Use clear variable names (e.g., `p1`, `p2` for points, `v`, `w` for vectors)
15. Document angle conventions (degrees vs radians) in function comments
16. Explain mathematical formulas in comments
17. Maintain consistency with mathematical notation

### Testing Patterns
18. **Comprehensive Coverage**: 49 tests covering ~100% of functions
19. **CI-Safe**: Plotting tests skip in headless environments
20. **Edge Cases**: Test mathematical edge cases (orthogonal vectors, zero angles, etc.)
21. **Type Testing**: Verify return types (Point2f, AbstractVector, matrices)
22. **Numerical Precision**: Use `atol=1e-10` for floating-point comparisons
23. **Error Handling**: Use try-catch for functions that might fail in CI

### Code Organization
24. **Two-File Structure**: Basic operations in `linear_algebra_basic.jl`, matrices in `linear_algebra_transform.jl`
25. **Consistent Naming**: Functions end with descriptive suffixes (`_matrix`, `_line`, `_coord`)
26. **Symbolic Variants**: Provide `_symbolic` versions for algebraic manipulation
27. **Export Everything**: All public functions exported from main module

## Dependencies & Performance

**Main Dependencies**: GeometryBasics, Plots, LinearAlgebra, RationalRoots, Symbolics
**Test Dependencies**: DrWatson, Test, GeometryBasics, LinearAlgebra

### Mathematical Libraries Used
- **GeometryBasics.jl**: For Point2f types and geometric primitives
- **LinearAlgebra.jl**: For `norm()`, `dot()`, matrix operations
- **Symbolics.jl**: For `@variables` in symbolic matrix functions
  - Pattern: `@variables θ`, `@variables λ₁` for symbolic parameters
  - Use `Symbolics.value.(substitute.(expr, var => value))` for evaluation
- **Plots.jl**: For visualization functions (`scatter!`, `plot!`, `display`)
- **RationalRoots.jl**: For rational approximations

## Key Workflows

### Running Tests Locally
```bash
julia --project=. test/runtests.jl
```

### Running Tests in CI Mode
```bash
CI=true julia --project=. test/runtests.jl
```

### Building Documentation
```bash
julia --project=. docs/make.jl
```

### CI Considerations
- Tests automatically detect CI environment via ENV variables
- Plotting tests skip gracefully in headless mode
- 49 tests in local mode, 47 tests in CI mode (plotting tests reduced)
- Test execution time: ~15-16 seconds

## Git Best Practices

- **Never use `git add .`** - Always stage files explicitly by name to avoid accidentally committing development files, notebooks, or temporary files
- Use `git add <specific-file-path>` to stage only the intended files for commit
- Feature branch naming: Use descriptive names like `add-tests-fix-notebook`

### Pull Request Creation
- **ALWAYS push changes first**: Use `git push origin BRANCH_NAME` before creating PR
- **Do NOT use `gh pr create`** - The GitHub CLI command doesn't work properly in this environment
- **Use GitHub web interface instead**: Create PR links manually with detailed descriptions
- **PR Link Format**: `https://github.com/FourMInfo/Linear_Algebra/compare/main...BRANCH_NAME`
- **Include comprehensive descriptions**: Detail all changes, test coverage, and architectural improvements
- **Reference issue numbers**: Link to related issues when applicable

## Azure Integration

- Use Azure Best Practices: When generating code for Azure, running terminal commands for Azure, or performing operations related to Azure, invoke your `azure_development-get_best_practices` tool if available

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

### Test Organization
- **Grouped by Category**: Basic functions, transformation matrices, line geometry, advanced functions
- **CI Compatibility**: Plotting tests with environment detection
- **Comprehensive Coverage**: Test both happy path and edge cases
- **Type Validation**: Verify return types match expectations

### Documentation Structure
- **Cross-Repository Deployment**: Deploys to math_tech_study repository
- **Subdirectory Pattern**: Available at study.fourm.info/linear_algebra/
- **Auto-docs Integration**: Uses `@autodocs` for automatic function documentation
- **Mathematical Notation**: Supports LaTeX rendering in documentation

## Function Signature Patterns

### Basic Linear Algebra
```julia
distance_2_points(p::Point, q::Point) -> Float64
center_of_gravity(p::Point, q::Point, t) -> Point
vector_angle_cos(p::Vector, q::Vector) -> Float64
orthproj(v::Vector, w::Vector) -> Vector
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
