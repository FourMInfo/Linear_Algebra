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
    solve_linear_system(A::Matrix, b::Vector)

Diagnose and solve the linear system Ax = b.

Checks the rank of A against the augmented matrix [A b] to determine the
nature of the system before solving:
- Inconsistent (no exact solution): returns the least-squares approximation
  that minimises ‖Ax - b‖, and prints the residual to confirm inexactness.
- Underdetermined (infinite solutions): returns the minimum-norm solution
  (the unique solution with smallest ‖x‖).
- Unique solution: returns the exact solution.

In all cases Julia's backslash operator is used; the rank check supplies the
context that `\` silently omits.
"""
function solve_linear_system(A::Matrix, b::Vector)
    n = size(A, 2)
    r_A  = rank(A)
    r_Ab = rank([A b])

    if r_Ab > r_A
        println("System is INCONSISTENT — no exact solution exists.")
        println("Returning the least-squares approximation via A \\ b (minimises ‖Ax - b‖):")
        x = A \ b
        println("Residual ‖Ax - b‖ = ", round(norm(A * x - b); digits=6),
                " (non-zero confirms no exact solution)")
        return x
    elseif r_A < n
        println("System is UNDERDETERMINED — infinitely many solutions exist.")
        println("Returning the minimum-norm solution via A \\ b (smallest ‖x‖ among all solutions):")
        return A \ b
    else
        println("System has a UNIQUE solution.")
        return A \ b
    end
end