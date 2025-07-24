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
using Reexport
@reexport using GeometryBasics, Plots, LinearAlgebra, RationalRoots, Symbolics

# Configure plotting for both interactive and headless environments
if haskey(ENV, "CI") || get(ENV, "GKSwstype", "") == "100"
    # CI or headless environment - use headless mode
    ENV["GKSwstype"] = "100"
    gr(show=false)
else
    # Interactive environment - normal plotting
    gr()
end

# Comprehensive exports for all functions
# Pure computational functions (no plotting dependencies)
export calculate_param_line
# Integrated plotting functions (computation + visualization)
export distance_2_points, center_of_gravity, barycentric_coord, plot_param_line
# ... matrix functions, line functions, etc.
```

### Environment-Aware Module Loading
```julia
# The module automatically detects CI vs interactive environments
if haskey(ENV, "CI") || get(ENV, "GKSwstype", "") == "100"
    ENV["GKSwstype"] = "100"  # Headless plotting
    gr(show=false)
end
```

## Linear_Algebra CI Testing Approach

The superior CI testing strategy (aligned with Math_Foundations) consists of three components:

### 1. Module-Level Headless Detection
Configure plotting environment in the main module (`Linear_Algebra.jl`) at load time:
```julia
# Automatic CI detection and headless configuration
if haskey(ENV, "CI") || get(ENV, "GKSwstype", "") == "100"
    ENV["GKSwstype"] = "100"  # Force headless mode
    gr(show=false)           # Disable plot display
end
```

### 2. Manual GKS Configuration in Tests
Set `ENV["GKSwstype"] = "100"` in test files before loading the module:
```julia
# In test files - Configure headless mode before loading module
ENV["GKSwstype"] = "100"  # Force headless plotting for CI
using DrWatson, Test
@quickactivate "Linear_Algebra"
using Linear_Algebra
```

### 3. Separated Computational/Plotting Logic with Robust Testing
- **Pure computational functions** (`calculate_*`): Test mathematical logic directly, no try-catch
- **Plotting functions** (`plot_*`): Test with try-catch fallback for CI compatibility
- **Integration testing**: Verify both computation and visualization work together

### Test Setup (Uses @quickactivate)
```julia
# Tests use DrWatson @quickactivate pattern
using DrWatson, Test
@quickactivate "Linear_Algebra"
# Load the Linear_Algebra package
using Linear_Algebra
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
18. **Comprehensive Coverage**: Test coverage includes all mathematical functions
19. **CI-Safe**: Plotting tests work in both local and headless environments
20. **Edge Cases**: Test mathematical edge cases (orthogonal vectors, zero angles, etc.)
21. **Type Testing**: Verify return types (Point2f, AbstractVector, matrices)
22. **Numerical Precision**: Use `atol=1e-10` for floating-point comparisons
23. **CI-Compatible Testing Pattern**: Separate computational logic from plotting, test math directly without try-catch, only use try-catch for visualization:
```julia
# Test computational logic directly (NO try-catch - mathematical errors should fail)
@testset "Pure Computational Tests" begin
    points = calculate_param_line(p, q, 3)
    @test length(points) == 3
    @test typeof(points) == Vector{Point2f}
    # Test mathematical correctness without plotting dependencies
end

# Test integration (plotting + computation) with CI-safe fallback
@testset "Integration Tests" begin
    try
        # Test the plotting function (includes computation + visualization)
        result = plot_param_line(p, q, 3)
        @test typeof(result) == Vector{Point2f}
        @test length(result) == 3
    catch e
        # Only catch plotting-related errors, not computational errors
        if contains(string(e), "display") || contains(string(e), "GKS") || isa(e, ArgumentError)
            @test hasmethod(plot_param_line, (Point2f, Point2f, Int64))
        else
            # Re-throw computational errors - these should fail the test
            rethrow(e)
        end
    end
end
```

### Code Organization
24. **Two-File Structure**: Basic operations in `linear_algebra_basic.jl`, matrices in `linear_algebra_transform.jl`
25. **Consistent Naming**: Functions end with descriptive suffixes (`_matrix`, `_line`, `_coord`)
26. **Symbolic Variants**: Provide `_symbolic` versions for algebraic manipulation
27. **Export Everything**: All public functions exported from main module
28. **Testing Structure**: Modular test files (`test_linear_algebra_basic.jl`, `test_linear_algebra_transform.jl`)
29. **Follow Math_Foundations Pattern**: Separate computational logic from plotting, use three-tier testing approach

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

### Julia Compilation Considerations
- **Be Patient with First Runs**: Julia often needs to precompile packages and rebuild project cache on first run. when running a Julia command in the CLI for the first time, it may take a while to precompile the packages and build the project cache, so you won't see the results of running the command for a while.
- **Typical First Run**: May take 15-30 seconds for precompilation before tests actually start
- **Example Expected Output**: `Precompiling DrWatson... 3 dependencies successfully precompiled in 17 seconds`
- **Subsequent Runs**: Much faster once cache is built
- **Don't Cancel Early**: Allow time for compilation phase to complete

### CI Considerations
- Tests automatically detect CI environment via ENV variables
- Plotting tests skip gracefully in headless mode
- 49 tests in local mode, 47 tests in CI mode (plotting tests reduced)
- Test execution time: ~15-16 seconds

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
## Documentation Patterns
- Use LaTex for all mathematical notation
- Use Markdown for explanations
- After creating or editing a markdown document always review and fix all linting issues, unless the document is a configuration file of some kind
- Follow the pattern of existing function documentation in src directory

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