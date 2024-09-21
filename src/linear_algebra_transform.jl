using Symbolics
include("./linear_algebra_basic.jl")

@variables u v
"""
    function projection_matrix_symbolic() -> Matrix
Create symbolic matrix for projection on [u, v] using E₁ = [1,0] and E₂ =[0,1] to get first and second row
"""
function projection_matrix_symbolic()
    [orthproj([u, v], [1, 0])[1] orthproj([u, v], [0, 1])[1]; orthproj([u, v], [1, 0])[2] orthproj([u, v], [0, 1])[2]]
end

function projection_matrix_symbolic_polar()
    simplify.(substitute.(projection_matrix_symbolic(),(Dict(u => cos(θ), v => sin(θ)),)))
end
"""
    function projection_matrix(x::Vector) -> Matrix
value of Matrix with an actual x  
"""
function projection_matrix(x::Vector)
    Symbolics.value.(substitute.(projection_matrix_symbolic(), (Dict(u =>x[1], v=> x[2]), )))
end
