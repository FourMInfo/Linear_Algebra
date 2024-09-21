using Symbolics
include("./linear_algebra_basic.jl")

"""
    function projection_matrix_symbolic() -> Matrix
Create matrix for projection on [u, v] using E₁ = [1,0] and E₂ =[0,1]
"""
function projection_matrix_symbolic()
    [orthproj([u, v], [1, 0])[1] orthproj([u, v], [1, 0])[2]; orthproj([u, v], [0, 1])[1] orthproj([u, v], [0, 1])[2]]
end

function projection_matrix(x::Vector)
    Symbolics.value.(substitute.(projection_matrix_symbolic(), (Dict(u =>x[1], v=> x[2]), )))
end

