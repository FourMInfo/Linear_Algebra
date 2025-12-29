# 3D Geometry

This section extends fundamental geometric concepts from two dimensions to [three-dimensional space](https://mathworld.wolfram.com/CartesianCoordinates.html). The transition from 2D to 3D introduces an additional coordinate axis while preserving the core operations of vector algebra and point geometry.

## Extension from 2D to 3D

### The Third Dimension

Moving from 2D to 3D geometry requires a coordinate system with one additional dimension. The [Cartesian coordinate system](https://mathworld.wolfram.com/CartesianCoordinates.html) in three dimensions consists of three mutually perpendicular axes, typically labeled the x-axis, y-axis, and z-axis.

The **standard basis** in 3D, denoted $\lbrack\mathbf{e}_1, \mathbf{e}_2, \mathbf{e}_3\rbrack$, consists of the unit vectors:

$$\mathbf{e}_1 = \begin{bmatrix} 1 \\ 0 \\ 0 \end{bmatrix}, \quad \mathbf{e}_2 = \begin{bmatrix} 0 \\ 1 \\ 0 \end{bmatrix}, \quad \mathbf{e}_3 = \begin{bmatrix} 0 \\ 0 \\ 1 \end{bmatrix}$$

This extends the 2D standard basis (see [Vectors](../Basics/01 Vectors.md)) by adding a third perpendicular direction.

### What Changes in 3D

While the fundamental operations remain the same, 3D geometry introduces:

- **One more component**: Vectors and points have three components instead of two
- **New operations**: The [cross product](https://mathworld.wolfram.com/CrossProduct.html) is defined only in 3D
- **New geometric objects**: [Planes](https://mathworld.wolfram.com/Plane.html) replace lines as the fundamental 2D subspace
- **Richer transformations**: Rotations can occur about any axis, not just the origin

## Points in 3D Space

### Point Representation

A [point](https://mathworld.wolfram.com/Point.html) in 3D is a reference to a location, represented by three coordinates:

$$\mathbf{p} = \begin{bmatrix} p_1 \\ p_2 \\ p_3 \end{bmatrix}$$

The coordinates $(p_1, p_2, p_3)$ indicate the point's location along each axis in the $\lbrack\mathbf{e}_1, \mathbf{e}_2, \mathbf{e}_3\rbrack$-system. A point $\mathbf{p}$ is said to live in 3D [Euclidean space](https://mathworld.wolfram.com/EuclideanSpace.html), written as $\mathbf{p} \in \mathbb{E}^3$.

The **origin** in 3D is:

$$\mathbf{o} = \begin{bmatrix} 0 \\ 0 \\ 0 \end{bmatrix}$$

### Barycentric Combinations in 3D

All rules for combining points in 2D carry over to 3D. The fundamental operation for points, the _[barycentric combination](https://mathworld.wolfram.com/BarycentricCoordinates.html)_ (see [Points and Coordinates](01 Points and Coordinates.md)), looks identical in 3D:

$$\mathbf{r} = (1-t)\mathbf{p} + t\mathbf{q}$$

where now $\mathbf{p}, \mathbf{q}, \mathbf{r} \in \mathbb{E}^3$. The scalar values $(1-t)$ and $t$ are the _barycentric coordinates_ of $\mathbf{r}$ with respect to $\mathbf{p}$ and $\mathbf{q}$.

**Worked Example:** Find the midpoint between $\mathbf{p} = \lbrack 1, 2, 3 \rbrack^T$ and $\mathbf{q} = \lbrack 5, 4, 1 \rbrack^T$.

Setting $t = 0.5$:

$$\begin{aligned}
\mathbf{r} &= (1-0.5)\begin{bmatrix} 1 \\ 2 \\ 3 \end{bmatrix} + 0.5\begin{bmatrix} 5 \\ 4 \\ 1 \end{bmatrix} \\
&= \begin{bmatrix} 0.5 \\ 1 \\ 1.5 \end{bmatrix} + \begin{bmatrix} 2.5 \\ 2 \\ 0.5 \end{bmatrix} = \begin{bmatrix} 3 \\ 3 \\ 2 \end{bmatrix}
\end{aligned}$$

## Vectors in 3D Space

### Vector Representation

A [vector](https://mathworld.wolfram.com/Vector.html) in 3D is given as:

$$\mathbf{v} = \begin{bmatrix} v_1 \\ v_2 \\ v_3 \end{bmatrix}$$

The three _components_ of $\mathbf{v}$ indicate the displacement along each axis in the coordinate system. A 3D vector $\mathbf{v}$ is said to live in 3D space, or $\mathbb{R}^3$, written as $\mathbf{v} \in \mathbb{R}^3$.

The **3D zero vector** is:

$$\mathbf{0} = \begin{bmatrix} 0 \\ 0 \\ 0 \end{bmatrix}$$

### Points vs Vectors in 3D

The distinction between points and vectors (see [Points and Coordinates](01 Points and Coordinates.md)) remains in 3D:

- **Points** ($\mathbf{p} \in \mathbb{E}^3$): Reference locations in space
- **Vectors** ($\mathbf{v} \in \mathbb{R}^3$): Represent displacement, direction, and magnitude

The relationship between them: if $\mathbf{p}$ is a point and $\mathbf{v}$ is a vector, then $\mathbf{q} = \mathbf{p} + \mathbf{v}$ gives another point.

## Linear Combinations in 3D

### Definition

The [linear combination](https://mathworld.wolfram.com/LinearCombination.html) operation for vectors extends naturally to 3D:

$$\mathbf{u} = r\mathbf{v} + s\mathbf{w}$$

where $\mathbf{v}, \mathbf{w}, \mathbf{u} \in \mathbb{R}^3$ and $r, s$ are scalars. This operation provides the tools to create new geometry in terms of existing geometry while ensuring coordinate-independent operations.

### Vector Length in 3D

The length or [Euclidean norm](https://mathworld.wolfram.com/L2-Norm.html) of a 3D vector $\mathbf{v}$, denoted $\lVert\mathbf{v}\rVert$, is derived by applying the Pythagorean theorem twice:

$$\lVert\mathbf{v}\rVert = \sqrt{v_1^2 + v_2^2 + v_3^2}$$

**Derivation:** Consider the vector $\mathbf{v} = \lbrack v_1, v_2, v_3 \rbrack^T$. First, find the distance in the xy-plane: $d_{xy} = \sqrt{v_1^2 + v_2^2}$. This becomes one leg of a new right triangle with $v_3$ as the other leg:

$$\lVert\mathbf{v}\rVert = \sqrt{d_{xy}^2 + v_3^2} = \sqrt{v_1^2 + v_2^2 + v_3^2}$$

The _length_ or _magnitude_ of a 3D vector can be interpreted as distance, speed, or force.

### Properties of Vector Length

- Scaling a vector by an amount $k$ yields: $\lVert k\mathbf{v}\rVert = \lvert k \rvert \lVert\mathbf{v}\rVert$
- A [unit vector](https://mathworld.wolfram.com/UnitVector.html) has length 1: $\lVert\hat{\mathbf{v}}\rVert = 1$
- To normalize a vector: $\hat{\mathbf{v}} = \frac{\mathbf{v}}{\lVert\mathbf{v}\rVert}$

**Worked Example:** Find the length and unit vector for $\mathbf{v} = \lbrack 3, 4, 12 \rbrack^T$.

$$\lVert\mathbf{v}\rVert = \sqrt{3^2 + 4^2 + 12^2} = \sqrt{9 + 16 + 144} = \sqrt{169} = 13$$

$$\hat{\mathbf{v}} = \frac{1}{13}\begin{bmatrix} 3 \\ 4 \\ 12 \end{bmatrix} = \begin{bmatrix} 3/13 \\ 4/13 \\ 12/13 \end{bmatrix}$$

### Dot Product in 3D

The [dot product](https://mathworld.wolfram.com/DotProduct.html) extends naturally to 3D:

$$\mathbf{u} \cdot \mathbf{v} = u_1v_1 + u_2v_2 + u_3v_3$$

All properties from 2D carry over (see [Dot Product and Orthogonality](03 Dot Product and Orthogonality.md)):

- Commutative: $\mathbf{u} \cdot \mathbf{v} = \mathbf{v} \cdot \mathbf{u}$
- Relationship to length: $\mathbf{v} \cdot \mathbf{v} = \lVert\mathbf{v}\rVert^2$
- Angle between vectors: $\cos\theta = \frac{\mathbf{u} \cdot \mathbf{v}}{\lVert\mathbf{u}\rVert \lVert\mathbf{v}\rVert}$
- Orthogonality: $\mathbf{u} \perp \mathbf{v} \Leftrightarrow \mathbf{u} \cdot \mathbf{v} = 0$

## Cross Product

The [cross product](https://mathworld.wolfram.com/CrossProduct.html) is a vector operation that exists only in 3D. Unlike the dot product (which returns a scalar), the cross product of two vectors produces another vector.

### Definition

For vectors $\mathbf{u} = \lbrack u_1, u_2, u_3 \rbrack^T$ and $\mathbf{v} = \lbrack v_1, v_2, v_3 \rbrack^T$, the cross product is:

$$\mathbf{u} \times \mathbf{v} = \begin{bmatrix} u_2v_3 - u_3v_2 \\ u_3v_1 - u_1v_3 \\ u_1v_2 - u_2v_1 \end{bmatrix}$$

This can be written using determinant notation:

$$\mathbf{u} \times \mathbf{v} = \begin{vmatrix} \mathbf{e}_1 & \mathbf{e}_2 & \mathbf{e}_3 \\ u_1 & u_2 & u_3 \\ v_1 & v_2 & v_3 \end{vmatrix}$$

### Properties

- **Perpendicularity**: $\mathbf{u} \times \mathbf{v}$ is perpendicular to both $\mathbf{u}$ and $\mathbf{v}$
- **Anti-commutative**: $\mathbf{u} \times \mathbf{v} = -(\mathbf{v} \times \mathbf{u})$
- **Distributive**: $\mathbf{u} \times (\mathbf{v} + \mathbf{w}) = \mathbf{u} \times \mathbf{v} + \mathbf{u} \times \mathbf{w}$
- **Scalar multiplication**: $(c\mathbf{u}) \times \mathbf{v} = c(\mathbf{u} \times \mathbf{v})$
- **Self cross product**: $\mathbf{v} \times \mathbf{v} = \mathbf{0}$

### Magnitude and the Right-Hand Rule

The magnitude of the cross product is:

$$\lVert\mathbf{u} \times \mathbf{v}\rVert = \lVert\mathbf{u}\rVert \lVert\mathbf{v}\rVert \sin\theta$$

where $\theta$ is the angle between the vectors. The direction follows the [right-hand rule](https://mathworld.wolfram.com/Right-HandRule.html): point fingers of your right hand along $\mathbf{u}$, curl them toward $\mathbf{v}$, and your thumb points in the direction of $\mathbf{u} \times \mathbf{v}$.

### Standard Basis Cross Products

The cross products of the standard basis vectors are:

$$\mathbf{e}_1 \times \mathbf{e}_2 = \mathbf{e}_3, \quad \mathbf{e}_2 \times \mathbf{e}_3 = \mathbf{e}_1, \quad \mathbf{e}_3 \times \mathbf{e}_1 = \mathbf{e}_2$$

### Geometric Interpretation: Area

The magnitude of the cross product equals the area of the parallelogram formed by the two vectors:

$$\text{Area} = \lVert\mathbf{u} \times \mathbf{v}\rVert$$

This connects to the 2D formula for parallelogram area (see the determinant formula $\lvert ad - bc \rvert$ for 2D vectors).

**Worked Example:** Find the cross product of $\mathbf{u} = \lbrack 1, 2, 3 \rbrack^T$ and $\mathbf{v} = \lbrack 4, 5, 6 \rbrack^T$.

$$\begin{aligned}
\mathbf{u} \times \mathbf{v} &= \begin{bmatrix} (2)(6) - (3)(5) \\ (3)(4) - (1)(6) \\ (1)(5) - (2)(4) \end{bmatrix} \\
&= \begin{bmatrix} 12 - 15 \\ 12 - 6 \\ 5 - 8 \end{bmatrix} = \begin{bmatrix} -3 \\ 6 \\ -3 \end{bmatrix}
\end{aligned}$$

Verify perpendicularity:
- $\mathbf{u} \cdot (\mathbf{u} \times \mathbf{v}) = (1)(-3) + (2)(6) + (3)(-3) = -3 + 12 - 9 = 0$ ✓
- $\mathbf{v} \cdot (\mathbf{u} \times \mathbf{v}) = (4)(-3) + (5)(6) + (6)(-3) = -12 + 30 - 18 = 0$ ✓

## Planes

A [plane](https://mathworld.wolfram.com/Plane.html) in 3D is a two-dimensional surface that extends infinitely. It is the 3D analog of a line in 2D—while a line divides 2D space into two half-planes, a plane divides 3D space into two half-spaces.

### Normal Vector Form

A plane can be defined by a point $\mathbf{p}_0$ on the plane and a [normal vector](https://mathworld.wolfram.com/NormalVector.html) $\mathbf{n}$ perpendicular to the plane. A point $\mathbf{p}$ lies on the plane if and only if:

$$\mathbf{n} \cdot (\mathbf{p} - \mathbf{p}_0) = 0$$

### General Equation

Expanding the normal form gives the **general equation of a plane**:

$$ax + by + cz + d = 0$$

where $\mathbf{n} = \lbrack a, b, c \rbrack^T$ is the normal vector and:

$$d = -(ax_0 + by_0 + cz_0)$$

### Point-to-Plane Distance

The distance from a point $\mathbf{q} = (x_0, y_0, z_0)$ to the plane $ax + by + cz + d = 0$ is:

$$D = \frac{\lvert ax_0 + by_0 + cz_0 + d \rvert}{\sqrt{a^2 + b^2 + c^2}}$$

This generalizes the point-to-line distance formula from 2D (see [Lines](02 Lines.md)).

### Parametric Form

A plane through point $\mathbf{p}_0$ with direction vectors $\mathbf{v}$ and $\mathbf{w}$ (not parallel) is:

$$\mathbf{p}(s, t) = \mathbf{p}_0 + s\mathbf{v} + t\mathbf{w}$$

where $s, t \in \mathbb{R}$. This is analogous to the parametric equation of a line, but with two parameters instead of one.

### Finding the Normal from Two Vectors

Given two non-parallel vectors $\mathbf{v}$ and $\mathbf{w}$ in the plane, the normal vector is:

$$\mathbf{n} = \mathbf{v} \times \mathbf{w}$$

This is a key application of the cross product.

**Worked Example:** Find the equation of the plane through $\mathbf{p}_0 = (1, 2, 3)$ containing the vectors $\mathbf{v} = \lbrack 1, 0, 1 \rbrack^T$ and $\mathbf{w} = \lbrack 0, 1, 1 \rbrack^T$.

First, find the normal:

$$\mathbf{n} = \mathbf{v} \times \mathbf{w} = \begin{bmatrix} (0)(1) - (1)(1) \\ (1)(0) - (1)(1) \\ (1)(1) - (0)(0) \end{bmatrix} = \begin{bmatrix} -1 \\ -1 \\ 1 \end{bmatrix}$$

Using the normal form with $\mathbf{n} = \lbrack -1, -1, 1 \rbrack^T$ and point $(1, 2, 3)$:

$$-1(x-1) - 1(y-2) + 1(z-3) = 0$$
$$-x + 1 - y + 2 + z - 3 = 0$$
$$-x - y + z = 0$$

Or equivalently: $x + y - z = 0$

## Lines in 3D

### Parametric Representation

A [line in 3D](https://mathworld.wolfram.com/Line.html) through point $\mathbf{p}_0$ with direction vector $\mathbf{v}$ is:

$$\mathbf{p}(t) = \mathbf{p}_0 + t\mathbf{v}, \quad t \in \mathbb{R}$$

This is the same form as in 2D (see [Lines](02 Lines.md)), just with three components.

### Symmetric Form

The parametric equations:

$$x = x_0 + tv_1, \quad y = y_0 + tv_2, \quad z = z_0 + tv_3$$

can be written in symmetric form (assuming all direction components are non-zero):

$$\frac{x - x_0}{v_1} = \frac{y - y_0}{v_2} = \frac{z - z_0}{v_3} = t$$

### Line as Intersection of Two Planes

Unlike in 2D where a line is defined by one equation, a line in 3D is the intersection of two planes:

$$\begin{cases} a_1x + b_1y + c_1z + d_1 = 0 \\ a_2x + b_2y + c_2z + d_2 = 0 \end{cases}$$

### Skew Lines

In 2D, two lines either intersect at a single point or are parallel. In 3D, a third possibility exists: two lines can be [skew](https://mathworld.wolfram.com/SkewLines.html)—neither parallel nor intersecting. Skew lines do not lie in the same plane.

Given two lines $\mathbf{l}_1(t) = \mathbf{p}_1 + t\mathbf{v}_1$ and $\mathbf{l}_2(s) = \mathbf{p}_2 + s\mathbf{v}_2$:

- **Parallel**: Direction vectors are parallel ($\mathbf{v}_1 = c\mathbf{v}_2$ for some scalar $c$)
- **Intersecting**: There exist parameters $t, s$ such that $\mathbf{l}_1(t) = \mathbf{l}_2(s)$
- **Skew**: Neither parallel nor intersecting

The shortest distance between two skew lines is:

$$d = \frac{\lvert(\mathbf{p}_2 - \mathbf{p}_1) \cdot (\mathbf{v}_1 \times \mathbf{v}_2)\rvert}{\lVert\mathbf{v}_1 \times \mathbf{v}_2\rVert}$$

## Julia Code Examples

### Vector Operations in 3D

```julia
using LinearAlgebra

# Define 3D vectors
u = [1.0, 2.0, 3.0]
v = [4.0, 5.0, 6.0]

# Vector length (Euclidean norm)
norm_u = norm(u)  # √(1² + 2² + 3²) = √14

# Dot product
dot_product = dot(u, v)  # 1*4 + 2*5 + 3*6 = 32

# Cross product
cross_product = cross(u, v)  # [-3, 6, -3]

# Unit vector
unit_u = u / norm(u)

# Angle between vectors
angle = acos(dot(u, v) / (norm(u) * norm(v)))

# Verify cross product is perpendicular
@assert abs(dot(u, cross_product)) < 1e-10
@assert abs(dot(v, cross_product)) < 1e-10
```

### Plane Operations

```julia
using LinearAlgebra

# Point on plane and two direction vectors
p₀ = [1.0, 2.0, 3.0]
v = [1.0, 0.0, 1.0]
w = [0.0, 1.0, 1.0]

# Normal vector via cross product
n = cross(v, w)  # [-1, -1, 1]

# General plane equation coefficients: ax + by + cz + d = 0
a, b, c = n
d = -dot(n, p₀)  # d = -(-1*1 - 1*2 + 1*3) = 0

# Distance from point to plane
function point_to_plane_distance(point, a, b, c, d)
    abs(a*point[1] + b*point[2] + c*point[3] + d) / sqrt(a^2 + b^2 + c^2)
end

q = [0.0, 0.0, 0.0]
distance = point_to_plane_distance(q, a, b, c, d)  # 0.0 (origin lies on this plane)
```

### Parametric Line in 3D

```julia
# Line through p₀ with direction v
p₀ = [1.0, 2.0, 3.0]
v = [2.0, 1.0, -1.0]

# Point on line at parameter t
function point_on_line(p₀, v, t)
    p₀ + t * v
end

# Generate points along the line
t_values = range(-2, 2, length=5)
line_points = [point_on_line(p₀, v, t) for t in t_values]
```

## Summary: 2D to 3D Comparison

| Concept | 2D | 3D |
|---------|----|----|
| Coordinates | $(x, y)$ | $(x, y, z)$ |
| Standard basis | $\mathbf{e}_1, \mathbf{e}_2$ | $\mathbf{e}_1, \mathbf{e}_2, \mathbf{e}_3$ |
| Vector length | $\sqrt{v_1^2 + v_2^2}$ | $\sqrt{v_1^2 + v_2^2 + v_3^2}$ |
| Dot product | $u_1v_1 + u_2v_2$ | $u_1v_1 + u_2v_2 + u_3v_3$ |
| Cross product | Not defined (scalar analog) | Full vector operation |
| Line | 1 equation | 2 equations (intersection of planes) |
| Hyperplane | Line | Plane |

## See Also

- [Points and Coordinates](01 Points and Coordinates.md) - Foundation for 2D geometry
- [Vectors](../Basics/01 Vectors.md) - Comprehensive vector operations
- [Lines](02 Lines.md) - 2D line representations
- [Dot Product and Orthogonality](03 Dot Product and Orthogonality.md) - Orthogonality concepts
