# Matrices and Linear Maps

A [matrix](https://mathworld.wolfram.com/Matrix.html) is a rectangular array of numbers that represents a [linear map](https://mathworld.wolfram.com/LinearMap.html) (also called a linear transformation). This section explores how matrices encode linear transformations, how basis vectors determine matrix columns, and how matrix operations correspond to geometric operations.

## Matrices Represent Linear Maps

Every [linear transformation](https://mathworld.wolfram.com/LinearTransformation.html) in the plane can be represented by a 2×2 matrix. If $A$ is a linear transformation with matrix $\begin{bmatrix} p & q \\ r & s \end{bmatrix}$, then for any vector $\mathbf{X} = \lbrack x, y \rbrack^T$:

$$A(\mathbf{X}) = \begin{bmatrix} p & q \\ r & s \end{bmatrix} \begin{bmatrix} x \\ y \end{bmatrix} = \begin{bmatrix} px + qy \\ rx + sy \end{bmatrix}$$

This formula is fundamental: the matrix acts on a vector to produce a new vector.

### The Identity Transformation

The _identity transformation_, denoted $I$, sends every vector into itself:

$$I(\mathbf{X}) = \mathbf{X}, \quad \text{for every vector } \mathbf{X}$$

Since $I$ sends $\mathbf{X} = \lbrack x, y \rbrack^T$ into itself, the system is:

$$\begin{aligned}
x' &= x \\
y' &= y
\end{aligned}$$

The matrix of the identity transformation is:

$$m(I) = \begin{bmatrix} 1 & 0 \\ 0 & 1 \end{bmatrix}$$

### The Zero Transformation

The _zero transformation_, denoted $0$, sends every vector into the zero vector:

$$0(\mathbf{X}) = \mathbf{0}, \quad \text{for all } \mathbf{X}$$

The matrix of the zero transformation is:

$$m(0) = \begin{bmatrix} 0 & 0 \\ 0 & 0 \end{bmatrix}$$

### Origin is Always Fixed

Every linear transformation sends the origin to the origin:

$$A(\mathbf{0}) = \begin{bmatrix} a & b \\ c & d \end{bmatrix} \begin{bmatrix} 0 \\ 0 \end{bmatrix} = \begin{bmatrix} 0 \\ 0 \end{bmatrix} = \mathbf{0}$$

### Worked Example: Stretching

Let $D$ be stretching by factor 2. Then:

$$\begin{bmatrix} 2 & 0 \\ 0 & 2 \end{bmatrix} \begin{bmatrix} x \\ y \end{bmatrix} = D\begin{bmatrix} x \\ y \end{bmatrix} = \begin{bmatrix} 2x \\ 2y \end{bmatrix}$$

### Worked Example: Projection

Let $P$ be projection onto the line along $\lbrack 1, 2 \rbrack^T$. Then:

$$\begin{bmatrix} \frac{1}{5} & \frac{2}{5} \\ \frac{2}{5} & \frac{4}{5} \end{bmatrix} \begin{bmatrix} x \\ y \end{bmatrix} = P\begin{bmatrix} x \\ y \end{bmatrix} = \begin{bmatrix} \frac{1}{5}x + \frac{2}{5}y \\ \frac{2}{5}x + \frac{4}{5}y \end{bmatrix}$$

## Matrix as Image of Basis Vectors

A powerful insight is that the columns of a transformation matrix are the images of the [standard basis](https://mathworld.wolfram.com/StandardBasis.html) vectors. Recall from [Points and Coordinates](01 Points and Coordinates.md) that the standard basis vectors are $\mathbf{e}_1 = \lbrack 1, 0 \rbrack^T$ and $\mathbf{e}_2 = \lbrack 0, 1 \rbrack^T$.

If $A$ has matrix $\begin{bmatrix} a & b \\ c & d \end{bmatrix}$, then:

$$A(\mathbf{e}_1) = \begin{bmatrix} a & b \\ c & d \end{bmatrix} \begin{bmatrix} 1 \\ 0 \end{bmatrix} = \begin{bmatrix} a \\ c \end{bmatrix}$$

$$A(\mathbf{e}_2) = \begin{bmatrix} a & b \\ c & d \end{bmatrix} \begin{bmatrix} 0 \\ 1 \end{bmatrix} = \begin{bmatrix} b \\ d \end{bmatrix}$$

**Key insight**: The first column of the matrix is the image of $\mathbf{e}_1$, and the second column is the image of $\mathbf{e}_2$.

### Deriving the Projection Matrix

We can derive transformation matrices by computing what happens to the basis vectors. For orthogonal projection onto a line along vector $\lbrack u, v \rbrack$:

```julia
function projection_matrix_symbolic()
    @variables u v
    [orthproj([u, v], [1, 0])[1] orthproj([u, v], [0, 1])[1];
     orthproj([u, v], [1, 0])[2] orthproj([u, v], [0, 1])[2]]
end

julia> projection_matrix_symbolic()
2×2 Matrix{Num}:
 (u^2) / (u^2 + v^2)  (u*v) / (u^2 + v^2)
 (u*v) / (u^2 + v^2)  (v^2) / (u^2 + v^2)
```

Substituting specific values:

```julia
function projection_matrix(x::Vector)
    @variables u v
    Symbolics.value.(substitute.(projection_matrix_symbolic(), 
                                  (Dict(u => x[1], v => x[2]),)))
end

julia> x = [2, 5]
julia> P = projection_matrix(x)
2×2 Matrix{Float64}:
 0.137931  0.344828
 0.344828  0.862069

# Projecting the line onto itself returns itself
julia> P * x
2-element Vector{Float64}:
 2.0
 5.0

# Projecting another vector
julia> P * [1, 2]
2-element Vector{Float64}:
 0.8275862068965518
 2.068965517241379
```

### Projection Using Polar Coordinates

Using a unit vector $\lbrack \cos\theta, \sin\theta \rbrack$:

```julia
function projection_matrix_symbolic_polar()
    @variables u v θ
    simplify.(substitute.(projection_matrix_symbolic(),
                          (Dict(u => cos(θ), v => sin(θ)),)))
end

julia> projection_matrix_symbolic_polar()
2×2 Matrix{Num}:
       cos(θ)^2  (1//2)*sin(2θ)
 (1//2)*sin(2θ)        sin(θ)^2

function projection_matrix_polar(n::Number)
    @variables u v θ
    Symbolics.value.(substitute.(projection_matrix_symbolic_polar(), θ => deg2rad(n)))
end

julia> P = projection_matrix_polar(45)
2×2 Matrix{Float64}:
 0.5  0.5
 0.5  0.5

# Projecting onto the 45° line always gives a point on that line
julia> round.(P * [1, 2], digits = 2)
2-element Vector{Float64}:
 1.5
 1.5

julia> round.(P * [3, 7], digits = 2)
2-element Vector{Float64}:
 5.0
 5.0
```

### Deriving the Rotation Matrix

For a rotation by angle $\theta$ (see [Linear Transformations](06 Transformations.md) for the rotation formula):

```julia
function rotation_matrix_symbolic()
    @variables θ
    # Calculate for e₁ = [1, 0]
    x′ = (cos(θ) * 1) - (sin(θ) * 0)
    y′ = (sin(θ) * 1) + (cos(θ) * 0)
    # Calculate for e₂ = [0, 1]
    x′′ = (cos(θ) * 0) - (sin(θ) * 1)
    y′′ = (sin(θ) * 0) + (cos(θ) * 1)
    [x′ x′′; y′ y′′]
end

julia> rotation_matrix_symbolic()
2×2 Matrix{Num}:
 cos(θ)  -sin(θ)
 sin(θ)   cos(θ)

function rotation_matrix(d::Number)
    @variables θ
    Symbolics.value.(substitute.(rotation_matrix_symbolic(), θ => deg2rad(d)))
end

julia> R = rotation_matrix(45)
2×2 Matrix{Float64}:
 0.707107  -0.707107
 0.707107   0.707107

julia> R * [2, 5]
2-element Vector{Float64}:
 -2.121320343559642
  4.949747468305833
```

## Change of Basis

A [change of basis](https://mathworld.wolfram.com/ChangeofBasis.html) transforms coordinates from one coordinate system to another. The standard basis $\lbrack \mathbf{e}_1, \mathbf{e}_2 \rbrack$ defines the unit square, where any vector $\mathbf{v}$ is expressed as:

$$\mathbf{v} = v_1\mathbf{e}_1 + v_2\mathbf{e}_2$$

### Linear Maps as Change of Basis

A linear map transforms the standard basis to a new basis $\lbrack \mathbf{a}_1, \mathbf{a}_2 \rbrack$. The image of vector $\mathbf{v}$ becomes:

$$\mathbf{v}' = v_1\mathbf{a}_1 + v_2\mathbf{a}_2$$

This is called a _linear combination_. The transformation duplicates the geometry of the $\lbrack \mathbf{e}_1, \mathbf{e}_2 \rbrack$-system in the $\lbrack \mathbf{a}_1, \mathbf{a}_2 \rbrack$-system.

**Important observation**: The components of $\mathbf{v}'$ with respect to the standard basis are different from its components with respect to the new basis. In the $\lbrack \mathbf{a}_1, \mathbf{a}_2 \rbrack$-system, the vector $\mathbf{v}'$ has the same components as $\mathbf{v}$ had in the standard system.

### Worked Example: Change of Basis

Let the new basis be:

$$\mathbf{a}_1 = \begin{bmatrix} 2 \\ 1 \end{bmatrix}, \quad \mathbf{a}_2 = \begin{bmatrix} -2 \\ 4 \end{bmatrix}$$

For vector $\mathbf{v} = \lbrack 1/2, 1 \rbrack^T$ in the standard system:

$$\mathbf{v}' = \frac{1}{2} \times \begin{bmatrix} 2 \\ 1 \end{bmatrix} + 1 \times \begin{bmatrix} -2 \\ 4 \end{bmatrix} = \begin{bmatrix} -1 \\ 9/2 \end{bmatrix}$$

```julia
julia> a₁ = [2, 1]
julia> a₂ = [-2, 4]
julia> v = [1/2, 1]

julia> v′ = (v[1] * a₁) + (v[2] * a₂)
2-element Vector{Float64}:
 -1.0
  4.5
```

The vector $\mathbf{v}' = \lbrack -1, 4.5 \rbrack^T$ has coordinates in the standard system. But with respect to the $\lbrack \mathbf{a}_1, \mathbf{a}_2 \rbrack$-system, it has coordinates $\lbrack 1/2, 1 \rbrack^T$ — the same as the original $\mathbf{v}$.

### Transforming Basis Vectors

What happens when we transform the standard basis vectors themselves?

```julia
julia> v = [1, 0]  # This is e₁
julia> v′ = (v[1] * a₁) + (v[2] * a₂)
2-element Vector{Int64}:
 2
 1

julia> v = [0, 1]  # This is e₂
julia> v′ = (v[1] * a₁) + (v[2] * a₂)
2-element Vector{Int64}:
 -2
  4
```

This confirms that $\mathbf{e}_1 \mapsto \mathbf{a}_1$ and $\mathbf{e}_2 \mapsto \mathbf{a}_2$, illustrating why the matrix columns are the images of the basis vectors.

## Determinants

The [determinant](https://mathworld.wolfram.com/Determinant.html) measures how a linear map changes areas. A linear map takes the unit square spanned by $\lbrack \mathbf{e}_1, \mathbf{e}_2 \rbrack$ (area = 1) to a parallelogram spanned by $\lbrack \mathbf{a}_1, \mathbf{a}_2 \rbrack$.

### Computing the Determinant

For a matrix $A$ with columns $\mathbf{a}_1 = \lbrack a_{1,1}, a_{2,1} \rbrack^T$ and $\mathbf{a}_2 = \lbrack a_{1,2}, a_{2,2} \rbrack^T$:

$$\lvert A \rvert = \begin{vmatrix} a_{1,1} & a_{1,2} \\ a_{2,1} & a_{2,2} \end{vmatrix} = a_{1,1}a_{2,2} - a_{1,2}a_{2,1}$$

### Geometric Derivation

The area of a parallelogram spanned by two vectors can be found using the triangle formula. If $T$ is the area of the triangle formed by $\mathbf{a}_1$ and $\mathbf{a}_2$:

$$T = \frac{1}{2}a_{1,1}a_{2,2} - \frac{1}{2}a_{1,2}a_{2,1}$$

Since the parallelogram area $P = 2T$:

$$P = a_{1,1}a_{2,2} - a_{1,2}a_{2,1}$$

This is exactly the determinant formula.

### Geometric Interpretation of Determinant Values

The determinant characterizes how a linear map affects geometry:

- If $\lvert A \rvert = 1$: the map preserves areas
- If $0 \leq \lvert A \rvert < 1$: the map shrinks areas
- If $\lvert A \rvert = 0$: the matrix is _rank deficient_ (collapses space to a line or point)
- If $\lvert A \rvert > 1$: the map expands areas
- If $\lvert A \rvert < 0$: the map reverses orientation (in addition to any area change)

### Worked Example: Determinant Calculation

For the change of basis matrix $A = \begin{bmatrix} 2 & -2 \\ 1 & 4 \end{bmatrix}$:

$$\lvert A \rvert = (2)(4) - (-2)(1) = 8 + 2 = 10$$

This means the linear map expands areas by a factor of 10.

## Composing Linear Maps

Composing two linear transformations corresponds to [matrix multiplication](https://mathworld.wolfram.com/MatrixMultiplication.html). If we first apply transformation $A$ to get $\mathbf{v}'$, then apply transformation $B$ to get $\mathbf{v}''$:

$$\mathbf{v}' = A\mathbf{v}, \quad \mathbf{v}'' = B\mathbf{v}'$$

### Deriving the Product Matrix

Starting with:

$$\mathbf{v}' = \begin{bmatrix} a_{1,1} & a_{1,2} \\ a_{2,1} & a_{2,2} \end{bmatrix} \begin{bmatrix} v_1 \\ v_2 \end{bmatrix} = \begin{bmatrix} a_{1,1}v_1 + a_{1,2}v_2 \\ a_{2,1}v_1 + a_{2,2}v_2 \end{bmatrix}$$

Then applying $B$:

$$\mathbf{v}'' = \begin{bmatrix} b_{1,1} & b_{1,2} \\ b_{2,1} & b_{2,2} \end{bmatrix} \begin{bmatrix} a_{1,1}v_1 + a_{1,2}v_2 \\ a_{2,1}v_1 + a_{2,2}v_2 \end{bmatrix}$$

Collecting terms in $v_1$ and $v_2$:

$$\mathbf{v}'' = \begin{bmatrix} b_{1,1}a_{1,1} + b_{1,2}a_{2,1} & b_{1,1}a_{1,2} + b_{1,2}a_{2,2} \\ b_{2,1}a_{1,1} + b_{2,2}a_{2,1} & b_{2,1}a_{1,2} + b_{2,2}a_{2,2} \end{bmatrix} \begin{bmatrix} v_1 \\ v_2 \end{bmatrix}$$

The _product matrix_ $C = BA$ captures both transformations:

$$\mathbf{v}'' = B\mathbf{v}' = B(A\mathbf{v}) = BA\mathbf{v} = C\mathbf{v}$$

### Matrix Multiplication Rule

The element $c_{i,j}$ is computed as the dot product of $B$'s $i$-th row and $A$'s $j$-th column.

### Worked Example: Composing Transformations

```julia
julia> A = [-1 2; 0 3]
2×2 Matrix{Int64}:
 -1  2
  0  3

julia> B = [0 -2; -3 1]
2×2 Matrix{Int64}:
  0  -2
 -3   1

julia> v = [2, -1]

# Apply A, then B
julia> v′ = A * v
2-element Vector{Int64}:
 -4
 -3

julia> v′′ = B * v′
2-element Vector{Int64}:
 6
 9

# Same result using the product matrix
julia> C = B * A
2×2 Matrix{Int64}:
 0  -6
 3  -3

julia> C * v
2-element Vector{Int64}:
 6
 9
```

### Matrix Multiplication is Not Commutative

Unlike multiplication of real numbers, matrix multiplication is **not commutative**:

$$AB \neq BA \quad \text{(in general)}$$

This reflects that the order of applying transformations matters geometrically.

### Worked Example: Order Dependence

Consider a rotation by $-120°$ and a reflection about the $\mathbf{e}_1$-axis:

```julia
julia> A = [-0.5 0.866; -0.866 -0.5]  # Rotation by -120°
julia> B = [1 0; 0 -1]                 # Reflection about x-axis

julia> A * B  # Rotate, then reflect
2×2 Matrix{Float64}:
 -0.5    -0.866
 -0.866   0.5

julia> B * A  # Reflect, then rotate
2×2 Matrix{Float64}:
 -0.5    0.866
  0.866  0.5
```

The results are different matrices, confirming that **linear map composition is order dependent**.

## Summary

| Concept | Key Formula | Geometric Meaning |
|---------|------------|-------------------|
| Matrix-vector product | $A\mathbf{v} = \begin{bmatrix} a & b \\ c & d \end{bmatrix}\begin{bmatrix} v_1 \\ v_2 \end{bmatrix}$ | Apply transformation to vector |
| Column interpretation | Columns of $A$ are $A\mathbf{e}_1$ and $A\mathbf{e}_2$ | Where basis vectors land |
| Determinant | $\lvert A \rvert = ad - bc$ | Area scaling factor |
| Matrix product | $C = BA$ means apply $A$ then $B$ | Composition of transformations |

## See Also

- [Points and Coordinates](01 Points and Coordinates.md) — Standard basis vectors
- [Linear Transformations](06 Transformations.md) — Types of transformations (rotation, projection, reflection, scaling)
