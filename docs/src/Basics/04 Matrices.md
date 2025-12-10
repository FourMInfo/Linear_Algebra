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

## Row Operations

[Elementary row operations](https://mathworld.wolfram.com/ElementaryRowOperation.html) are the fundamental tools for solving systems of linear equations. There are three types:

1. **Row swapping:** $R_i \leftrightarrow R_j$ — exchange two rows
2. **Row scaling:** $kR_i \rightarrow R_i$ (where $k \neq 0$) — multiply a row by a non-zero scalar
3. **Row addition:** $R_i + kR_j \rightarrow R_i$ — add a multiple of one row to another

These operations do not change the solution set of the system.

### Row Echelon Form

A matrix is in [row echelon form](https://mathworld.wolfram.com/RowEchelonForm.html) (REF) if:

- All zero rows are at the bottom
- The leading entry (pivot) of each non-zero row is to the right of the pivot above it
- All entries below a pivot are zero

### Reduced Row Echelon Form

A matrix is in [reduced row echelon form](https://mathworld.wolfram.com/ReducedRowEchelonForm.html) (RREF) if it is in REF and additionally:

- Each pivot is 1
- Each pivot is the only non-zero entry in its column

## Systems of Linear Equations

A system of linear equations can be written as: $$A\mathbf{x} = \mathbf{b}$$

### Matrix Representation

The system:

$$\begin{aligned}
a_{11}x_1 + a_{12}x_2 + \cdots + a_{1n}x_n &= b_1 \\
a_{21}x_1 + a_{22}x_2 + \cdots + a_{2n}x_n &= b_2 \\
\vdots \\
a_{m1}x_1 + a_{m2}x_2 + \cdots + a_{mn}x_n &= b_m
\end{aligned}$$

can be written as $A\mathbf{x} = \mathbf{b}$ where $A$ is the coefficient matrix, $\mathbf{x}$ is the vector of unknowns, and $\mathbf{b}$ is the constant vector.

### Augmented Matrix

The [augmented matrix](https://mathworld.wolfram.com/AugmentedMatrix.html) $[A | \mathbf{b}]$ combines the coefficient matrix and constant vector:

$$\left[\begin{array}{cccc|c}
a_{11} & a_{12} & \cdots & a_{1n} & b_1 \\
a_{21} & a_{22} & \cdots & a_{2n} & b_2 \\
\vdots & \vdots & \ddots & \vdots & \vdots \\
a_{m1} & a_{m2} & \cdots & a_{mn} & b_m
\end{array}\right]$$

### Solution Methods

**Direct solution (if $A$ is invertible):** $$\mathbf{x} = A^{-1}\mathbf{b}$$

**Gaussian elimination:** Row reduce the augmented matrix $[A | \mathbf{b}]$ to row echelon form, then use back-substitution.

**Gauss-Jordan elimination:** Row reduce to reduced row echelon form; the solution can be read directly.

**Cramer's rule:** For $n \times n$ system with $\det(A) \neq 0$: $$x_i = \frac{\det(A_i)}{\det(A)}$$ where $A_i$ has column $i$ replaced by $\mathbf{b}$.

### Cramer's Rule Example

Solve the system:

$$\begin{aligned}
2x + y &= 5 \\
x - y &= 1
\end{aligned}$$

The coefficient matrix and constant vector are: $A = \begin{bmatrix} 2 & 1 \\ 1 & -1 \end{bmatrix}$, $\mathbf{b} = \begin{bmatrix} 5 \\ 1 \end{bmatrix}$

**Step 1:** Calculate $\det(A) = 2(-1) - 1(1) = -3$

**Step 2:** Form $A_x$ by replacing column 1 with $\mathbf{b}$: $A_x = \begin{bmatrix} 5 & 1 \\ 1 & -1 \end{bmatrix}$

$\det(A_x) = 5(-1) - 1(1) = -6$

**Step 3:** Form $A_y$ by replacing column 2 with $\mathbf{b}$: $A_y = \begin{bmatrix} 2 & 5 \\ 1 & 1 \end{bmatrix}$

$\det(A_y) = 2(1) - 5(1) = -3$

**Step 4:** Apply Cramer's rule: $x = \frac{\det(A_x)}{\det(A)} = \frac{-6}{-3} = 2$, $y = \frac{\det(A_y)}{\det(A)} = \frac{-3}{-3} = 1$

**Solution:** $(x, y) = (2, 1)$

### Matrix Inverse Method Example

For the system $A\mathbf{x} = \mathbf{b}$ where $A = \begin{bmatrix} 2 & 1 \\ 1 & -1 \end{bmatrix}$, $\mathbf{b} = \begin{bmatrix} 5 \\ 1 \end{bmatrix}$

**Step 1:** Find $A^{-1}$ using the 2×2 inverse formula

$$A^{-1} = \frac{1}{\det(A)} \begin{bmatrix} -1 & -1 \\ -1 & 2 \end{bmatrix} = \frac{1}{-3} \begin{bmatrix} -1 & -1 \\ -1 & 2 \end{bmatrix} = \begin{bmatrix} \frac{1}{3} & \frac{1}{3} \\ \frac{1}{3} & -\frac{2}{3} \end{bmatrix}$$

**Step 2:** Calculate $\mathbf{x} = A^{-1}\mathbf{b}$

$$\mathbf{x} = \begin{bmatrix} \frac{1}{3} & \frac{1}{3} \\ \frac{1}{3} & -\frac{2}{3} \end{bmatrix} \begin{bmatrix} 5 \\ 1 \end{bmatrix} = \begin{bmatrix} \frac{5}{3} + \frac{1}{3} \\ \frac{5}{3} - \frac{2}{3} \end{bmatrix} = \begin{bmatrix} 2 \\ 1 \end{bmatrix}$$

**Solution:** $(x, y) = (2, 1)$

### Gaussian Elimination Example

Solve the system:

$$\begin{aligned}
x + 2y + z &= 9 \\
2x + y - z &= 3 \\
3x - y + 2z &= 8
\end{aligned}$$

**Step 1:** Write the augmented matrix

$$\left[\begin{array}{ccc|c}
1 & 2 & 1 & 9 \\
2 & 1 & -1 & 3 \\
3 & -1 & 2 & 8
\end{array}\right]$$

**Step 2:** Eliminate below the first pivot ($R_2 - 2R_1$, $R_3 - 3R_1$)

$$\left[\begin{array}{ccc|c}
1 & 2 & 1 & 9 \\
0 & -3 & -3 & -15 \\
0 & -7 & -1 & -19
\end{array}\right]$$

**Step 3:** Eliminate below the second pivot ($R_3 - \frac{7}{3}R_2$)

$$\left[\begin{array}{ccc|c}
1 & 2 & 1 & 9 \\
0 & -3 & -3 & -15 \\
0 & 0 & 6 & 16
\end{array}\right]$$

**Step 4:** Back-substitution

- From row 3: $6z = 16 \Rightarrow z = \frac{8}{3}$
- From row 2: $-3y - 3z = -15 \Rightarrow y = 5 - z = \frac{7}{3}$
- From row 1: $x + 2y + z = 9 \Rightarrow x = 9 - 2y - z = \frac{5}{3}$

**Solution:** $(x, y, z) = \left(\frac{5}{3}, \frac{7}{3}, \frac{8}{3}\right)$

### Types of Solutions

- **Unique solution:** The coefficient matrix has full rank ($\det(A) \neq 0$ for square systems)
- **No solution:** System is inconsistent — the augmented matrix has a row $[0, 0, \ldots, 0 | c]$ where $c \neq 0$
- **Infinitely many solutions:** System is underdetermined — there are free variables (fewer pivots than unknowns)

**Example (Infinitely Many Solutions):**

$$\begin{aligned}
x + 2y + z &= 3 \\
2x + 4y + 2z &= 6
\end{aligned}$$

The second equation is twice the first, so we have infinitely many solutions: $$\mathbf{x} = \begin{bmatrix} 3 - 2s - t \\ s \\ t \end{bmatrix}$$ where $s$ and $t$ are free parameters.

### Homogeneous Systems

A [homogeneous system](https://mathworld.wolfram.com/HomogeneousLinearSystem.html) has the form $A\mathbf{x} = \mathbf{0}$. Such systems always have at least the trivial solution $\mathbf{x} = \mathbf{0}$.

Non-trivial solutions exist if and only if $\det(A) = 0$ (the matrix is singular), which occurs when the system has free variables.

**Example (Homogeneous System):**

$$\begin{aligned}
x + 2y - z &= 0 \\
2x + 4y - 2z &= 0 \\
x + 2y - z &= 0
\end{aligned}$$

Since all equations are equivalent, the solution space is: $$\mathbf{x} = \begin{bmatrix} -2s + t \\ s \\ t \end{bmatrix}$$ where $s$ and $t$ are free parameters.

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
