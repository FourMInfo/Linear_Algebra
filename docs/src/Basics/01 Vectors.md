# Vectors

[Vectors](https://mathworld.wolfram.com/Vector.html) are fundamental mathematical objects that have both magnitude and direction. In linear algebra, vectors form the building blocks for understanding linear transformations, spaces, and systems of equations.

## Definition and Basic Properties

### What is a Vector?

A [vector](https://mathworld.wolfram.com/Vector.html) can be understood in several equivalent ways:

- **Algebraic definition:** An ordered list of numbers (components)
- **Geometric definition:** An arrow in Euclidean space with a specific length (magnitude) and direction
- **Physical definition:** A physical quantity that has both magnitude and direction (e.g., velocity, force)

In this document, we primarily focus on the algebraic definition of vectors in n-dimensional space, denoted as $\mathbb{R}^n$. For more information about the geometric and physical interpretations, see [Vectors](../Geometry/01 Points and Coordinates.md#Vectors) in the Points and Coordinates document.

### Vector Notation

Vectors can be represented in different notations:

- **Column vector:** $\begin{pmatrix} v_1 \\ v_2 \end{pmatrix}$
- **Row vector:** $\lbrack v_1, v_2 \rbrack$
- **Boldface notation:** $\mathbf{v}$ or $\mathbf{u}$ for vectors
- **Hat notation:** $\hat{\mathbf{v}}$ for unit vectors (magnitude 1)
- **Arrow notation:** $\vec{v}$ to denote vectors
- **Component form:** $\mathbf{v} = \lbrack v_1, v_2, \ldots, v_n \rbrack$
- **Index notation:** $v_i$ to denote the $i$-th component of vector $\mathbf{v}$

### Components and Dimensions

The dimension of a vector equals the number of its components. The notation $\mathbb{R}^n$ represents all vectors with $n$ real-number components, where each component is a coordinate along one of $n$ perpendicular axes. This collection of all such vectors is called an _n-dimensional space_ (or simply $\mathbb{R}^n$).

In $\mathbb{R}^2$ (2D), a vector is written as: $\mathbf{v} = \lbrack v_1, v_2 \rbrack$ or $\mathbf{v} = \begin{pmatrix} v_1 \\ v_2 \end{pmatrix}$

In $\mathbb{R}^3$ (3D), a vector is written as: $\mathbf{v} = \lbrack v_1, v_2, v_3 \rbrack$ or $\mathbf{v} = \begin{pmatrix} v_1 \\ v_2 \\ v_3 \end{pmatrix}$

In $\mathbb{R}^n$ (n-dimensional), a vector is written as: $\mathbf{v} = \lbrack v_1, v_2, \ldots, v_n \rbrack$ or $\mathbf{v} = \begin{pmatrix} v_1 \\ v_2 \\ \vdots \\ v_n \end{pmatrix}$

### Length (Magnitude) of a Vector

The length or [magnitude](https://mathworld.wolfram.com/VectorMagnitude.html)  of a vector $\mathbf{v} = \lbrack v_1, v_2, \ldots, v_n \rbrack$ is given by the formula:$$\|\mathbf{v}\| = \sqrt{v_1^2 + v_2^2 + \cdots + v_n^2} = \sqrt{\sum_{i=1}^{n} v_i^2}$$

**Example:** For $\mathbf{v} = \lbrack 3, 4 \rbrack$ in $\mathbb{R}^2$, the magnitude is: $$\|\mathbf{v}\| = \sqrt{3^2 + 4^2} = \sqrt{9 + 16} = \sqrt{25} = 5$$

### Normalization and Unit Vectors

A [unit vector](https://mathworld.wolfram.com/UnitVector.html) is a vector with a magnitude of 1. To _normalize_ a vector $\mathbf{v}$ (i.e., convert it to a unit vector), divide each component by the vector's magnitude: $$\hat{\mathbf{v}} = \frac{\mathbf{v}}{\|\mathbf{v}\|} = \left\lbrack \frac{v_1}{\|\mathbf{v}\|}, \frac{v_2}{\|\mathbf{v}\|}, \ldots, \frac{v_n}{\|\mathbf{v}\|} \right\rbrack$$

**Example:** For $\mathbf{v} = \lbrack 3, 4 \rbrack$, the unit vector is: $$\hat{\mathbf{v}} = \frac{1}{5} \lbrack 3, 4 \rbrack = \lbrack 0.6, 0.8 \rbrack$$

There is a lot more to say about the geometric interpretation of magnitude and normalization. For more details, see [Length (Magnitude)](../Geometry/03 Vectors and Geometry.md#Vector-Length-(Magnitude)) in the Vectors and Geometry document.

## Vector Operations

### Vector Addition

Two vectors are added component-wise: $$\mathbf{u} + \mathbf{v} = \lbrack u_1 + v_1, u_2 + v_2 \rbrack$$

For geometric interpretation (parallelogram rule), see [Coordinate Independent Operations](../Geometry/01 Points and Coordinates.md#Coordinate-Independent-Operations) in the Points and Coordinates document.

**Properties:**

- Commutative: $\mathbf{u} + \mathbf{v} = \mathbf{v} + \mathbf{u}$
- Associative: $(\mathbf{u} + \mathbf{v}) + \mathbf{w} = \mathbf{u} + (\mathbf{v} + \mathbf{w})$
- Identity: $\mathbf{v} + \mathbf{0} = \mathbf{v}$
- Inverse: $\mathbf{v} + (-\mathbf{v}) = \mathbf{0}$

### Scalar Multiplication

A vector multiplied by a scalar $c$: $$c\mathbf{v} = \lbrack cv_1, cv_2 \rbrack$$

For geometric interpretation (scaling, stretching, reversing direction), see [Coordinate Independent Operations](../Geometry/01 Points and Coordinates.md#Coordinate-Independent-Operations) in the Points and Coordinates document.

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

### Generalizing Vector Operations to $\mathbb{R}^n$

All the above operations extend naturally to n-dimensional vectors in $\mathbb{R}^n$:
- **Addition:** $$\mathbf{u} + \mathbf{v} = \lbrack u_1 + v_1, u_2 + v_2, \ldots, u_n + v_n \rbrack$$
- **Scalar multiplication:** $$c\mathbf{v} = \lbrack cv_1, cv_2, \ldots, cv_n \rbrack$$
- **Subtraction:** $$\mathbf{u} - \mathbf{v} = \lbrack u_1 - v_1, u_2 - v_2, \ldots, u_n - v_n \rbrack$$
- **Properties:** All properties of vector addition and scalar multiplication hold in $\mathbb{R}^n$ as well.
- **Applications:** Vectors in $\mathbb{R}^n$ are widely used in data science, physics, and engineering to represent multi-dimensional quantities and are essential in fields like machine learning, where data points are often represented as high-dimensional vectors.
- **Notation:** Vectors in $\mathbb{R}^n$ are often denoted as $\mathbf{v} = \lbrack v_1, v_2, \ldots, v_n \rbrack$ or $\mathbf{v} = \begin{pmatrix} v_1 \\ v_2 \\ \vdots \\ v_n \end{pmatrix}$.
- **Example:** In $\mathbb{R}^4$, a vector could be $\mathbf{v} = \lbrack 1, 2, 3, 4 \rbrack$.
- **Computational tools:** Software like Julia, MATLAB, Python (NumPy), and R facilitate operations on high-dimensional vectors efficiently.

## Dot Product

The [dot product](https://mathworld.wolfram.com/DotProduct.html) (scalar product, inner product) of two vectors (in 2D space): $$\mathbf{u} \cdot \mathbf{v} = u_1v_1 + u_2v_2 = \sum_{i=1}^{2} u_iv_i$$

For $\mathbf{u} = \lbrack u_1, u_2, \ldots, u_n \rbrack$ and $\mathbf{v} = \lbrack v_1, v_2, \ldots, v_n \rbrack$ in $\mathbb{R}^n$: $$\mathbf{u} \cdot \mathbf{v} = u_1v_1 + u_2v_2 + \cdots + u_nv_n = \sum_{i=1}^{n} u_iv_i$$

### Properties

- Commutative: $\mathbf{u} \cdot \mathbf{v} = \mathbf{v} \cdot \mathbf{u}$
- Distributive: $\mathbf{u} \cdot (\mathbf{v} + \mathbf{w}) = \mathbf{u} \cdot \mathbf{v} + \mathbf{u} \cdot \mathbf{w}$
- Scalar multiplication: $(c\mathbf{u}) \cdot \mathbf{v} = c(\mathbf{u} \cdot \mathbf{v})$
- Self dot product: $\mathbf{v} \cdot \mathbf{v} = \|\mathbf{v}\|^2$

<!-- Link to be restored: For geometric interpretation, see Dot Product and Cosines (../Geometry/03 Dot Product and Orthogonality.md#Dot-Product-and-Cosines) (angles) and Orthogonal Vectors (../Geometry/03 Dot Product and Orthogonality.md#Orthogonal-Vectors) (orthogonality) in the Dot Product and Orthogonality document. -->

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

For geometric interpretation (parallel vectors, zero-area parallelogram), see [Linear Independence](../Geometry/01 Points and Coordinates.md#Linear-Independence) in the Points and Coordinates document.

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

- [Linear Transformations](02 Linear Transformations.md) - How vectors are mapped
- [Matrices](03 Matrices.md) - Matrix operations
- [Points and Coordinates](../Geometry/01 Points and Coordinates.md) - Points, standard basis, distance, and magnitude
- [Lines](../Geometry/02 Lines.md) - Parametric and implicit representations
- [Vectors and Geometry](../Geometry/03 Vectors and Geometry.md) - In depth geometric interpretation of vectors
