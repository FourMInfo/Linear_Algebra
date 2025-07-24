using Test

# Configure plotting for headless CI environments BEFORE loading Linear_Algebra
ENV["GKSwstype"] = "100"  # Set GKS to use headless mode

using Linear_Algebra
using GeometryBasics, LinearAlgebra

@testset "linear_algebra_transform.jl Tests" begin
    
    @testset "Transformation Matrix Functions" begin
        # Test projection_matrix
        x = [1.0, 0.0]
        P = projection_matrix(x)
        @test size(P) == (2, 2)
        @test P * x ≈ x  # projecting onto itself should return itself
        
        # Test rotation_matrix  
        d = 90  # 90 degrees (the function takes degrees, not radians)
        R = rotation_matrix(d)
        @test size(R) == (2, 2)
        # Rotating [1,0] by 90° should give [0,1]
        v = [1.0, 0.0]
        rotated = R * v
        @test rotated ≈ [0.0, 1.0] atol=1e-10
        
        # Test stretch_matrix
        n = 2.0
        S = stretch_matrix(n)
        @test size(S) == (2, 2)
        v = [1.0, 1.0]
        stretched = S * v
        @test stretched ≈ [2.0, 2.0]  # both components scaled by n
        
        # Test reflection_matrix
        U = [1.0, 0.0]  # reflect across x-axis
        R = reflection_matrix(U)
        @test size(R) == (2, 2)
        v = [1.0, 1.0]
        reflected = R * v
        @test reflected[1] ≈ 1.0   # x-component unchanged
        @test reflected[2] ≈ -1.0  # y-component flipped
        
        # Test additional matrix functions
        # Test projection_matrix_polar
        n = 1.0
        P_polar = projection_matrix_polar(n)
        @test size(P_polar) == (2, 2)
        
        # Test projection_matrix_transpose
        u = [1.0, 0.0]
        P_transpose = projection_matrix_transpose(u)
        @test size(P_transpose) == (2, 2)
        
        # Test rotation_matrix_ns (non-symbolic)
        θ = π/4  # 45 degrees
        R_ns = rotation_matrix_ns(θ)
        @test size(R_ns) == (2, 2)
        
        # Test reflection_matrix_rational
        U_rational = [1.0, 1.0]
        R_rational = reflection_matrix_rational(U_rational)
        @test size(R_rational) == (2, 2)
    end
    
    @testset "Symbolic Matrix Functions" begin
        # Test symbolic matrix functions (should return symbolic expressions)
        P_sym = projection_matrix_symbolic()
        @test size(P_sym) == (2, 2)
        
        P_sym_polar = projection_matrix_symbolic_polar()
        @test size(P_sym_polar) == (2, 2)
        
        R_sym = rotation_matrix_symbolic()
        @test size(R_sym) == (2, 2)
        
        S_sym = stretch_matrix_symbolic()
        @test size(S_sym) == (2, 2)
        
        Refl_sym = reflection_matrix_symbolic()
        @test size(Refl_sym) == (2, 2)
    end
    
    @testset "Matrix Mathematical Properties" begin
        # Test mathematical properties of transformation matrices
        
        # Rotation matrix should be orthogonal (R^T * R = I)
        d = 45  # 45 degrees
        R = rotation_matrix(d)
        I_approx = R' * R
        @test I_approx ≈ [1.0 0.0; 0.0 1.0] atol=1e-10
        
        # Projection matrix should be idempotent (P^2 = P)
        x = [1.0, 1.0]
        P = projection_matrix(x)
        P_squared = P * P
        @test P_squared ≈ P atol=1e-10
        
        # Reflection matrix should be its own inverse (R^2 = I)
        U = [1.0, 0.0]
        Refl = reflection_matrix(U)
        Refl_squared = Refl * Refl
        @test Refl_squared ≈ [1.0 0.0; 0.0 1.0] atol=1e-10
        
        # Stretch matrix should scale uniformly
        n = 3.0
        S = stretch_matrix(n)
        v = [1.0, 1.0]
        scaled = S * v
        @test norm(scaled) ≈ n * norm(v) atol=1e-10
    end
    
    @testset "Edge Cases and Special Values" begin
        # Test rotation by 0 degrees (should be identity)
        R_zero = rotation_matrix(0)
        @test R_zero ≈ [1.0 0.0; 0.0 1.0] atol=1e-10
        
        # Test rotation by 180 degrees
        R_180 = rotation_matrix(180)
        v = [1.0, 0.0]
        rotated_180 = R_180 * v
        @test rotated_180 ≈ [-1.0, 0.0] atol=1e-10
        
        # Test stretch by 1 (should be identity)
        S_one = stretch_matrix(1.0)
        @test S_one ≈ [1.0 0.0; 0.0 1.0] atol=1e-10
        
        # Test projection onto unit vector
        unit_x = [1.0, 0.0]
        P_unit = projection_matrix(unit_x)
        test_vector = [3.0, 4.0]
        projected = P_unit * test_vector
        @test projected ≈ [3.0, 0.0] atol=1e-10  # Should project onto x-axis
    end
end
