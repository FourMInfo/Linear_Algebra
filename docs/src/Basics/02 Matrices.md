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

**Example:** For a $3 \times 2$ matrix:
$$\begin{pmatrix}a_{11} & a_{12} \\
a_{21} & a_{22} \\
a_{31} & a_{32}\end{pmatrix}^T = \begin{pmatrix}a_{11} & a_{21} & a_{31} \\
a_{12} & a_{22} & a_{32}\end{pmatrix}$$

**Properties:**

- Involution: $(A^T)^T = A$
- Distributive: $(A + B)^T = A^T + B^T$
- Reverse order: $(AB)^T = B^T A^T$
- Scalar multiplication: $(cA)^T = cA^T$

## Special Matrix Types

### Special Types of Matrices

There are many special types of matrices with unique properties. Some common ones include:

- **Row vector:** $1 \times n$ matrix
- **Column vector:** $m \times 1$ matrix
- **Zero matrix:** All entries are 0

Below are more details about some important special types of matrices that are frequently encountered.

### Square Matrix

A [square matrix](https://mathworld.wolfram.com/SquareMatrix.html) has the same number of rows and columns: $m = n$. Square matrices are important for many reasons, including the ability to define determinants and inverses.

$$A_{n} = \begin{pmatrix}a_{11} & a_{12} & \cdots & a_{1n} \\
a_{21} & a_{22} & \cdots & a_{2n} \\
\vdots & \vdots & \ddots & \vdots \\
a_{n1} & a_{n2} & \cdots & a_{nn}\end{pmatrix} \in \mathbb{R}^{n \times n}$$

### Diagonal Matrix

A [diagonal matrix](https://mathworld.wolfram.com/DiagonalMatrix.html) is a square matrix that has non-zero entries only on the main diagonal:

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

**Example:**

$$\begin{pmatrix}1 & 2 & 3 \\
2 & 4 & 5 \\
3 & 5 & 6\end{pmatrix}$$

### Orthogonal Matrix

An [orthogonal matrix](https://mathworld.wolfram.com/OrthogonalMatrix.html) $Q$ satisfies: $$Q^TQ = QQ^T = I$$

**Example:**
$$\begin{pmatrix}\cos \theta & -\sin \theta \\
\sin \theta & \cos \theta\end{pmatrix}$$

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

The [determinant](https://mathworld.wolfram.com/Determinant.html) is a scalar value associated with square matrices. The determinant provides important information about the matrix, such as whether it is invertible and how it scales volumes.

### 2×2 Determinant

For a 2×2 matrix $A = \begin{bmatrix} a & b \\ c & d \end{bmatrix}$, the determinant is:

$$\det(A) = \begin{vmatrix} a & b \\ c & d \end{vmatrix} = ad - bc$$

The result is the product of the main diagonal minus the product of the anti-diagonal.

Recall that a set of vectors (or rows/columns of a matrix) is [linearly dependent](01 Vectors.md#Linear-Independence-and-Dependence) if one vector can be expressed as a linear combination of the others. In terms of matrices, this means if the rows (or columns) are linearly dependent, it leads to a determinant of zero.

**Linearly Dependent Example:**

For the matrix $A = \begin{bmatrix} 1 & 2 \\ 2 & 4 \end{bmatrix}$, the rows are linearly dependent because the second row can be expressed as a linear combination of the first row (e.g., $R_2 = 2R_1$). This is reflected in the determinant being zero.

$$\det(A) = (1)(4) - (2)(2) = 4 - 4 = 0$$

**Linearly Independent Example:**

$A = \begin{bmatrix} 3 & 2 \\ 1 & 4 \end{bmatrix}$

$$\det(A) = (3)(4) - (2)(1) = 12 - 2 = 10$$

Since $\det(A) \neq 0$, the rows are linearly independent.

### 3×3 Determinant

For a 3×3 matrix, the determinant is computed by **cofactor expansion** along the first row:

$$\det(A) = \begin{vmatrix} a_{11} & a_{12} & a_{13} \\ a_{21} & a_{22} & a_{23} \\ a_{31} & a_{32} & a_{33} \end{vmatrix} = a_{11}\begin{vmatrix} a_{22} & a_{23} \\ a_{32} & a_{33} \end{vmatrix} - a_{12}\begin{vmatrix} a_{21} & a_{23} \\ a_{31} & a_{33} \end{vmatrix} + a_{13}\begin{vmatrix} a_{21} & a_{22} \\ a_{31} & a_{32} \end{vmatrix}$$

Each 2×2 determinant (called a **minor**) is formed by deleting the row and column of the selected element. The alternating $+, -, +$ signs follow the [cofactor sign pattern](https://mathworld.wolfram.com/Cofactor.html). Expanding each minor using the 2×2 formula gives:

$$\det(A) = a_{11}(a_{22}a_{33} - a_{23}a_{32}) - a_{12}(a_{21}a_{33} - a_{23}a_{31}) + a_{13}(a_{21}a_{32} - a_{22}a_{31})$$

**Example:** $A = \begin{bmatrix} 1 & 2 & 3 \\ 0 & 1 & 4 \\ 2 & 5 & 10 \end{bmatrix}$, where $R_3 = 2R_1 + R_2$, so the rows are linearly dependent.

$$\det(A) = 1\begin{vmatrix} 1 & 4 \\ 5 & 10 \end{vmatrix} - 2\begin{vmatrix} 0 & 4 \\ 2 & 10 \end{vmatrix} + 3\begin{vmatrix} 0 & 1 \\ 2 & 5 \end{vmatrix}$$

$$= 1(10 - 20) - 2(0 - 8) + 3(0 - 2) = -10 + 16 - 6 = 0$$

As expected, $\det(A) = 0$.

### Properties

- Multiplicative: $\det(AB) = \det(A)\det(B)$
- Transpose invariant: $\det(A^T) = \det(A)$
- Scalar multiplication: $\det(cA) = c^n\det(A)$ for $n \times n$ matrix
- Inverse: $\det(A^{-1}) = \frac{1}{\det(A)}$
- Invertibility criterion: $A$ is invertible if and only if $\det(A) \neq 0$

### Geometric Interpretation

- scaling factor for areas (2D) or volumes (3D): $\lvert\det(A)\rvert$
- orientation preserved: $\det(A) > 0$
- orientation reversed: $\det(A) < 0$

## Matrix Inverse

The [inverse](https://mathworld.wolfram.com/MatrixInverse.html) of a square matrix $A$ (if it exists) is the matrix $A^{-1}$ such that: $$AA^{-1} = A^{-1}A = I$$

In simple multiplication we can solve for $x$ in $ax = b$ by dividing both sides by $a$: $x = \frac{b}{a}$. In matrix multiplication, we want something equivalent to $\frac{b}{a}$, and this is where inverse matrices play a role. We can solve for $X$ in $AX = b$ by multiplying both sides by the inverse of $A$: $X = A^{-1}b$. This is only possible if $A$ is invertible.

The matrix $A$ is invertible (nonsingular) if and only if $\det(A) \neq 0$. A matrix is [singular](https://mathworld.wolfram.com/SingularMatrix.html) if $\det(A) = 0$.

### Computing the Inverse

For a $2 \times 2$ matrix $A = \begin{bmatrix} a & b \\ c & d \end{bmatrix}$, the inverse is:

$$A^{-1} = \frac{1}{\det(A)} \begin{bmatrix} d & -b \\ -c & a \end{bmatrix} = \frac{1}{ad - bc} \begin{bmatrix} d & -b \\ -c & a \end{bmatrix}$$

The entries of $A$ are swapped on the main diagonal and negated on the off-diagonal. This only exists when $\det(A) = ad - bc \neq 0$.

For larger matrices, the general approach augments $A$ with the identity to form $\left\lbrack A \mid I \right\rbrack$, then applies Gauss-Jordan elimination to get $\left\lbrack I \mid A^{-1} \right\rbrack$. The key action is that every row operation is applied simultaneously to both sides: when the left block has been fully reduced to $I$, the right block has become $A^{-1}$. 

The example in [Systems of Equations](03 Systems of Equations.md#Matrix-Inverse-Method) uses the closed-form 2×2 formula rather than this augmented approach; computing inverses in full generality is covered in later sections. You can get a sense of what needs to be done, by following the steps of the [Gauss-Jordan elimination method example](03 Systems of Equations.md#Gaussian-Elimination-and-Gauss-Jordan-Elimination).

### Properties

- Involution: $(A^{-1})^{-1} = A$
- Reverse order: $(AB)^{-1} = B^{-1}A^{-1}$
- Transpose commutes: $(A^T)^{-1} = (A^{-1})^T$
- Scalar multiplication: $(cA)^{-1} = \frac{1}{c}A^{-1}$

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
