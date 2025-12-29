CI = get(ENV, "CI", nothing) == "true" || get(ENV, "GITHUB_TOKEN", nothing) !== nothing
using DrWatson, Documenter, Dates
using Linear_Algebra

@info "Building Documentation"
makedocs(;
    modules=[Linear_Algebra],  # Specify your module here
    sitename = "Linear_Algebra",
    # pagesonly=true excludes all markdown files not listed in pages (e.g., Linear Algebra Capacities/)
    pagesonly = true,
    # This argument is only so that the sequence of pages in the sidebar is configured
    pages = [
        "index.md",
        "Basics" => [
            "Basics/01 Vectors.md",
            "Basics/02 Linear Transformations.md",
            "Basics/03 Matrices.md",
            "Basics/04 Systems of Equations.md",
        ],
        "Geometry" => [
            "Geometry/01 Points and Coordinates.md",
            "Geometry/02 Lines.md",
            "Geometry/03 Dot Product and Orthogonality.md",
            "Geometry/04 Projections and Distance.md",
            "Geometry/05 Line Intersections.md",
            "Geometry/06 Transformations.md",
            "Geometry/07 Matrices and Maps.md",
            "Geometry/08 Linear Systems.md",
            "Geometry/09 Inverse and Kernel.md",
            "Geometry/10 3D Geometry.md",
        ],
        "sites.md"
    ],
    # Don't worry about what `CI` does in this line.
    format = Documenter.HTML(
        prettyurls = CI,
        edit_link = "main",
        assets = ["assets/custom.css"],
        inventory_version = "0.1.0",
        mathengine = Documenter.MathJax3(Dict(
            :loader => Dict("load" => ["[tex]/physics", "[tex]/ams"]),
            :tex => Dict(
                "packages" => ["base", "ams", "mathtools"],
                "inlineMath" => [["\$", "\$"]],
                "displayMath" => [["\$\$", "\$\$"], ["\\[", "\\]"]],
            ),
        )),
        footer = "Powered by [Documenter.jl](https://documenter.jl) and the [Julia Programming Language](https://julialang.org) generated on $(Dates.format(Dates.now(), "yyyy-mm-dd HH:MM:ss"))"
    ),
)

@info "Deploying Documentation"
if CI
    # Override GITHUB_REPOSITORY to match target repo for cross-repository deployment
    ENV["GITHUB_REPOSITORY"] = "FourMInfo/math_tech_study"
    deploydocs(
        # `repo` MUST be set correctly. Once your GitHub name is set
        # the auto-generated documentation will be hosted at:
        # https://study.fourm.info/linear_algebra/
        # (assuming you have enabled `gh-pages` deployment)
        repo = "github.com/FourMInfo/math_tech_study.git",
        target = "build",
        push_preview = true,
        devbranch = "main",
        dirname="linear_algebra",
    )
end

@info "Finished with Documentation"
