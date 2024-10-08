CI = get(ENV, "CI", nothing) == "true" || get(ENV, "GITHUB_TOKEN", nothing) !== nothing
using DrWatson
@quickactivate "Linear_Algebra"
using Documenter

# Here you may include files from the source directory
include(srcdir("dummy_src_file.jl"))

@info "Building Documentation"
makedocs(;
    sitename = "Linear_Algebra",
    # This argument is only so that the sequence of pages in the sidebar is configured
    # By default all markdown files in `docs/src` are expanded and included.
    pages = [
        "index.md",
    ],
    # Don't worry about what `CI` does in this line.
    format = Documenter.HTML(prettyurls = CI),
)

@info "Deploying Documentation"
if CI
    deploydocs(
        # `repo` MUST be set correctly. Once your GitHub name is set
        # the auto-generated documentation will be hosted at:
        # https://ArontTLV.github.io/Linear_Algebra/dev/
        # (assuming you have enabled `gh-pages` deployment)
        repo = "github.com/ArontTLV/Linear_Algebra.git",
        target = "build",
        push_preview = true,
        devbranch = "main",
    )
end

@info "Finished with Documentation"
