"""
    lin_ind_vec(vectors::Vector{<:Number}...)

Test if the given vectors are linearly independent
"""
function lin_ind_vec(vectors::Vector{<:Number}...)
    # Create a matrix with the vectors as columns
    M = hcat(vectors...)
    # Check the rank of the matrix. The rank should be equal to the number of vectors for linear independence
    is_independent = rank(M) == size(M, 2)
    println(is_independent ? "The vectors are linearly independent." :
            "The vectors are linearly dependent.")
    # Return the boolean result
    is_independent
end

"""
    matrix_inverse(A::Matrix)

Test if the square matrix `A` is invertible and return its inverse.

A matrix is invertible if and only if ``\\det(A) \\neq 0``, equivalently if
``\\operatorname{rank}(A) = n`` where `n` is the number of rows (and columns).

Returns `inv(A)` if invertible, or `nothing` if the matrix is singular.

# Examples
```julia
A = [2.0 1.0; 1.0 -1.0]
matrix_inverse(A)  # returns the 2×2 inverse
matrix_inverse([1.0 2.0; 2.0 4.0])  # singular — returns nothing
```
"""
function matrix_inverse(A::Matrix)
    if size(A, 1) != size(A, 2)
        println("Matrix is not square and therefore not invertible.")
        return nothing
    end
    if rank(A) < size(A, 1)
        println("Matrix is SINGULAR (rank = ", rank(A), " < n = ", size(A, 1), ") — no inverse exists.")
        return nothing
    end
    Af = float.(A)
    println("Matrix is INVERTIBLE (det = ", round(det(Af); digits=10), ").")
    return inv(Af)
end

"""
    solve_linear_system(A::Matrix, b::Vector)

Diagnose and solve the linear system Ax = b.

Checks the rank of A against the augmented matrix [A b] to determine the
nature of the system before solving:
- Inconsistent (no exact solution): returns the least-squares approximation
  via `pinv(A) * b` (minimises ‖Ax - b‖); works for both square and non-square
  singular matrices. Prints the residual to confirm inexactness.
- Underdetermined (infinite solutions): returns the minimum-norm solution
  via `pinv(A) * b` (smallest ‖x‖ among all solutions).
- Unique solution: returns the exact solution via `A \\ b`.

Using `pinv` for the non-unique cases avoids the `SingularException` that
`A \\ b` throws when A is square and singular.
"""
function solve_linear_system(A::Matrix, b::Vector)
    Af = float.(A)
    bf = float.(b)
    n  = size(Af, 2)
    r_A  = rank(Af)
    r_Ab = rank([Af bf])

    if r_Ab > r_A
        println("System is INCONSISTENT — no exact solution exists.")
        println("Returning the least-squares approximation via pinv(A)*b (minimises ‖Ax - b‖):")
        x = pinv(Af) * bf
        println("Residual ‖Ax - b‖ = ", round(norm(Af * x - bf); digits=6),
                " (non-zero confirms no exact solution)")
        return x
    elseif r_A < n
        println("System is UNDERDETERMINED — infinitely many solutions exist.")
        println("Returning the minimum-norm solution via pinv(A)*b (smallest ‖x‖ among all solutions):")
        return pinv(Af) * bf
    else
        println("System has a UNIQUE solution.")
        return Af \ bf
    end
end