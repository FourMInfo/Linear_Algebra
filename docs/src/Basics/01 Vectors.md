# Vectors

[Vectors](https://mathworld.wolfram.com/Vector.html) are fundamental mathematical objects that have both magnitude and direction. In linear algebra, vectors form the building blocks for understanding linear transformations, spaces, and systems of equations.

## Definition and Basic Properties

### What is a Vector?

A [vector](https://mathworld.wolfram.com/Vector.html) can be understood in several equivalent ways:

- **Algebraic definition:** An ordered list of numbers (components)
- **Geometric definition:** An arrow with a specific length (magnitude) and direction
- **Physical definition:** A quantity that has both magnitude and direction (e.g., velocity, force)

In $\mathbb{R}^2$ (2D space), a vector is written as: $\mathbf{v} = \lbrack v_1, v_2 \rbrack$ or $\mathbf{v} = \begin{pmatrix} v_1 \\ v_2 \end{pmatrix}$

### Vector Notation

Vectors can be represented in different notations:

- **Column vector:** $\begin{pmatrix} v_1 \\ v_2 \end{pmatrix}$
- **Row vector:** $\lbrack v_1, v_2 \rbrack$
- **Boldface notation:** $\mathbf{v}$ or $\mathbf{u}$ for vectors
- **Hat notation:** $\hat{\mathbf{v}}$ for unit vectors (magnitude 1)

### Components and Dimensions

A vector's components are its coordinates in a given space.

- In $\mathbb{R}^2$: $\mathbf{v} = \lbrack v_1, v_2 \rbrack$
- In $\mathbb{R}^3$: $\mathbf{v} = \lbrack v_1, v_2, v_3 \rbrack$

In $\mathbb{R}^n$ (n-dimensional space): $\mathbf{v} = \lbrack v_1, v_2, \ldots, v_n \rbrack$

### Position Vectors and Free Vectors

- **Position vector:** A vector from the origin to a point $P = \lbrack x, y \rbrack$
- **Free vector:** A vector defined only by its magnitude and direction, not its starting point
- **Displacement vector:** The vector from point $P$ to point $Q$, given by $\overrightarrow{PQ} = Q - P$

## Vector Operations

### Vector Addition

Two vectors are added component-wise: $$\mathbf{u} + \mathbf{v} = \lbrack u_1 + v_1, u_2 + v_2 \rbrack$$

**Geometric interpretation:** Place the tail of $\mathbf{v}$ at the head of $\mathbf{u}$; the sum is the vector from the tail of $\mathbf{u}$ to the head of $\mathbf{v}$ (parallelogram rule).

**Properties:**

- Commutative: $\mathbf{u} + \mathbf{v} = \mathbf{v} + \mathbf{u}$
- Associative: $(\mathbf{u} + \mathbf{v}) + \mathbf{w} = \mathbf{u} + (\mathbf{v} + \mathbf{w})$
- Identity: $\mathbf{v} + \mathbf{0} = \mathbf{v}$
- Inverse: $\mathbf{v} + (-\mathbf{v}) = \mathbf{0}$

### Scalar Multiplication

A vector multiplied by a scalar $c$: $$c\mathbf{v} = \lbrack cv_1, cv_2 \rbrack$$

**Geometric interpretation:**

- stretch the vector: $\lvert c \rvert \gt 1$
- shrink the vector: $0 \lt \lvert c \rvert \lt 1$
- reverse direction: $c \lt 0$
- produce the zero vector: $c = 0$

**Properties:**

- Distributive over vector addition: $c(\mathbf{u} + \mathbf{v}) = c\mathbf{u} + c\mathbf{v}$
- Distributive over scalar addition: $(c + d)\mathbf{v} = c\mathbf{v} + d\mathbf{v}$
- Associative: $c(d\mathbf{v}) = (cd)\mathbf{v}$
- Identity: $1\mathbf{v} = \mathbf{v}$

### Vector Subtraction

Vector subtraction is defined as adding the negative of a vector:

$$\begin{aligned}
\mathbf{u} - \mathbf{v} &= \mathbf{u} + (-\mathbf{v}) \\
&= \lbrack u_1 - v_1, u_2 - v_2 \rbrack
\end{aligned}$$

## Vector Magnitude and Direction

### Magnitude (Norm)

The [magnitude](https://mathworld.wolfram.com/VectorNorm.html) or length of a vector is: $$\|\mathbf{v}\| = \sqrt{v_1^2 + v_2^2}$$

For $\mathbb{R}^n$: $$\|\mathbf{v}\| = \sqrt{v_1^2 + v_2^2 + \cdots + v_n^2} = \sqrt{\sum_{i=1}^{n} v_i^2}$$

This is the [Euclidean norm](https://mathworld.wolfram.com/L2-Norm.html) (also called L2 norm).

### Unit Vectors

A [unit vector](https://mathworld.wolfram.com/UnitVector.html) has magnitude 1. To normalize a vector (convert to unit vector): $$\hat{\mathbf{v}} = \frac{\mathbf{v}}{\|\mathbf{v}\|}$$

**Standard basis unit vectors in $\mathbb{R}^2$:**

- The first basis vector: $\mathbf{e}_1 = \lbrack 1, 0 \rbrack$ (points along positive x-axis)
- The second basis vector: $\mathbf{e}_2 = \lbrack 0, 1 \rbrack$ (points along positive y-axis)

Any vector can be written as: $\mathbf{v} = v_1\mathbf{e}_1 + v_2\mathbf{e}_2$

### Direction and Polar Form

In 2D, a vector can be expressed in [polar form](https://mathworld.wolfram.com/PolarCoordinates.html): $$\mathbf{v} = r\lbrack\cos\theta, \sin\theta\rbrack$$ where:

- The magnitude is $r = \|\mathbf{v}\|$
- The angle $\theta$ is measured from the positive x-axis

**Converting between forms:**

- Cartesian to polar: $r = \sqrt{v_1^2 + v_2^2}$, $\theta = \arctan\left(\frac{v_2}{v_1}\right)$
- Polar to Cartesian: $v_1 = r\cos\theta$, $v_2 = r\sin\theta$

## Dot Product

The [dot product](https://mathworld.wolfram.com/DotProduct.html) (scalar product, inner product) of two vectors: $$\mathbf{u} \cdot \mathbf{v} = u_1v_1 + u_2v_2 = \sum_{i=1}^{n} u_iv_i$$

### Geometric Interpretation

The dot product relates to the angle $\theta$ between the vectors: $$\mathbf{u} \cdot \mathbf{v} = \|\mathbf{u}\|\|\mathbf{v}\|\cos\theta$$ where $\theta$ is the angle between the vectors.

**Key insights:**

- Positive: $\mathbf{u} \cdot \mathbf{v} > 0$ indicates an acute angle ($\theta < 90°$)
- Zero: $\mathbf{u} \cdot \mathbf{v} = 0$ indicates perpendicular vectors ($\theta = 90°$)
- Negative: $\mathbf{u} \cdot \mathbf{v} < 0$ indicates an obtuse angle ($\theta > 90°$)

### Properties

- Commutative: $\mathbf{u} \cdot \mathbf{v} = \mathbf{v} \cdot \mathbf{u}$
- Distributive: $\mathbf{u} \cdot (\mathbf{v} + \mathbf{w}) = \mathbf{u} \cdot \mathbf{v} + \mathbf{u} \cdot \mathbf{w}$
- Scalar multiplication: $(c\mathbf{u}) \cdot \mathbf{v} = c(\mathbf{u} \cdot \mathbf{v})$
- Self dot product: $\mathbf{v} \cdot \mathbf{v} = \|\mathbf{v}\|^2$

### Angle Between Vectors

The angle $\theta$ between two vectors: $$\cos\theta = \frac{\mathbf{u} \cdot \mathbf{v}}{\|\mathbf{u}\|\|\mathbf{v}\|}$$

## Orthogonality

Two vectors are [orthogonal](https://mathworld.wolfram.com/OrthogonalVectors.html) (perpendicular) if: $$\mathbf{u} \cdot \mathbf{v} = 0$$

### Orthogonal Projection

The [orthogonal projection](https://mathworld.wolfram.com/OrthogonalProjection.html) of $\mathbf{w}$ onto $\mathbf{v}$: $$\text{proj}_{\mathbf{v}}\mathbf{w} = \frac{\mathbf{v} \cdot \mathbf{w}}{\|\mathbf{v}\|^2}\mathbf{v} = \frac{\mathbf{v} \cdot \mathbf{w}}{\mathbf{v} \cdot \mathbf{v}}\mathbf{v}$$

**Geometric interpretation:** The projection is the "shadow" of $\mathbf{w}$ onto the line defined by $\mathbf{v}$.

### Orthogonal Decomposition

Any vector $\mathbf{w}$ can be decomposed relative to $\mathbf{v}$: $$\mathbf{w} = \text{proj}_{\mathbf{v}}\mathbf{w} + \mathbf{w}^{\perp}$$ where $\mathbf{w}^{\perp}$ is the component perpendicular to $\mathbf{v}$.

## Linear Combinations and Span

### Linear Combination

A [linear combination](https://mathworld.wolfram.com/LinearCombination.html) of vectors $\mathbf{v}_1, \mathbf{v}_2, \ldots, \mathbf{v}_k$ is: $$c_1\mathbf{v}_1 + c_2\mathbf{v}_2 + \cdots + c_k\mathbf{v}_k$$ where $c_1, c_2, \ldots, c_k$ are scalars.

### Span

The [span](https://mathworld.wolfram.com/VectorSpaceSpan.html) of a set of vectors is the set of all possible linear combinations: $$\text{span}\{\mathbf{v}_1, \mathbf{v}_2, \ldots, \mathbf{v}_k\} = \{c_1\mathbf{v}_1 + c_2\mathbf{v}_2 + \cdots + c_k\mathbf{v}_k : c_i \in \mathbb{R}\}$$

**Examples:**

- Span of one non-zero vector: a line through the origin
- Span of two non-parallel vectors in $\mathbb{R}^2$: the entire plane

### Linear Independence

Vectors $\mathbf{v}_1, \mathbf{v}_2, \ldots, \mathbf{v}_k$ are [linearly independent](https://mathworld.wolfram.com/LinearlyIndependentVectors.html) if the only solution to: $$c_1\mathbf{v}_1 + c_2\mathbf{v}_2 + \cdots + c_k\mathbf{v}_k = \mathbf{0}$$ is $c_1 = c_2 = \cdots = c_k = 0$.

**Geometric interpretation:**

- Two vectors are linearly independent if they are not parallel
- Three vectors in $\mathbb{R}^3$ are linearly independent if they don't all lie in the same plane

## Special Vector Concepts

### Zero Vector

The [zero vector](https://mathworld.wolfram.com/ZeroVector.html) $\mathbf{0} = \lbrack 0, 0, \ldots, 0 \rbrack$:

- Has magnitude 0
- Has no defined direction
- Is the additive identity: $\mathbf{v} + \mathbf{0} = \mathbf{v}$

### Parallel Vectors

Two vectors are parallel if one is a scalar multiple of the other: $$\mathbf{u} = c\mathbf{v}$$ for some scalar $c$.

### Distance Between Points

The distance between points $P$ and $Q$ is: $$d(P, Q) = \|Q - P\| = \|\overrightarrow{PQ}\|$$

## Applications

### Physics

- **Velocity:** Direction and speed of motion
- **Force:** Direction and magnitude of push/pull
- **Acceleration:** Rate of change of velocity

### Computer Graphics

- **Position vectors:** Location of objects
- **Direction vectors:** Orientation and movement
- **Normal vectors:** Surface orientation for lighting

### Navigation

- **Displacement:** Distance and direction traveled
- **Bearing:** Direction of travel

## See Also

- [Lines](02 Lines.md) - Parametric and implicit representations
- [Linear Transformations](03 Linear Transformations.md) - How vectors are mapped
- [Matrices](04 Matrices.md) - Matrix-vector operations
