# Linear Transformations

A [linear transformation](https://mathworld.wolfram.com/LinearTransformation.html) is a rule that assigns to each vector in the plane another vector in the plane, preserving the operations of vector addition and scalar multiplication. We write $T(\mathbf{X})$ for the vector that $T$ assigns to $\mathbf{X}$, called the _image_ of $\mathbf{X}$.

## What Are Linear Transformations?

A _transformation_ of the plane maps each vector $\mathbf{X} = \lbrack x, y \rbrack^T$ to a new vector $\mathbf{X}' = \lbrack x', y' \rbrack^T$. A transformation $A$ is _linear_ if it can be expressed as:

$$\begin{cases}
x' = ax + by \\
y' = cx + dy
\end{cases}$$

for some scalars $a, b, c, d$. The symbol

$$\begin{bmatrix}
a & b \\
c & d
\end{bmatrix}$$

is called the [matrix](https://mathworld.wolfram.com/Matrix.html) of $A$, denoted $m(A)$.

### Key Examples of Linear Transformations

The following transformations are all linear:

- Projections onto lines through the origin: $m(P) = \begin{bmatrix} \frac{1}{5} & \frac{2}{5} \\ \frac{2}{5} & \frac{4}{5} \end{bmatrix}$
- Reflections through lines through the origin: $m(S) = \begin{bmatrix} -\frac{3}{5} & \frac{4}{5} \\ \frac{4}{5} & \frac{3}{5} \end{bmatrix}$
- Scalings (stretching): $m(D_r) = \begin{bmatrix} r & 0 \\ 0 & r \end{bmatrix}$
- Rotations: $m(R_\theta) = \begin{bmatrix} \cos\theta & -\sin\theta \\ \sin\theta & \cos\theta \end{bmatrix}$

## Properties of Linear Transformations

Linear transformations have several fundamental geometric properties:

### Origin Fixed

The origin is always mapped to itself. If $\mathbf{X} = \lbrack 0, 0 \rbrack^T$, then:

$$\mathbf{X}' = \begin{bmatrix} a & b \\ c & d \end{bmatrix} \begin{bmatrix} 0 \\ 0 \end{bmatrix} = \begin{bmatrix} 0 \\ 0 \end{bmatrix}$$

### Lines Map to Lines

Straight lines are preserved under linear transformations. A line through the origin remains a line through the origin; a line not through the origin maps to another line (which may or may not pass through the origin).

### Parallelism Preserved

Parallel lines remain parallel after transformation. If two lines are parallel before the transformation, their images are also parallel.

### Effect on Standard Basis

Understanding how a linear transformation acts on the [standard basis vectors](01 Points and Coordinates.md) $\mathbf{e}_1 = \lbrack 1, 0 \rbrack^T$ and $\mathbf{e}_2 = \lbrack 0, 1 \rbrack^T$ completely determines the transformation. The columns of the transformation matrix are precisely the images of these basis vectors:

$$\mathbf{a}_1 = A\mathbf{e}_1 = \begin{bmatrix} a \\ c \end{bmatrix}, \quad \mathbf{a}_2 = A\mathbf{e}_2 = \begin{bmatrix} b \\ d \end{bmatrix}$$

This means $A = \lbrack \mathbf{a}_1 \quad \mathbf{a}_2 \rbrack$.

## Scaling

[Scaling](https://mathworld.wolfram.com/Scaling.html) (also called _stretching_) multiplies each coordinate by a factor. Let $D_r$ be the transformation that sends each vector into $r$ times itself:

$$D_r(\mathbf{X}) = r\mathbf{X}$$

### Uniform Scaling Matrix

For uniform scaling by factor $r$:

$$\mathbf{v}' = \begin{bmatrix} r & 0 \\ 0 & r \end{bmatrix} \mathbf{v} = \begin{bmatrix} rv_1 \\ rv_2 \end{bmatrix}$$

### Geometric Effect

- If $\lvert r \rvert > 1$: vectors are enlarged
- If $\lvert r \rvert < 1$: vectors are shortened
- If $r < 0$: additionally, direction is reversed

### Non-Uniform Scaling

Non-uniform scaling allows different scaling factors along each axis:

$$\mathbf{v}' = \begin{bmatrix} a_{1,1} & 0 \\ 0 & a_{2,2} \end{bmatrix} \mathbf{v}$$

For example, with $a_{1,1} = \frac{1}{2}$ and $a_{2,2} = 2$, objects are compressed horizontally and stretched vertically.

### Effect on Area

Scaling affects area by a factor of $a_{1,1} \cdot a_{2,2}$. The _action ellipse_ (the image of the unit circle under the transformation) reveals this distortion—for uniform scaling it remains a circle; for non-uniform scaling it becomes an ellipse.

Scaling matrices are _diagonal matrices_, where all off-diagonal elements are zero.

## Reflection

[Reflection](https://mathworld.wolfram.com/Reflection.html) maps each vector to its mirror image about a line through the origin.

### Reflection About Coordinate Axes

Reflection about the $\mathbf{e}_1$-axis (x-axis):

$$\mathbf{v}' = \begin{bmatrix} 1 & 0 \\ 0 & -1 \end{bmatrix} \mathbf{v} = \begin{bmatrix} v_1 \\ -v_2 \end{bmatrix}$$

This changes the sign of the second component, flipping the vector vertically.

### Reflection About the Line $x_2 = x_1$

$$\mathbf{v}' = \begin{bmatrix} 0 & 1 \\ 1 & 0 \end{bmatrix} \mathbf{v} = \begin{bmatrix} v_2 \\ v_1 \end{bmatrix}$$

This interchanges the components of the input vector.

### General Reflection Formula

Given a vector $\mathbf{X}$ and a direction vector $\mathbf{U}$, the reflection $S(\mathbf{X})$ about the line along $\mathbf{U}$ is computed using the [orthogonal projection](04 Projections and Distance.md):

$$S(\mathbf{X}) = 2P_{\mathbf{U}}(\mathbf{X}) - \mathbf{X}$$

where $P_{\mathbf{U}}(\mathbf{X})$ is the projection of $\mathbf{X}$ onto $\mathbf{U}$.

```julia
function reflection(X::Vector, U::Vector)
    P = orthproj(U, X)  # Project X onto U
    2 * P - X
end

julia> X = [0, 10]
2-element Vector{Int64}:
  0
 10

julia> U = [1, 2]
2-element Vector{Int64}:
 1
 2

julia> reflection(X, U)
2-element Vector{Float64}:
 8.0
 6.0
```

### Geometric Properties

- Reflections do not change the _magnitude_ of area, but they change the _sign_ of area (orientation is reversed)
- Rotating $\mathbf{e}_1$ into $\mathbf{e}_2$ is counterclockwise; after reflection, the corresponding rotation is clockwise
- The action ellipse of any reflection is a circle

## Rotation

[Rotation](https://mathworld.wolfram.com/Rotation.html) turns vectors around the origin by a fixed angle while preserving their length.

### Rotation by 180°

The matrix

$$\mathbf{v}' = \begin{bmatrix} -1 & 0 \\ 0 & -1 \end{bmatrix} \mathbf{v}$$

rotates vectors by $180°$. Although it appears similar to a reflection, rotating $\mathbf{a}_1$ into $\mathbf{a}_2$ moves counterclockwise, confirming it is a rotation.

### Deriving the Rotation Matrix

To rotate the [standard basis](01 Points and Coordinates.md) vector $\mathbf{e}_1 = \lbrack 1, 0 \rbrack^T$ by angle $\alpha$ counterclockwise:

$$\mathbf{e}_1' = \begin{bmatrix} \cos\alpha \\ \sin\alpha \end{bmatrix}$$

Similarly, $\mathbf{e}_2$ rotates to:

$$\mathbf{e}_2' = \begin{bmatrix} -\sin\alpha \\ \cos\alpha \end{bmatrix}$$

This gives the [rotation matrix](https://mathworld.wolfram.com/RotationMatrix.html):

$$R_\alpha = \begin{bmatrix} \cos\alpha & -\sin\alpha \\ \sin\alpha & \cos\alpha \end{bmatrix}$$

### Rotation of Arbitrary Vectors

For any vector $\mathbf{X} = \lbrack x, y \rbrack^T$ with polar angle $\phi$:

$$\mathbf{X} = \lvert\mathbf{X}\rvert \begin{bmatrix} \cos\phi \\ \sin\phi \end{bmatrix}$$

After rotation by $\theta$, the new polar angle is $\phi + \theta$ (see [Polar Form](01 Points and Coordinates.md) for details), and:

$$R_\theta(\mathbf{X}) = \lvert\mathbf{X}\rvert \begin{bmatrix} \cos(\phi + \theta) \\ \sin(\phi + \theta) \end{bmatrix} = \begin{bmatrix} x\cos\theta - y\sin\theta \\ x\sin\theta + y\cos\theta \end{bmatrix}$$

### Verification via Dot Product

We can verify that $R$ rotates by angle $\alpha$ using the [geometric formula for the dot product](03 Vectors and Geometry.md#Geometric-Formula-for-the-Dot-Products):

$$\mathbf{v} \cdot \mathbf{v}' = \lVert\mathbf{v}\rVert^2 \cos\alpha$$

For $\mathbf{v}' = R_\alpha \mathbf{v}$:

$$\begin{aligned}
\mathbf{v} \cdot \mathbf{v}' &= v_1(v_1\cos\alpha - v_2\sin\alpha) + v_2(v_1\sin\alpha + v_2\cos\alpha) \\
&= v_1^2\cos\alpha - v_1 v_2\sin\alpha + v_1 v_2\sin\alpha + v_2^2\cos\alpha \\
&= (v_1^2 + v_2^2)\cos\alpha = \lVert\mathbf{v}\rVert^2 \cos\alpha
\end{aligned}$$

### Julia Implementation

```julia
function rotation(θ::Number, v::Vector)
    x′ = cos(deg2rad(θ)) * v[1] - sin(deg2rad(θ)) * v[2]
    y′ = sin(deg2rad(θ)) * v[1] + cos(deg2rad(θ)) * v[2]
    [round(x′), round(y′)]
end

julia> v = [5, 0]
2-element Vector{Int64}:
 5
 0

julia> rotation(90, v)
2-element Vector{Float64}:
 0.0
 5.0

julia> rotation(-90, v)
2-element Vector{Float64}:
  0.0
 -5.0

julia> w = rotation(45, v)
2-element Vector{Float64}:
 4.0
 4.0
```

### Rotation Properties

Rotations are _rigid body motions_—they preserve both lengths and angles. A rotation matrix is an [orthogonal matrix](https://mathworld.wolfram.com/OrthogonalMatrix.html), meaning its column vectors are _orthonormal_ (unit length and mutually perpendicular). The action ellipse of a rotation is always a circle, and rotations preserve area.

For a $45°$ rotation:

$$R_{45°} = \begin{bmatrix} \frac{\sqrt{2}}{2} & -\frac{\sqrt{2}}{2} \\ \frac{\sqrt{2}}{2} & \frac{\sqrt{2}}{2} \end{bmatrix}$$

## Shear

A [shear](https://mathworld.wolfram.com/Shear.html) transformation maps rectangles to parallelograms while preserving one coordinate axis.

### Shear Along the $\mathbf{e}_1$-Axis

The [shear matrix](https://mathworld.wolfram.com/ShearMatrix.html):

$$\mathbf{v}' = \begin{bmatrix} 1 & d_1 \\ 0 & 1 \end{bmatrix} \begin{bmatrix} v_1 \\ v_2 \end{bmatrix} = \begin{bmatrix} v_1 + v_2 d_1 \\ v_2 \end{bmatrix}$$

This shifts points horizontally by an amount proportional to their vertical position. The $v_2$-coordinate remains unchanged.

### Shear Along the $\mathbf{e}_2$-Axis

$$\mathbf{v}' = \begin{bmatrix} 1 & 0 \\ d_2 & 1 \end{bmatrix} \begin{bmatrix} v_1 \\ v_2 \end{bmatrix} = \begin{bmatrix} v_1 \\ v_1 d_2 + v_2 \end{bmatrix}$$

This shifts points vertically by an amount proportional to their horizontal position.

### Geometric Effect

The shear transformation converts a unit circle (the "Phoenix" shape) into an ellipse. For example, with $d_1 = 0.5$:

- The unit vector $\mathbf{e}_2 = \lbrack 0, 1 \rbrack^T$ maps to $\lbrack 0.5, 1 \rbrack^T$
- The shape tilts while maintaining the horizontal axis

### Special Case: Projecting onto an Axis

To find a shear that maps $\mathbf{v} = \lbrack v_1, v_2 \rbrack^T$ to $\mathbf{v}' = \lbrack v_1, 0 \rbrack^T$:

$$\mathbf{v}' = \begin{bmatrix} 1 & 0 \\ -v_2/v_1 & 1 \end{bmatrix} \begin{bmatrix} v_1 \\ v_2 \end{bmatrix}$$

### Properties

- Shears do not change areas—a rectangle and its image parallelogram have equal area (same base, same height)
- One practical application is in font design, where italic characters are created by shearing regular characters

## Projection

A [projection](https://mathworld.wolfram.com/ProjectionMatrix.html) (specifically, a parallel projection) reduces dimensionality by mapping vectors onto a subspace, like sunlight casting shadows.

### Orthogonal vs. Oblique Projection

- _Orthogonal projection_: angle of incidence with the target line is 90°
- _Oblique projection_: any other angle

Orthogonal projections are fundamental in linear algebra—they provide the _best approximation_ in a subspace (see [Projections and Distance](04 Projections and Distance.md) for details).

### Projection onto the $\mathbf{e}_1$-Axis

$$\mathbf{v}' = \begin{bmatrix} 1 & 0 \\ 0 & 0 \end{bmatrix} \mathbf{v} = \begin{bmatrix} v_1 \\ 0 \end{bmatrix}$$

This "flattens" any vector onto the x-axis by setting its $v_2$-coordinate to zero.

### General Projection Matrix

To project onto a line defined by unit vector $\mathbf{u}$, the [projection matrix](https://mathworld.wolfram.com/ProjectionMatrix.html) is:

$$A = \frac{\mathbf{u}\mathbf{u}^T}{\lVert\mathbf{u}\rVert^2}$$

This is a _dyadic matrix_ formed from the outer product of $\mathbf{u}$ with itself. The projection of $\mathbf{x}$ onto $\mathbf{u}$ is:

$$A\mathbf{x} = \frac{\mathbf{u}\mathbf{u}^T}{\lVert\mathbf{u}\rVert^2} \mathbf{x} = \frac{(\mathbf{u} \cdot \mathbf{x})}{\lVert\mathbf{u}\rVert^2} \mathbf{u}$$

This matches the projection formula from [Projections and Distance](04 Projections and Distance.md).

### Julia Implementation

```julia
function projection_matrix(u::Vector)
    u * transpose(u) ./ (transpose(u) * u)
end

julia> u = [1, 2]
2-element Vector{Int64}:
 1
 2

julia> A = projection_matrix(u)
2×2 Matrix{Float64}:
 0.2  0.4
 0.4  0.8

julia> v = [1, 2]
2-element Vector{Int64}:
 1
 2

julia> v′ = A * v
2-element Vector{Float64}:
 1.0
 2.0
```

### Idempotence

Projection matrices are _idempotent_: $A = AA$. Geometrically, once a vector is projected onto a line, applying the same projection again leaves it unchanged:

```julia
julia> A = projection_matrix([1, 2])
2×2 Matrix{Float64}:
 0.2  0.4
 0.4  0.8

julia> v = [1, 6]
2-element Vector{Int64}:
 1
 6

julia> v′ = A * v
2-element Vector{Float64}:
 2.6
 5.2

julia> A * v′
2-element Vector{Float64}:
 2.6
 5.2
```

### Properties

- Projections _reduce dimensionality_: 2D vectors map to a 1D subspace
- The action ellipse of a projection is a line segment (traversed twice)
- Projections reduce area to zero—whatever the area was before, it becomes zero after projection

## Summary of Transformations

| Transformation | Matrix Form | Preserves Length | Preserves Angle | Preserves Area | Action Ellipse |
|---------------|-------------|------------------|-----------------|----------------|----------------|
| Uniform Scaling | $\begin{bmatrix} r & 0 \\ 0 & r \end{bmatrix}$ | Only if $\lvert r \rvert = 1$ | Yes | No (factor $r^2$) | Circle |
| Non-uniform Scaling | $\begin{bmatrix} a & 0 \\ 0 & b \end{bmatrix}$ | No | No | No (factor $ab$) | Ellipse |
| Reflection | $\begin{bmatrix} 1 & 0 \\ 0 & -1 \end{bmatrix}$ | Yes | Yes | Yes (sign flips) | Circle |
| Rotation | $\begin{bmatrix} \cos\alpha & -\sin\alpha \\ \sin\alpha & \cos\alpha \end{bmatrix}$ | Yes | Yes | Yes | Circle |
| Shear | $\begin{bmatrix} 1 & d \\ 0 & 1 \end{bmatrix}$ | No | No | Yes | Ellipse |
| Projection | $\frac{\mathbf{u}\mathbf{u}^T}{\lVert\mathbf{u}\rVert^2}$ | No | No | No (becomes 0) | Line segment |

### Classification by Properties

**Rigid Body Motions** (preserve length and angle): Rotations, Reflections

**Area-Preserving**: Rotations, Reflections, Shears

**Orthogonal Matrices** (orthonormal columns): Rotations, Reflections

**Diagonal Matrices**: Uniform and non-uniform scaling

**Idempotent Matrices** ($A^2 = A$): Projections
