# Matrices

[Matrices](https://mathworld.wolfram.com/Matrix.html) are rectangular arrays of numbers that represent linear transformations and systems of linear equations. They are central to linear algebra and have applications throughout mathematics, science, and engineering.

## Definition and Notation

A [matrix](https://mathworld.wolfram.com/Matrix.html) is a rectangular array of numbers arranged in rows and columns. An $m \times n$ matrix has $m$ rows and $n$ columns:

$$A = \begin{pmatrix}
a_{11} & a_{12} & \cdots & a_{1n} \\
a_{21} & a_{22} & \cdots & a_{2n} \\
\vdots & \vdots & \ddots & \vdots \\
a_{m1} & a_{m2} & \cdots & a_{mn}
\end{pmatrix}$$

The entry in row $i$ and column $j$ is denoted $a_{ij}$ or $A_{ij}$.

### Special Types of Matrices

- **Square matrix:** $m = n$ (same number of rows and columns)
- **Row vector:** $1 \times n$ matrix
- **Column vector:** $m \times 1$ matrix
- **Zero matrix:** All entries are 0
- **Identity matrix:** Square matrix with 1s on diagonal, 0s elsewhere: $I_n$

## Matrix Operations

### Addition and Subtraction

Matrices of the same dimensions are added element-wise: $$(A + B)_{ij} = a_{ij} + b_{ij}$$

### Scalar Multiplication

Each entry is multiplied by the scalar: $$(cA)_{ij} = c \cdot a_{ij}$$

### Matrix Multiplication

For $A$ ($m \times n$) and $B$ ($n \times p$), the product $AB$ is an $m \times p$ matrix: $$(AB)_{ij} = \sum_{k=1}^{n} a_{ik}b_{kj}$$

**Key properties:**

- Not commutative: $AB \neq BA$ in general
- Associative: $(AB)C = A(BC)$
- Distributive: $A(B + C) = AB + AC$
- Identity: $AI = IA = A$

### Transpose

The [transpose](https://mathworld.wolfram.com/Transpose.html) $A^T$ swaps rows and columns: $$(A^T)_{ij} = a_{ji}$$

**Properties:**

- $(A^T)^T = A$
- $(A + B)^T = A^T + B^T$
- $(AB)^T = B^T A^T$
- $(cA)^T = cA^T$

## Special Matrix Types

### Diagonal Matrix

A [diagonal matrix](https://mathworld.wolfram.com/DiagonalMatrix.html) has non-zero entries only on the main diagonal:

$$D = \begin{pmatrix}
d_1 & 0 & \cdots & 0 \\
0 & d_2 & \cdots & 0 \\
\vdots & \vdots & \ddots & \vdots \\
0 & 0 & \cdots & d_n
\end{pmatrix}$$

### Symmetric Matrix

A [symmetric matrix](https://mathworld.wolfram.com/SymmetricMatrix.html) equals its transpose: $A = A^T$

This means $a_{ij} = a_{ji}$ for all $i, j$.

### Orthogonal Matrix

An [orthogonal matrix](https://mathworld.wolfram.com/OrthogonalMatrix.html) $Q$ satisfies: $$Q^TQ = QQ^T = I$$

**Properties:**

- Columns are orthonormal vectors
- $Q^{-1} = Q^T$
- $|\det(Q)| = 1$
- Preserves lengths and angles

**Examples:** Rotation matrices, reflection matrices

### Triangular Matrices

- **Upper triangular:** All entries below the diagonal are 0
- **Lower triangular:** All entries above the diagonal are 0

$$\text{Upper: } \begin{pmatrix} a & b & c \\ 0 & d & e \\ 0 & 0 & f \end{pmatrix} \quad \text{Lower: } \begin{pmatrix} a & 0 & 0 \\ b & c & 0 \\ d & e & f \end{pmatrix}$$

## Determinant

The [determinant](https://mathworld.wolfram.com/Determinant.html) is a scalar value associated with square matrices.

### 2×2 Determinant

$$\det\begin{pmatrix} a & b \\ c & d \end{pmatrix} = ad - bc$$

### 3×3 Determinant (Sarrus' Rule or Cofactor Expansion)

$$\det\begin{pmatrix} a & b & c \\ d & e & f \\ g & h & i \end{pmatrix} = a(ei - fh) - b(di - fg) + c(dh - eg)$$

### Properties

- $\det(AB) = \det(A)\det(B)$
- $\det(A^T) = \det(A)$
- $\det(cA) = c^n\det(A)$ for $n \times n$ matrix
- $\det(A^{-1}) = \frac{1}{\det(A)}$
- $A$ is invertible if and only if $\det(A) \neq 0$

### Geometric Interpretation

- $|\det(A)|$ is the factor by which areas (2D) or volumes (3D) scale
- $\det(A) > 0$: orientation preserved
- $\det(A) < 0$: orientation reversed

## Matrix Inverse

The [inverse](https://mathworld.wolfram.com/MatrixInverse.html) of a square matrix $A$ (if it exists) is the matrix $A^{-1}$ such that: $$AA^{-1} = A^{-1}A = I$$

### 2×2 Inverse

$$\begin{pmatrix} a & b \\ c & d \end{pmatrix}^{-1} = \frac{1}{ad - bc}\begin{pmatrix} d & -b \\ -c & a \end{pmatrix}$$

### Properties

- $(A^{-1})^{-1} = A$
- $(AB)^{-1} = B^{-1}A^{-1}$
- $(A^T)^{-1} = (A^{-1})^T$
- $(cA)^{-1} = \frac{1}{c}A^{-1}$

### Singular Matrices

A matrix is [singular](https://mathworld.wolfram.com/SingularMatrix.html) (non-invertible) if $\det(A) = 0$.

## Systems of Linear Equations

A system of linear equations can be written as: $$A\mathbf{x} = \mathbf{b}$$

### Solution Methods

**Direct solution (if $A$ is invertible):** $$\mathbf{x} = A^{-1}\mathbf{b}$$

**Gaussian elimination:** Row reduce the augmented matrix $[A | \mathbf{b}]$

**Cramer's rule:** For $n \times n$ system with $\det(A) \neq 0$: $$x_i = \frac{\det(A_i)}{\det(A)}$$ where $A_i$ has column $i$ replaced by $\mathbf{b}$

### Types of Solutions

- **Unique solution:** $\det(A) \neq 0$
- **No solution:** System is inconsistent
- **Infinitely many solutions:** System is underdetermined

## Eigenvalues and Eigenvectors

An [eigenvector](https://mathworld.wolfram.com/Eigenvector.html) $\mathbf{v}$ of matrix $A$ satisfies: $$A\mathbf{v} = \lambda\mathbf{v}$$ where $\lambda$ is the [eigenvalue](https://mathworld.wolfram.com/Eigenvalue.html).

### Finding Eigenvalues

Eigenvalues are roots of the [characteristic polynomial](https://mathworld.wolfram.com/CharacteristicPolynomial.html): $$\det(A - \lambda I) = 0$$

### Properties

- Sum of eigenvalues = trace of $A$ = $\sum a_{ii}$
- Product of eigenvalues = $\det(A)$
- Symmetric matrices have real eigenvalues
- Orthogonal matrices have eigenvalues with $|\lambda| = 1$

### Diagonalization

A matrix $A$ is [diagonalizable](https://mathworld.wolfram.com/MatrixDiagonalization.html) if: $$A = PDP^{-1}$$

where $D$ is diagonal (eigenvalues) and $P$ has eigenvectors as columns.

## Matrix Decompositions

### LU Decomposition

$$A = LU$$

where $L$ is lower triangular and $U$ is upper triangular.

### QR Decomposition

$$A = QR$$

where $Q$ is orthogonal and $R$ is upper triangular.

### Singular Value Decomposition (SVD)

$$A = U\Sigma V^T$$

where $U$ and $V$ are orthogonal and $\Sigma$ is diagonal with [singular values](https://mathworld.wolfram.com/SingularValue.html).

## Rank and Nullity

### Rank

The [rank](https://mathworld.wolfram.com/MatrixRank.html) of a matrix is:

- Number of linearly independent rows (= number of linearly independent columns)
- Dimension of the column space (image)
- Number of non-zero rows in row echelon form

### Nullity

The [nullity](https://mathworld.wolfram.com/Nullity.html) is the dimension of the null space (kernel).

### Rank-Nullity Theorem

For an $m \times n$ matrix $A$: $$\text{rank}(A) + \text{nullity}(A) = n$$

## Applications

### Computer Graphics

- Transformation matrices for 3D rendering
- Homogeneous coordinates for perspective

### Data Science

- Covariance matrices
- Principal Component Analysis
- Linear regression (normal equations)

### Physics

- Moment of inertia tensor
- Stress-strain relationships
- Quantum mechanics operators

### Engineering

- Circuit analysis (impedance matrices)
- Control systems (state-space representation)
- Structural analysis (stiffness matrices)

## See Also

- [Vectors](01 Vectors.md) - Vector operations
- [Linear Transformations](03 Linear Transformations.md) - Geometric interpretation
- [Lines](02 Lines.md) - Systems of equations geometrically
