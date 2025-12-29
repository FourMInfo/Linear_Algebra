# Linear Transformations

[Linear transformations](https://mathworld.wolfram.com/LinearTransformation.html) are functions between vector spaces that preserve vector addition and scalar multiplication. They are the fundamental operations studied in linear algebra and can all be represented by matrices.

## Definition

A function $T: \mathbb{R}^n \to \mathbb{R}^m$ is a **linear transformation** if for all vectors $\mathbf{u}, \mathbf{v}$ and all scalars $c$:

1. **Additivity:** $T(\mathbf{u} + \mathbf{v}) = T(\mathbf{u}) + T(\mathbf{v})$
2. **Homogeneity:** $T(c\mathbf{v}) = cT(\mathbf{v})$

These two properties can be combined: $$T(c_1\mathbf{v}_1 + c_2\mathbf{v}_2) = c_1T(\mathbf{v}_1) + c_2T(\mathbf{v}_2)$$

**Important consequence:** Every linear transformation maps the zero vector to itself: $$T(\mathbf{0}) = \mathbf{0}$$

## Matrix Representation

Every linear transformation $T: \mathbb{R}^n \to \mathbb{R}^m$ can be represented by an $m \times n$ matrix $A$: $$T(\mathbf{v}) = A\mathbf{v}$$

### Finding the Matrix

To find the matrix for a linear transformation:

1. Apply $T$ to each standard basis vector $\mathbf{e}_1, \mathbf{e}_2, \ldots, \mathbf{e}_n$
2. The columns of $A$ are $T(\mathbf{e}_1), T(\mathbf{e}_2), \ldots, T(\mathbf{e}_n)$

**Example in $\mathbb{R}^2$:**

- $\mathbf{e}_1 = [1, 0]$ and $\mathbf{e}_2 = [0, 1]$
- Matrix: $A = [T(\mathbf{e}_1) \mid T(\mathbf{e}_2)]$

## Common Linear Transformations in 2D

### Rotation

A [rotation](https://mathworld.wolfram.com/RotationMatrix.html) by angle $\theta$ (counterclockwise) about the origin:

$$R_\theta = \begin{pmatrix} \cos\theta & -\sin\theta \\ \sin\theta & \cos\theta \end{pmatrix}$$

**Properties:**

- Preserves lengths: $\|R_\theta\mathbf{v}\| = \|\mathbf{v}\|$
- Preserves angles between vectors
- Determinant: $\det(R_\theta) = 1$
- Inverse: $R_\theta^{-1} = R_{-\theta}$

**Derivation:** Apply rotation to basis vectors:

- $R_\theta(\mathbf{e}_1) = [\cos\theta, \sin\theta]$
- $R_\theta(\mathbf{e}_2) = [-\sin\theta, \cos\theta]$

### Scaling (Stretch)

A [scaling transformation](https://mathworld.wolfram.com/ScalingMatrix.html) by factor $\lambda$:

$$S_\lambda = \begin{pmatrix} \lambda & 0 \\ 0 & \lambda \end{pmatrix}$$

**Non-uniform scaling** with different factors along axes:

$$S_{\lambda_1, \lambda_2} = \begin{pmatrix} \lambda_1 & 0 \\ 0 & \lambda_2 \end{pmatrix}$$

**Properties:**

- $\lambda > 1$: expansion
- $0 < \lambda < 1$: contraction
- $\lambda < 0$: includes reflection
- Determinant: $\det(S_\lambda) = \lambda^2$

### Reflection

[Reflection](https://mathworld.wolfram.com/Reflection.html) across a line through the origin with direction $\mathbf{u} = [\cos\phi, \sin\phi]$:

$$M_\phi = \begin{pmatrix} \cos 2\phi & \sin 2\phi \\ \sin 2\phi & -\cos 2\phi \end{pmatrix}$$

**Special cases:**

- Reflection across x-axis ($\phi = 0$): $\begin{pmatrix} 1 & 0 \\ 0 & -1 \end{pmatrix}$
- Reflection across y-axis ($\phi = \frac{\pi}{2}$): $\begin{pmatrix} -1 & 0 \\ 0 & 1 \end{pmatrix}$
- Reflection across $y = x$ ($\phi = \frac{\pi}{4}$): $\begin{pmatrix} 0 & 1 \\ 1 & 0 \end{pmatrix}$

**Properties:**

- $M_\phi^2 = I$ (applying twice returns to original)
- Determinant: $\det(M_\phi) = -1$
- Preserves lengths

### Orthogonal Projection

[Projection](https://mathworld.wolfram.com/Projection.html) onto a line through the origin with unit direction $\mathbf{u} = [\cos\phi, \sin\phi]$:

$$P_\phi = \begin{pmatrix} \cos^2\phi & \cos\phi\sin\phi \\ \cos\phi\sin\phi & \sin^2\phi \end{pmatrix}$$

**Alternative form:** For projection onto line spanned by unit vector $\mathbf{u}$: $$P = \mathbf{u}\mathbf{u}^T$$

**Properties:**

- $P^2 = P$ (idempotent: projecting twice gives same result)
- Determinant: $\det(P) = 0$ (rank 1)
- Eigenvalues: 1 and 0

### Shear

A [shear transformation](https://mathworld.wolfram.com/Shear.html) parallel to the x-axis:

$$H_k = \begin{pmatrix} 1 & k \\ 0 & 1 \end{pmatrix}$$

Shear parallel to the y-axis:

$$H'_k = \begin{pmatrix} 1 & 0 \\ k & 1 \end{pmatrix}$$

**Properties:**

- Preserves area: $\det(H_k) = 1$
- Does not preserve angles or lengths (except along the shear axis)

## Composition of Transformations

### Matrix Multiplication

Applying transformation $T_B$ followed by $T_A$ is equivalent to: $$T_A(T_B(\mathbf{v})) = (AB)\mathbf{v}$$

**Important:** Matrix multiplication is not commutative: $AB \neq BA$ in general.

The order matters: "First $B$, then $A$" corresponds to $AB$.

### Examples

**Rotation then scaling:**

$$S_\lambda R_\theta = \begin{pmatrix} \lambda\cos\theta & -\lambda\sin\theta \\ \lambda\sin\theta & \lambda\cos\theta \end{pmatrix}$$

**Two rotations:**

$$R_\alpha R_\beta = R_{\alpha + \beta}$$

Rotations commute with each other.

## Properties of Linear Transformations

### Kernel (Null Space)

The [kernel](https://mathworld.wolfram.com/NullSpace.html) of $T$ is the set of vectors mapped to zero: $$\ker(T) = \{\mathbf{v} : T(\mathbf{v}) = \mathbf{0}\}$$

- If $\ker(T) = \{\mathbf{0}\}$, then $T$ is one-to-one (injective)
- The dimension of the kernel is the nullity

### Image (Range)

The [image](https://mathworld.wolfram.com/Range.html) of $T$ is the set of all possible outputs: $$\text{im}(T) = \{T(\mathbf{v}) : \mathbf{v} \in \mathbb{R}^n\}$$

- The dimension of the image is the rank
- **Rank-Nullity Theorem:** $\text{rank}(T) + \text{nullity}(T) = n$

### Invertibility

A linear transformation $T: \mathbb{R}^n \to \mathbb{R}^n$ is [invertible](https://mathworld.wolfram.com/MatrixInverse.html) if and only if:

- $\ker(T) = \{\mathbf{0}\}$ (one-to-one)
- $\text{im}(T) = \mathbb{R}^n$ (onto)
- $\det(A) \neq 0$

The inverse transformation has matrix $A^{-1}$.

## Geometric Interpretation

### Effect on Unit Circle

The unit circle transforms to an ellipse under most linear transformations. The semi-axes of the ellipse are related to the [singular values](https://mathworld.wolfram.com/SingularValue.html) of the matrix.

### Determinant and Area

The [determinant](https://mathworld.wolfram.com/Determinant.html) of a transformation matrix measures how areas scale:

- $|\det(A)|$ = factor by which areas are multiplied
- $\det(A) > 0$: orientation preserved
- $\det(A) < 0$: orientation reversed

### Eigenvalues and Eigenvectors

An [eigenvector](https://mathworld.wolfram.com/Eigenvector.html) $\mathbf{v}$ of $T$ satisfies: $$T(\mathbf{v}) = \lambda\mathbf{v}$$

The scalar $\lambda$ is the corresponding [eigenvalue](https://mathworld.wolfram.com/Eigenvalue.html).

**Geometric meaning:** Eigenvectors are directions that are only scaled (not rotated) by the transformation.

## Applications

### Computer Graphics

- **Model transformations:** Position, rotate, and scale objects
- **View transformations:** Camera positioning
- **Homogeneous coordinates:** Enable translation as a linear transformation

### Physics

- **Coordinate transformations:** Changing reference frames
- **Stress and strain tensors:** Material deformation
- **Quantum mechanics:** Operators on state spaces

### Data Science

- **Principal Component Analysis (PCA):** Finding directions of maximum variance
- **Dimensionality reduction:** Projecting high-dimensional data

## See Also

- [Vectors](01 Vectors.md) - Vector operations
- [Lines](../Geometry/02 Lines.md) - How lines transform
- [Matrices](03 Matrices.md) - Matrix operations and properties
