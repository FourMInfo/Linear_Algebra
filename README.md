# Linear_Algebra

This code base is using the [Julia Language](https://julialang.org/) and
[DrWatson](https://juliadynamics.github.io/DrWatson.jl/stable/)
to make a reproducible scientific project named
> Linear_Algebra

It is authored by Aron T.

To (locally) reproduce this project, do the following:

1. Download this code base. Notice that raw data are typically not included in the
   git-history and may need to be downloaded independently.
2. Open a Julia console and do:

   ```julia
   julia> using Pkg
   julia> Pkg.add("DrWatson") # install globally, for using `quickactivate`
   julia> Pkg.activate("path/to/this/project")
   julia> Pkg.instantiate()
   ```

This will install all necessary packages for you to be able to run the scripts and
everything should work out of the box, including correctly finding local paths.

You may notice that most scripts start with the commands:

```julia
using DrWatson
@quickactivate "Linear_Algebra"
```

which auto-activate the project and enable local path handling from DrWatson.

Some documentation has been set up for this project. It can be viewed by
running the file `docs/make.jl`, and then launching the generated file
`docs/build/index.html`.
Alternatively, the documentation may be already hosted online.
If this is the case it should be at:

[https://study.fourm.info/linear_algebra/](https://study.fourm.info/linear_algebra/)
