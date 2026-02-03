using Test

using Linear_Algebra
using GeometryBasics, LinearAlgebra

@testset "linear_algebra_basic.jl Tests" begin
    @testset "lin_ind_vec" begin
        # Test linearly independent vectors (2D)
        v1 = [1.0, 0.0]
        v2 = [0.0, 1.0]
        @test lin_ind_vec(v1, v2) == true

        # Test linearly dependent vectors (2D) - one is scalar multiple of other
        v3 = [1.0, 2.0]
        v4 = [2.0, 4.0]
        @test lin_ind_vec(v3, v4) == false

        # Test linearly independent vectors (3D)
        u1 = [1.0, 0.0, 0.0]
        u2 = [0.0, 1.0, 0.0]
        u3 = [0.0, 0.0, 1.0]
        @test lin_ind_vec(u1, u2, u3) == true

        # Test linearly dependent vectors (3D) - third vector is sum of first two
        w1 = [1.0, 0.0, 0.0]
        w2 = [0.0, 1.0, 0.0]
        w3 = [1.0, 1.0, 0.0]
        @test lin_ind_vec(w1, w2, w3) == false

        # Test single vector (always linearly independent if non-zero)
        @test lin_ind_vec([1.0, 2.0, 3.0]) == true

        # Test zero vector (linearly dependent)
        @test lin_ind_vec([0.0, 0.0]) == false

        # Test more vectors than dimensions (must be dependent)
        a1 = [1.0, 0.0]
        a2 = [0.0, 1.0]
        a3 = [1.0, 1.0]
        @test lin_ind_vec(a1, a2, a3) == false

        # Test with integer vectors
        @test lin_ind_vec([1, 0], [0, 1]) == true
        @test lin_ind_vec([1, 2], [2, 4]) == false
    end
end