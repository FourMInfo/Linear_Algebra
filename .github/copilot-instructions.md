# Copilot Instructions for Linear_Algebra

> **Note:** Context-specific instructions (docs, testing, source, notebooks) are in `.github/instructions/` and load automatically based on the file being edited.

## Project Overview

**Julia linear algebra study project** using a Julia workspace for reproducibility. Implements linear algebra topics (vectors, matrices, systems of equations, analytic geometry, transformations) with comprehensive testing and cross-repository documentation deployment.

### Core Architecture

- **`src/Linear_Algebra.jl`**: Main module; uses `@reexport` to re-export `GeometryBasics`, `Plots`, `LinearAlgebra`, `RationalRoots`, `Symbolics` and `LaTeXStrings` — consumers get all exported names with a single `using Linear_Algebra`
- **`src/linear_algebra_basic.jl`**: Vectors, matrices, systems of equations
- **`src/linear_algebra_geometry.jl`**: Points, lines, analytic geometry
- **`src/linear_algebra_transform.jl`**: Linear transformations
- **`test/`**: Tests using `Linear_Algebra` and `Test` only — re-exported names are available via `@reexport`, no explicit `using` needed in test files
- **`docs/`**: Documenter.jl deploying to `https://fourm.info/linear_algebra/` (cross-repo to `math_tech_study`)
- **`notebooks/`**: Jupyter notebooks for exploration (not tested in CI)

## Julia Workspace Layout

This repository uses a Julia workspace. The root `Project.toml` has a `[workspace]` table listing
member environments. Each member has its own `Project.toml` and `Manifest.toml`:

| Path | Purpose |
|---|---|
| `Project.toml` | Root package — defines `Linear_Algebra` as a library (uuid `3561693b-e867-4865-8168-321e504a4e51`) |
| `test/Project.toml` | Test-only deps (`Linear_Algebra`, `Test`) — workspace member |
| `docs/Project.toml` | Docs deps (`Documenter`, `Dates`, `LiveServer`, `Linear_Algebra`) — workspace member; uses `Pkg.develop(path=".")`. `LiveServer` is for local live preview (see the `documenter-jl-conventions` skill) |
| `notebooks/Project.toml` | Notebook superset (`IJulia`, `Revise`, `Linear_Algebra`, `LAlatex`, `BlockArrays`) — **not** a workspace member |

The `notebooks/` environment is intentionally excluded from the workspace `projects` list because
it is a developer-only interactive environment, not a dependency of any other member.

All `Manifest.toml` files are gitignored. They are regenerated locally by `Pkg.instantiate()`.
The `notebooks/Manifest.toml` requires an additional one-time step — see [Notebook Setup](#notebook-setup) below.

### Adding a New Workspace Member

If you add a new subdirectory environment (e.g. `scripts/`):
1. Create `scripts/Project.toml` with a `name`, `uuid` (generated via `uuidgen`), and `[deps]`
2. Add `"scripts"` to the `projects` list in the root `Project.toml` `[workspace]` table
3. Never hard-code UUIDs — always generate them with `uuidgen` on the command line

### Project.toml Header Convention

Every named `Project.toml` (root and workspace members that are packages) must have:

```toml
name = "PackageName"
uuid = "<output of uuidgen>"
version = "0.1.0"
```

Non-package member environments (like `test/` and `docs/`) do not need `name`/`uuid`.

## Key Workflows

### Local Development

```bash
# Run tests (uses test/ workspace member environment)
julia --project=. -e 'using Pkg; Pkg.test()'

# Build documentation (uses docs/ workspace member environment)
julia --project=docs docs/make.jl
```

**IMPORTANT**: Always run `julia --project=docs docs/make.jl` after making changes to documentation files in `docs/src/`. This allows the user to preview changes in the browser immediately without running the build manually.

### Notebook Setup

`notebooks/` is not a workspace member, so `Linear_Algebra` is not auto-resolved. After cloning (or after removing `notebooks/Manifest.toml`), run once in the notebooks directory:

```julia-repl
# Start Julia with the notebooks project
julia --project=./notebooks

# Then in the REPL Pkg mode (press ])
pkg> dev ..
pkg> instantiate
```

This creates `notebooks/Manifest.toml` (gitignored) with `path = ".."` pointing at the root package. Subsequent `julia --project=./notebooks` invocations will resolve `Linear_Algebra` from the local source.

## Git Best Practices

- **Never use `git add .`** - Always stage files explicitly by name to avoid accidentally committing development files, notebooks, or temporary files
- Use `git add <specific-file-path>` to stage only the intended files for commit
- **Feature branch naming**: Use descriptive, purpose-driven names:
  - ✅ Good: `milestone/workspace-restructure-linear-algebra-phase-4`, `fix/sidebar-center-alignment`
  - ❌ Avoid: `feature/update-content`, `fix/stuff`, `branch1`

### Pull Request Creation

- **ALWAYS check all commits on the branch first**: Run `git log main..HEAD --oneline` before writing the PR description
- **ALWAYS push changes first**: Use `git push origin BRANCH_NAME` before creating PR
- **`gh` works here** — `gh pr create --repo FourMInfo/Linear_Algebra` is the normal route (verified 2026-09-28). Always pass `--repo` explicitly; see the `phased-implementation-workflow` skill for the branch → PR → squash-merge → prune sequence
- **Fallback if `gh` is unavailable**: open the compare URL in a browser, with title and body as parameters
  ```
  https://github.com/FourMInfo/Linear_Algebra/compare/main...BRANCH_NAME?title=Your+PR+Title&body=Your+PR+Description
  ```
  Supply a separate copy-paste title and description as well, in case the URL parameters do not populate

## Communication Patterns

> **Copilot mirror.** Claude Code gets these rules from the global `~/.claude/CLAUDE.md`
> (canonical: `Dotfiles.Mac/Files/claude/CLAUDE.md`), which is the source of truth. Copilot has no
> global-instructions equivalent, so the essentials are restated here. Keep the two in step.

- No obsequiousness: no "happy to help", no praise of my work ("amazing", "awesome", "perfect", "flawless"), no emotional language
- Lay the problem out before proposing a fix, and never claim to have grasped an issue ("I see what the problem is") before that is confirmed
- Say when you need more information rather than guessing, and state any assumption you are working from
- Say immediately if you cannot read a file you were given — never substitute another file or infer its contents
- If you find yourself repeating steps, stop, explain why, and ask before repeating them
- Ask for confirmation before destructive actions or significant structural changes
