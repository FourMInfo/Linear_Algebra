# Matrices

[Matrices](https://mathworld.wolfram.com/Matrix.html) are rectangular arrays of numbers that represent linear transformations and systems of linear equations. They are central to linear algebra and have applications throughout mathematics, science, and engineering.

## Definition and Notation

A [matrix](https://mathworld.wolfram.com/Matrix.html) is a rectangular array of numbers arranged in rows and columns. An $m \times n$ matrix has $m$ rows and $n$ columns:

$$A_{m \times n} = \begin{pmatrix}
a_{11} & a_{12} & \cdots & a_{1n} \\
a_{21} & a_{22} & \cdots & a_{2n} \\
\vdots & \vdots & \ddots & \vdots \\
a_{m1} & a_{m2} & \cdots & a_{mn}
\end{pmatrix} \in \mathbb{R}^{m \times n}$$

The entry in row $i$ and column $j$ is denoted $a_{ij}$ or $A_{ij}$. The set of all $m \times n$ real matrices is denoted $\mathbb{R}^{m \times n}$ (or $\mathbb{C}^{m \times n}$ for complex entries). In abstract algebra, the alternative notation $M_{m \times n}(\mathbb{R})$ is used to emphasize the ring of entries.

### Special Types of Matrices

- **Square matrix:** $m = n$ (same number of rows and columns)
- **Row vector:** $1 \times n$ matrix
- **Column vector:** $m \times 1$ matrix
- **Zero matrix:** All entries are 0
- **Identity matrix:** Square matrix with 1s on diagonal, 0s elsewhere: $I_n$

## Matrix Operations

### Addition and Subtraction

Matrices of the same dimensions are added (or subtracted) element-wise: $$C = A \pm B \text{ means } c_{ij} = a_{ij} \pm b_{ij}$$

**Important**: Matrices can only be added and subtracted if their row and column numbers match.

**Example:** For two $3 \times 3$ matrices:

$$\begin{pmatrix}
a_{11} & a_{12} & a_{13} \\
a_{21} & a_{22} & a_{23} \\
a_{31} & a_{32} & a_{33}
\end{pmatrix} \pm \begin{pmatrix}
b_{11} & b_{12} & b_{13} \\
b_{21} & b_{22} & b_{23} \\
b_{31} & b_{32} & b_{33}
\end{pmatrix} = \begin{pmatrix}
a_{11} \pm b_{11} & a_{12} \pm b_{12} & a_{13} \pm b_{13} \\
a_{21} \pm b_{21} & a_{22} \pm b_{22} & a_{23} \pm b_{23} \\
a_{31} \pm b_{31} & a_{32} \pm b_{32} & a_{33} \pm b_{33}
\end{pmatrix}$$

### Scalar Multiplication

If you multiply a matrix by a real number $\lambda$ i.e. $\lambda \cdot A$ then each element becomes $\lambda \cdot a_{ij}$

**Example:** For scalar $\lambda$ and a $3 \times 3$ matrix:

$$\lambda \begin{pmatrix}
a_{11} & a_{12} & a_{13} \\
a_{21} & a_{22} & a_{23} \\
a_{31} & a_{32} & a_{33}
\end{pmatrix} = \begin{pmatrix}
\lambda a_{11} & \lambda a_{12} & \lambda a_{13} \\
\lambda a_{21} & \lambda a_{22} & \lambda a_{23} \\
\lambda a_{31} & \lambda a_{32} & \lambda a_{33}
\end{pmatrix}$$

**Key properties:**

If A and B are matrices with m rows and n columns and λ and μ are real numbers, then
the following rules of arithmetic apply:
- Commutative: $A + B = B + A$
- Distributive: $\lambda \cdot (A + B) = \lambda \cdot A + \lambda \cdot B$
- Distributive: $(\lambda + \mu) \cdot A = \lambda \cdot A + \mu \cdot A$

### Matrix Multiplication

Formally, given $A \in \mathbb{R}^{m \times n}$ and $B \in \mathbb{R}^{n \times p}$, the product $C = AB \in \mathbb{R}^{m \times p}$ is defined by:

$$c_{ij} = \sum_{k=1}^{n} a_{ik}b_{kj}, \quad i = 1, \ldots, m, \quad j = 1, \ldots, p$$

**Important**: Matrix multiplication is only defined when the number of columns of $A$ equals the number of rows of $B$ — that is, both matrices share the inner dimension $n$. The resulting matrix takes its rows from $A$ and its columns from $B$.

!!! note "Terminology: "row length" vs "number of rows"
    The _Foundations of Mathematics_ textbook describe this condition as: the **row length** of $A$ must equal the **column length** of $B$. This means the same thing — the "row length" of a matrix is how many entries are in each row, which is the **number of columns**. Similarly, the "column length" is how many entries are in each column, which is the **number of rows**. Don't confuse "row length" (= number of columns) with "number of rows" — they refer to different dimensions.

**Example:** For $A$ ($3 \times 2$) and $B$ ($2 \times 4$), the number of columns of $A$ equals the number of rows of $B$ (both 2), so the product $AB$ is defined and yields a $3 \times 4$ matrix:
$$\begin{aligned}
&\begin{pmatrix}
a_{11} & a_{12} \\
a_{21} & a_{22} \\
a_{31} & a_{32}
\end{pmatrix} \begin{pmatrix}
b_{11} & b_{12} & b_{13} & b_{14} \\
b_{21} & b_{22} & b_{23} & b_{24}
\end{pmatrix} = \\
&\begin{pmatrix}
a_{11}b_{11} + a_{12}b_{21} & a_{11}b_{12} + a_{12}b_{22} & a_{11}b_{13} + a_{12}b_{23} & a_{11}b_{14} + a_{12}b_{24} \\
a_{21}b_{11} + a_{22}b_{21} & a_{21}b_{12} + a_{22}b_{22} & a_{21}b_{13} + a_{22}b_{23} & a_{21}b_{14} + a_{22}b_{24} \\
a_{31}b_{11} + a_{32}b_{21} & a_{31}b_{12} + a_{32}b_{22} & a_{31}b_{13} + a_{32}b_{23} & a_{31}b_{14} + a_{32}b_{24}
\end{pmatrix}
\end{aligned}$$

Note that $BA$ is _not_ defined here, since the number of columns of $B$ (4) does not equal the number of rows of $A$ (3).

If $\mathbf{x}$ is a vector of the same length as the rows of $A$, then the product $A \cdot \mathbf{x}$ is a vector of the same length as the columns of $A$, and is given by:

$$A \cdot \mathbf{x} = \begin{pmatrix}a_{11} & a_{12} & \cdots & a_{1n} \\ a_{21} & a_{22} & \cdots & a_{2n} \\ \vdots & \vdots & \ddots & \vdots \\ a_{m1} & a_{m2} & \cdots & a_{mn}\end{pmatrix} \begin{pmatrix} x_1 \\ x_2 \\ \vdots \\ x_n \end{pmatrix} = \begin{pmatrix} a_{11}x_1 + a_{12}x_2 + \cdots + a_{1n}x_n \\ a_{21}x_1 + a_{22}x_2 + \cdots + a_{2n}x_n \\ \vdots \\ a_{m1}x_1 + a_{m2}x_2 + \cdots + a_{mn}x_n \end{pmatrix}$$

**Key properties:**

- Not commutative: $AB \neq BA$ in general
- Associative: $(AB)C = A(BC)$
- Distributive: $A(B + C) = AB + AC$
- Distributive: $(A + B)C = AC + BC$

### Transpose

The [transpose](https://mathworld.wolfram.com/Transpose.html) $A^T$ swaps rows and columns: $$(A^T)_{ij} = a_{ji}$$

**Properties:**

- Involution: $(A^T)^T = A$
- Distributive: $(A + B)^T = A^T + B^T$
- Reverse order: $(AB)^T = B^T A^T$
- Scalar multiplication: $(cA)^T = cA^T$

## Special Matrix Types

### Diagonal Matrix

A [diagonal matrix](https://mathworld.wolfram.com/DiagonalMatrix.html) has non-zero entries only on the main diagonal:

$$D_{n} = \begin{pmatrix}
d_1 & 0 & \cdots & 0 \\
0 & d_2 & \cdots & 0 \\
\vdots & \vdots & \ddots & \vdots \\
0 & 0 & \cdots & d_n
\end{pmatrix} \in \mathbb{R}^{n \times n}$$

### Identity Matrix

The [identity matrix](https://mathworld.wolfram.com/IdentityMatrix.html) $I_n$ is the $n \times n$ diagonal matrix with 1s on the diagonal and 0s elsewhere:

$$I_n = \begin{pmatrix}
1 & 0 & \cdots & 0 \\
0 & 1 & \cdots & 0 \\
\vdots & \vdots & \ddots & \vdots \\
0 & 0 & \cdots & 1
\end{pmatrix} \in \mathbb{R}^{n \times n}$$

**Key Properties:**
- Identity: $AI = IA = A$
- Diagonal: $I$ is a diagonal matrix

### Symmetric Matrix

A [symmetric matrix](https://mathworld.wolfram.com/SymmetricMatrix.html) equals its transpose: $A = A^T$

This means $a_{ij} = a_{ji}$ for all $i, j$.

### Orthogonal Matrix

An [orthogonal matrix](https://mathworld.wolfram.com/OrthogonalMatrix.html) $Q$ satisfies: $$Q^TQ = QQ^T = I$$

**Properties:**

- Orthonormal columns: Columns are orthonormal vectors
- Transpose is inverse: $Q^{-1} = Q^T$
- Unit determinant: $|\det(Q)| = 1$ (see determinant section below)
- Isometry: Preserves lengths and angles

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

- Multiplicative: $\det(AB) = \det(A)\det(B)$
- Transpose invariant: $\det(A^T) = \det(A)$
- Scalar multiplication: $\det(cA) = c^n\det(A)$ for $n \times n$ matrix
- Inverse: $\det(A^{-1}) = \frac{1}{\det(A)}$
- Invertibility criterion: $A$ is invertible if and only if $\det(A) \neq 0$

### Geometric Interpretation

- scaling factor for  areas (2D) or volumes (3D): $|\det(A)|$
- orientation preserved: $\det(A) > 0$
- orientation reversed: $\det(A) < 0$

## Matrix Inverse

The [inverse](https://mathworld.wolfram.com/MatrixInverse.html) of a square matrix $A$ (if it exists) is the matrix $A^{-1}$ such that: $$AA^{-1} = A^{-1}A = I$$

### 2×2 Inverse

$$\begin{pmatrix} a & b \\ c & d \end{pmatrix}^{-1} = \frac{1}{ad - bc}\begin{pmatrix} d & -b \\ -c & a \end{pmatrix}$$

### Properties

- Involution: $(A^{-1})^{-1} = A$
- Reverse order: $(AB)^{-1} = B^{-1}A^{-1}$
- Transpose commutes: $(A^T)^{-1} = (A^{-1})^T$
- Scalar multiplication: $(cA)^{-1} = \frac{1}{c}A^{-1}$

### Singular Matrices

A matrix is [singular](https://mathworld.wolfram.com/SingularMatrix.html) (non-invertible) if $\det(A) = 0$.

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
- [Analytic Geometry](04 Analytic Geometry.md) - Geometric interpretation and linear transformations
- [Systems of Equations](03 Systems of Equations.md) - Solving systems using matrix methods
- [Lines](../Geometry/02 Lines.md) - Systems of equations geometrically
