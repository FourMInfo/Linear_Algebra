using DrWatson, Test
@quickactivate "Linear_Algebra"

# Set headless mode for CI before loading module
ENV["GKSwstype"] = "100"

# Load the Linear_Algebra package
using Linear_Algebra

# Run test suite
println("Starting tests")
ti = time()

@testset "Linear_Algebra tests" begin
    include("test_linear_algebra_basic.jl")
    include("test_linear_algebra_transform.jl")
end

ti = time() - ti
println("\nTest took total time of:")
println(round(ti/60, digits = 3), " minutes")
