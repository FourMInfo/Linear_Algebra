using Symbolics
include("./linear_algebra_basic.jl")

"""
    function projection_matrix_symbolic() -> Matrix
Create symbolic matrix for projection on [u, v] using E₁ = [1,0] and E₂ =[0,1] to get first and second row
"""
function projection_matrix_symbolic()
    @variables u v
    [orthproj([u, v], [1, 0])[1] orthproj([u, v], [0, 1])[1]; orthproj([u, v], [1, 0])[2] orthproj([u, v], [0, 1])[2]]
end
"""
    function projection_matrix_symbolic_polar() -> Matrix
Create symbolic matrix for projection on [cos θ, sin θ] 
"""
function projection_matrix_symbolic_polar()
    @variables u v θ
    simplify.(substitute.(projection_matrix_symbolic(),(Dict(u => cos(θ), v => sin(θ)),)))
end
"""
    function projection_matrix(x::Vector) -> Matrix
value of Matrix with an actual vector x  
"""
function projection_matrix(x::Vector)
    Symbolics.value.(substitute.(projection_matrix_symbolic(), (Dict(u =>x[1], v=> x[2]), )))
end
"""
    function projection_matrix_polar(θ::Number) -> Matrix
value of Matrix with an actual value for the angle of the vector
"""
function projection_matrix_polar(n::Number)
    Symbolics.value.(substitute.(projection_matrix_symbolic_polar(), θ => deg2rad(n),))
end
