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