using GeometryBasics
using Plots
using LinearAlgebra
using RationalRoots

"""
    distance_2_points(p::Point, q::Point) -> Norm(v)
Distance between two points
"""
function distance_2_points(p::Point, q::Point)
    v = q - p
    norm(v)
end

"""
    center of gravity(p::Point, q::Point, t) → r
Creates center of gravity of points `p` and `q`using parametric equation of a line
"""
function center_of_gravity(p::Point, q::Point, t)
    v = q - p
    r = p + (t * v)
end

"""
    barycentric_coord(p::Point, q::Point, r::Point) -> t::Float64
Calculate the barycentric co-ordinate or parater of points p and q with center of gravity point r
"""
function barycentric_coord(p::Point, q::Point, r::Point)
    t = norm(r - p) / norm(q - r)
end

"""
    plot_param_line(p::Point, q::Point, n::Int64) → [Point]
Creates `n` points on a line defined by `p` and `q`, using the parametric equation of a line, then plot
"""

function plot_param_line(p::Point, q::Point, n::Int64)
    Ps = Point[]
    for i = 1:n
        t = i / n
        r = center_of_gravity(p, q, t)
        s = scatter!(r, legend=false)
        push!(Ps, r)
    end
    s = plot!(Ps, legend=false)
    display(s)
    Ps
end

"""
    vector_angle_cos(p::Vector, q::Vector) -> cos θ
Calculate cosine of angle between 2 points
"""
function vector_angle_cos(p::Vector, q::Vector)
    s = dot(p, q) / (norm(p) * norm(q))
end

"""
    is_orthogonal(p::Point, q::Point) -> bool
Check if two vectors are is_orthogonal
"""
function is_orthogonal(p::Point, q::Point)
    dot(p, q) == 0
end

"""
    function polar_unit(y::Vector) -> Vector{Float64}
Return unit vector in polar form for vector `y`
"""
function polar_unit(y::Vector)
    [(y[1] / norm(y)), (y[2] / norm(y))]
end

"""
    orthproj(v::Vector, w::Vector) -> Vector
Orthogonol projection of vector `w` onto `v`
"""
function orthproj(v::Vector, w::Vector)
    u = (dot(v, w) / dot(v, v)) * v
end

"""
    function reflection(v::Vector, w::Vector) -> Vector
The midpoint of the segment from `v` to the reflection of `v` around 'w', is the projection P from 'v'  to the line along 'w' 
"""
function reflection(v::Vector,w::Vector)
    P = orthproj(w,v)
    (2 * P) - v
end

"""
function rotation(θ::Number, v::Vector) -> Vector
    θ : degrees to rotate v
"""
function rotation(θ::Number, v::Vector)
    x′ = (cos(deg2rad(θ)) * v[1]) - (sin(deg2rad(θ)) * v[2])
    y′ = (sin(deg2rad(θ)) * v[1]) + (cos(deg2rad(θ)) * v[2])
    [x′, y′]
end

"""
    point_in_implicit_line(p::Point, q::Point, x::Point) -> Float64
The orthogonal vector α is calculated as:
    v = Vector(q - p)
    α = [v[2], -v[1]]
The implicit equation of the line is:
    α * (x -p) = 0
    a = α[1]
    b = α[2]
    c = -(a * p[1]) - (b * p[2])
Then calculate the distance of point `x` from the line using the formula:
    (a * x[1] + b * x[2] + c) / norm([a, b]
If 0 the point is in the line!
"""
function point_in_implicit_line(p::Point, q::Point, x::Point)
    a = q[2] - p[2]
    b = p[1] - q[1]
    c = -(a * p[1]) - (b * p[2])
    (a * x[1] + b * x[2] + c) / norm([a, b])
end

"""
    parametric_to_implicit_line(p::Point, v::Vector) -> Tuple{Number, Number, Number}
The parametric equation is:
    l : l(t) = p + tv
Use p and v to calculate:
    l : ax1 + bx2 + c = 0.
And return co-efficient as tuple
"""
function parametric_to_implicit_line(p::Point, v::Vector)
    a = -v[2]
    b = v[1]
    c = -(a * p[1]) - (b * p[2])
    (a, b, c)
end

"""
   implicit_to_parametric line(a::Number, b::Number, c::Number) -> Tuple(Vector, Point)
"""
function implicit_to_parametric_line(a::Number, b::Number, c::Number)
    v = [b, -a]
    if abs(a) > abs(b)
        # the linter gives error on this constructor so shut off lint.call setting
        p = Point(- c / a, 0)
    else
        p = Point(0, -c / b)
    end
    (v, p)
end

"""
    explicit_line(p::Point, q::Point) -> Tuple(Float64, Float64)
The orthogonal vector α is calculated as:
    v = Vector(q -p)
    α = [v[2], -v[1]]
The explicit equation of the line requires slope & intercept
"""
function explicit_line(p::Point, q::Point)
    a = q[2] - p[2]
    b = p[1] - q[1]
    c = -(a * p[1]) - (b * p[2])
    slope = -a / b
    intercept = -c / b
    (slope, intercept)
end

"""
   distance_to_implicit_line(a::Number, b::Number, c::Number, r::Point) -> Float64
"""
function distance_to_implicit_line(a::Number, b::Number, c::Number, r::Point)
    v = [a, b]
    d = ((a * r[1]) + (b * r[2]) + c) / norm(v)
end

"""
   implicit_line_point_normal_form(a::Number, b::Number, c::Number) -> Tuple(RationalRoot, RationalRoot, RationalRoot)
"""
function implicit_line_point_normal_form(a::Number, b::Number, c::Number)
    v = [a, b]
    â = a/RationalRoot(norm(v))
    b̂ = b/RationalRoot(norm(v))
    ĉ = c/RationalRoot(norm(v))
    (â, b̂, ĉ)
end

"""
   distance_to_pnf_implicit_line(â::RationalRoot, b̂::RationalRoot, ĉ::RationalRoot, r::Point) -> Float64
"""
function distance_to_pnf_implicit_line(â::RationalRoot, b̂::RationalRoot, ĉ::RationalRoot, r::Vector)
    d = ((â * r[1]) + (b̂ * r[2]) + ĉ)
end

"""
   distance_to_parametric_line(p::Point, v::Vector, r::Point) -> Float64
Definition of the line:
   l = p + tv
"""
function distance_to_parametric_line(p::Point, v::Vector, r::Point)
    # calculate the vector from p to r
    w = Vector(r - p)
    # calculate cos(α)
    #cosα = dot(v,w) / (norm(v) * norm(w)) previously defined as function
    cosα = vector_angle_cos(v,w)
    # distance = length of w * sin(α) which is sqrt of 1 - cos(α) squared
    d = norm(w) * sqrt(1 - (cosα ^ 2))
end

"""
function foot_of_line(P::Point, v::Vector, R::Point) -> Tuple(Point, Float64)
Definition of the line:
   l = P + tv
Return point Q on l closest to R
Calculate distance from Q to A (foot of the line)
"""
function foot_of_line(P::Point, v::Vector, R::Point,  r::Bool = false )
    # calculate the vector from P to R
    w = Vector(R - P)
    t = dot(v, w) / norm(v)^2
    # calculate foot
    Q = Point(P + t*v)
    # calculate distance
    d = dot(v, w) / norm(v)
    if r
        (round.(Q, digits = 3), round(d, digits=3))
    else
        (Q, d)
    end
end

"""
    function foot_of_line(A::Point, B::Point) -> Tuple(Point, Float64, Float64,Tuple(Point,Point,Point,Point))
Definition of the line:
   l = P + tv
where v is the vector from P to B
Using original foot_of_line and some additional calculations
Return point on l closest to A == t[1]
Return distance from t[1] to A (foot of the line) == t[2]
Return area of parallelogram defined by A and B
"""
function foot_of_line(A::Point, B::Point, r::Bool = false)
    # calculate the vector from P to A
    v = Vector(B - P)
    Z = Point{2,Int64}(0,0)
    t = foot_of_line(Z, v, A, false)
    # calculate area of parallelogram - distance * base
    a = t[2] * norm(v)
    # calculate points of Parallelogram
    w = Vector(A - P)
    PL = (Z, A, B, Point{2,Float64}(v + w))
    if r
        (round.(t[1], digits = 3), round(t[2], digits = 3), round(a, digits = 3), PL)
    else
        (t[1], t[2], a, PL)
    end
end

"""
    function intersection_2_parametric_lines(v::Vector, w::Vector, p::Point, q::Point) -> Vector
l₁ = p + tv
l₂ = q + sw
intersection: p + t̂v = q + ŝw
The solution is a system of 2 equations in two unknowns expressed in equation:
    t̂*v - ŝ*w  = q - p
"""
function intersection_2_parametric_lines(v::Vector, w::Vector, p::Point, q::Point)
    # calculate the vector of RHS of the solution equation
    b = Vector(q - p)
    # build the matrix of the LHS of the solution equation
    A = [v[1] -w[1]; v[2] -w[2]]
    # solve the system using left division of the matrix by the vector
    A\b
end

"""
    function intersection_2_implicit_lines(a₁::Number, b₁::Number, c₁::Number, a₂::Number, b₂::Number, c₂::Number) -> Vector
l₁: a₁x̂₁ + b₁x̂₂ + c₁ = 0
l₂: a₂x̂₁ + b₂x̂₂ + c₂ = 0
Solve for x̂₁ and x̂₂ which is the intersection point
"""
function intersection_2_implicit_lines(a₁::Number, b₁::Number, c₁::Number, a₂::Number, b₂::Number, c₂::Number)
    # calculate the c vector
    b = [-c₁, -c₂]
    # build the A matrix from a's and b's
    A = [a₁ b₁; a₂ b₂]
    # solve the system using left division of the matrix by the vector
    A\b
end
"""
    function rationalize(x::Number; sigdigits=16) -> Rational(Number)
Rationalize a number to a rational number
"""
function rationalize(x; sigdigits=16)
    return Int(round(x * 10^(sigdigits - 1), digits=0)) // 10^(sigdigits - 1)
end