using Symbolics
include("./linear_algebra_basic.jl")

"""
    function projection_matrix_symbolic() -> Matrix
Create symbolic matrix for projection on [u, v] using E₁ = [1,0] and E₂ =[0,1] to get first and second row
"""
function projection_matrix_symbolic()
    @variables u v
#    [orthproj([u, v], [1, 0])[1] orthproj([u, v], [0, 1])[1]; orthproj([u, v], [1, 0])[2] orthproj([u, v], [0, 1])[2]]
    [permutedims(orthproj([u,v], [1,0])); permutedims(orthproj([u,v], [0,1]))]
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
    @variables u v
    Symbolics.value.(substitute.(projection_matrix_symbolic(), (Dict(u =>x[1], v=> x[2]), )))
end
"""
    function projection_matrix_polar(θ::Number) -> Matrix
value of projection polar matrix with an actual value for the angle of the vector
"""
function projection_matrix_polar(n::Number)
    @variables u v θ
    Symbolics.value.(substitute.(projection_matrix_symbolic_polar(), θ => deg2rad(n),))
end

"""
    function rotation_matrix_symbolic() -> Matrix
Create symbolic matrix for rotation θ degrees,  using E₁ = [1,0] and E₂ =[0,1] to get first and second column
"""
function rotation_matrix_symbolic()
    @variables θ
    # calculate for e₁ = [1, 0]
    x′ = (cos(θ) * 1) - (sin(θ) * 0)
    y′ = (sin(θ) * 1) + (cos(θ) * 0)
    # calculate for e₂ = [0, 1]
    x′′ = (cos(θ) * 0) - (sin(θ) * 1)
    y′′ = (sin(θ) * 0) + (cos(θ) * 1)
    [x′ x′′; y′ y′′]  
end

"""
    function rotation_matrix(d::Number) -> Matrix
value of rotation Matrix with an actual value for the rotation angle
"""
function rotation_matrix(d::Number)
    @variables θ
    Symbolics.value.(substitute.(rotation_matrix_symbolic(), θ => deg2rad(d),))
end

"""
    function rotation_matrix_ns(θ::Number) -> Matrix
value of rotation Matrix with an actual value for the rotation angle - non symbolic version
"""
function rotation_matrix_ns(θ::Number)
    [rotation(θ, e₁) rotation(θ, e₂)]
end

"""
    function stretch_matrix_symbolic() -> Matrix
Create symbolic matrix for stretch λ₁, using E₁ = [1,0] and E₂ =[0,1] to get first and second column
"""
function stretch_matrix_symbolic()
    @variables λ₁
    [permutedims(λ₁ * [1,0]); permutedims(λ₁ * [0,1])]
end
"""
    function stretch_matrix_symbolic(n::Number) -> Matrix
value of stretch Matrix with an actual value for the stretch factor
"""
function stretch_matrix(n::Number)
    @variables λ₁
    Symbolics.value.(substitute.(stretch_matrix_symbolic(), λ₁ => n))
end
"""
    function reflection_matrix_symbolic() -> Matrix
Create symbolic matrix for reflection on [u, v] using E₁ = [1,0] and E₂ =[0,1] to get first and second colomn
"""
function reflection_matrix_symbolic()
    @variables u v
    simplify.([permutedims(reflection([1,0],[u,v])); permutedims(reflection([0,1], [u,v]))])
end
"""
    function reflection_matrix(U::Vector) -> Matrix
value of reflection Matrix with an actual vector U
"""        
function reflection_matrix(U::Vector)
    @variables u v
    Symbolics.value.(substitute.(reflection_matrix_symbolic(), (Dict(u => U[1], v => U[2]), )))
end
"""
    function reflection_matrix_rational(U::Vector) -> Matrix
value of reflection Matrix with an actual vector U in rational form
"""
function reflection_matrix_rational(U::Vector)
    rationalize.(reflection_matrix(U))
end
