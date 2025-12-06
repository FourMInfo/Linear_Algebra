CI = get(ENV, "CI", nothing) == "true" || get(ENV, "GITHUB_TOKEN", nothing) !== nothing
using DrWatson, Documenter, Dates
using Linear_Algebra

@info "Building Documentation"
makedocs(;
    modules=[Linear_Algebra],  # Specify your module here
    sitename = "Linear_Algebra",
    # This argument is only so that the sequence of pages in the sidebar is configured
    # By default all markdown files in `docs/src` are expanded and included.
    pages = [
        "index.md",
        "Linear Algebra" => [
            "LinearAlgebra/01 Vectors.md",
            "LinearAlgebra/02 Lines.md",
            "LinearAlgebra/03 Linear Transformations.md",
            "LinearAlgebra/04 Matrices.md",
        ],
        "sites.md"
    ],
    # Don't worry about what `CI` does in this line.
    format = Documenter.HTML(
        prettyurls = CI,
        edit_link = "main",
        assets = ["assets/custom.css"],
        inventory_version = "0.1.0",
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
