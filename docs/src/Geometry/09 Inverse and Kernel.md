# Inverse Matrices and Kernels

The [matrix inverse](https://mathworld.wolfram.com/MatrixInverse.html) and [kernel](https://mathworld.wolfram.com/Kernel.html) (also called [null space](https://mathworld.wolfram.com/NullSpace.html)) are fundamental concepts that reveal when [linear systems](08 Linear Systems.md) have unique solutions. This section builds on the matrix concepts from [Matrices and Maps](07 Matrices and Maps.md) to explore inverse transformations and their relationship to homogeneous systems.

## Inverse Transformations

### The Concept of Undoing a Map

Recall from [Linear Systems](08 Linear Systems.md) that a linear system can be written as:

$$A \mathbf{u} = \mathbf{b}$$

The matrix $A$ maps $\mathbf{u}$ to $\mathbf{b}$. A natural question arises: what matrix $B$ maps $\mathbf{b}$ back to $\mathbf{u}$? In other words, what matrix _undoes_ the linear map?

$$\mathbf{u} = B \mathbf{b}$$

This matrix $B$ is called the _inverse map_, and finding it reveals deep connections between matrix operations and solving linear systems.

### Building the Inverse Through Elementary Operations

In [Linear Systems](08 Linear Systems.md), we used shear transformations to solve systems. Let's revisit how these operations lead to the inverse matrix.

Consider the system:

$$\begin{bmatrix} 2 & 4 \\ 1 & 6 \end{bmatrix} \begin{bmatrix} u_1 \\ u_2 \end{bmatrix} = \begin{bmatrix} 4 \\ 4 \end{bmatrix}$$

**Step 1: First Shear**

Apply the shear $S_1$ to eliminate the element below the first pivot:

$$S_1 = \begin{bmatrix} 1 & 0 \\ -\frac{1}{2} & 1 \end{bmatrix}$$

After applying $S_1$, the system becomes:

$$\begin{bmatrix} 2 & 4 \\ 0 & 4 \end{bmatrix} \begin{bmatrix} u_1 \\ u_2 \end{bmatrix} = \begin{bmatrix} 4 \\ 2 \end{bmatrix}$$

**Step 2: Second Shear**

Apply shear $S_2$ to zero the upper right element:

$$S_2 = \begin{bmatrix} 1 & -1 \\ 0 & 1 \end{bmatrix}$$

The system becomes:

$$\begin{bmatrix} 2 & 0 \\ 0 & 4 \end{bmatrix} \begin{bmatrix} u_1 \\ u_2 \end{bmatrix} = \begin{bmatrix} 2 \\ 2 \end{bmatrix}$$

**Step 3: Scaling to Identity**

Apply a non-uniform scaling $S_3$ to transform the diagonal matrix to the identity:

$$S_3 = \begin{bmatrix} \frac{1}{2} & 0 \\ 0 & \frac{1}{4} \end{bmatrix}$$

The final system is:

$$\begin{bmatrix} 1 & 0 \\ 0 & 1 \end{bmatrix} \begin{bmatrix} u_1 \\ u_2 \end{bmatrix} = \begin{bmatrix} 1 \\ \frac{1}{2} \end{bmatrix}$$

### The Identity Matrix

The matrix on the left is now the [identity matrix](https://mathworld.wolfram.com/IdentityMatrix.html):

$$I = \begin{bmatrix} 1 & 0 \\ 0 & 1 \end{bmatrix}$$

This matrix leaves any vector unchanged: $I \mathbf{v} = \mathbf{v}$ for all vectors $\mathbf{v}$.

### Deriving the Inverse Matrix

The sequence of operations transformed $A$ into $I$:

$$S_3 S_2 S_1 A = I$$

Therefore, the solution is:

$$\mathbf{u} = S_3 S_2 S_1 \mathbf{b}$$

This product of elementary matrices gives us the _inverse matrix_ $A^{-1}$:

$$A^{-1} = S_3 S_2 S_1$$

The inverse matrix undoes the effect of $A$: the vector $\mathbf{u}$ is mapped to $\mathbf{b}$ by $A$, and $\mathbf{b}$ is mapped back to $\mathbf{u}$ by $A^{-1}$:

$$\mathbf{u} = A^{-1} \mathbf{b}$$

If this transformation can be achieved, the matrix $A$ is called _[invertible](https://mathworld.wolfram.com/InvertibleMatrixTheorem.html)_ (or _nonsingular_).

### Worked Example: Computing the Inverse

```julia
# Define the original matrix and vector
julia> a₁ = [2, 1]
2-element Vector{Int64}:
 2
 1

julia> a₂ = [4, 6]
2-element Vector{Int64}:
 4
 6

julia> A = [a₁ a₂]
2×2 Matrix{Int64}:
 2  4
 1  6

julia> b = [4, 4]
2-element Vector{Int64}:
 4
 4

# Define the elementary matrices
julia> S₁ = [1 0; -1/2 1]
2×2 Matrix{Float64}:
  1.0  0.0
 -0.5  1.0

julia> S₂ = [1 -1; 0 1]
2×2 Matrix{Int64}:
 1  -1
 0   1

julia> S₃ = [1/2 0; 0 1/4]
2×2 Matrix{Float64}:
 0.5  0.0
 0.0  0.25

# Compute the inverse as the product of elementary matrices
julia> B = S₃ * S₂ * S₁
2×2 Matrix{Float64}:
  0.75   -0.5
 -0.125   0.25

# Verify B is the inverse of A
julia> B == inv(A)
true

# Solve the system using the inverse
julia> u = B * b
2-element Vector{Float64}:
 1.0
 0.5

# Verify the solution
julia> A * u == b
true
```

## Properties of the Inverse Matrix

### Fundamental Identity

The defining property of an inverse matrix is:

$$A^{-1} A = I \quad \text{and} \quad A A^{-1} = I$$

This makes intuitive sense: the actions of a matrix and its inverse cancel out, leaving the identity transformation.

### Uniqueness

If $A^{-1}$ exists, then it is _unique_. There is exactly one matrix that serves as the inverse.

### Inverse of the Identity

The inverse of the identity matrix is itself:

$$I^{-1} = I$$

### Inverse of a Scaling Matrix

For a diagonal scaling matrix, the inverse simply inverts each scaling factor:

$$\begin{bmatrix} s & 0 \\ 0 & t \end{bmatrix}^{-1} = \begin{bmatrix} \frac{1}{s} & 0 \\ 0 & \frac{1}{t} \end{bmatrix}$$

This requires $s \neq 0$ and $t \neq 0$.

### Inverse of a Product

The inverse of a product reverses the order:

$$(AB)^{-1} = B^{-1} A^{-1}$$

### Formula for 2×2 Matrix Inverse

For a general 2×2 matrix, the inverse has a closed form:

$$\begin{bmatrix} a & b \\ c & d \end{bmatrix}^{-1} = \frac{1}{ad - bc} \begin{bmatrix} d & -b \\ -c & a \end{bmatrix}$$

The quantity $ad - bc$ is the [determinant](https://mathworld.wolfram.com/Determinant.html). The inverse exists if and only if the determinant is non-zero.

### Geometric Interpretation

The following examples illustrate how matrices and their inverses affect shapes:

**Scaling and Its Inverse**

A vertical scaling by factor $0.5$:

$$A = \begin{bmatrix} 1 & 0 \\ 0 & 0.5 \end{bmatrix}$$

has inverse:

$$A^{-1} = \begin{bmatrix} 1 & 0 \\ 0 & 2 \end{bmatrix}$$

Applying $A$ then $A^{-1}$ (or $A^{-1}$ then $A$) returns any shape to its original form.

**Shear and Its Inverse**

A horizontal shear:

$$A = \begin{bmatrix} 1 & 1 \\ 0 & 1 \end{bmatrix}$$

has inverse:

$$A^{-1} = \begin{bmatrix} 1 & -1 \\ 0 & 1 \end{bmatrix}$$

The inverse shear simply reverses the shearing direction.

## Homogeneous Systems

### Definition

A [homogeneous system](https://mathworld.wolfram.com/LinearSystemofEquations.html) is a linear system where the right-hand side is the zero vector:

$$A \mathbf{u} = \mathbf{0}$$

### The Trivial Solution

The zero vector is always a solution, called the _trivial solution_:

$$A \mathbf{0} = \mathbf{0}$$

Since we are guaranteed at least this solution, a homogeneous system is always _consistent_ (it always has at least one solution).

### Non-Trivial Solutions

If a homogeneous system has a non-trivial solution $\mathbf{u}$, then all scalar multiples $c\mathbf{u}$ are also solutions:

$$A(c\mathbf{u}) = c(A\mathbf{u}) = c \cdot \mathbf{0} = \mathbf{0}$$

Therefore, if a non-trivial solution exists, there are _infinitely many_ solutions.

### When Do Non-Trivial Solutions Exist?

A homogeneous system has non-trivial solutions if and only if the columns of $A$ are _linearly dependent_. For a 2×2 matrix, this means the columns are parallel.

Conversely, if the system has only the trivial solution, then the matrix $A$ is _invertible_.

### Worked Example: Homogeneous System

Consider the system with linearly dependent columns:

$$\begin{bmatrix} 1 & 2 \\ 2 & 4 \end{bmatrix} \begin{bmatrix} u_1 \\ u_2 \end{bmatrix} = \begin{bmatrix} 0 \\ 0 \end{bmatrix}$$

```julia
julia> a₁ = [1, 2]
2-element Vector{Int64}:
 1
 2

julia> a₂ = [2, 4]
2-element Vector{Int64}:
 2
 4

julia> A = [a₁ a₂]
2×2 Matrix{Int64}:
 1  2
 2  4

julia> b = [0, 0]
2-element Vector{Int64}:
 0
 0

# Apply forward elimination
julia> S₁ = [1.0 0.0; -2.0 1.0]
2×2 Matrix{Float64}:
  1.0  0.0
 -2.0  1.0

julia> a₁′ = S₁ * a₁
2-element Vector{Float64}:
 1.0
 0.0

julia> a₂′ = S₁ * a₂
2-element Vector{Float64}:
 2.0
 0.0

julia> b′ = S₁ * b
2-element Vector{Float64}:
 0.0
 0.0

# The second row is all zeros, so u₂ is free
# Choosing u₂ = 1:
julia> u₂ = 1
1

# Back substitution: u₁ = (1/a₁′[1]) * (b′[1] - u₂ * a₂′[1])
julia> u₁ = (1 / a₁′[1]) * (b′[1] - (u₂ * a₂′[1]))
-2.0
```

The general solution is $\mathbf{u} = c \begin{bmatrix} -2 \\ 1 \end{bmatrix}$ for any scalar $c$.

## The Kernel (Null Space)

### Definition

The [kernel](https://mathworld.wolfram.com/Kernel.html) (also called the [null space](https://mathworld.wolfram.com/NullSpace.html)) of a matrix $A$ is the set of all vectors that satisfy the homogeneous system:

$$\text{Ker}(A) = \{ \mathbf{u} : A\mathbf{u} = \mathbf{0} \}$$

The word "kernel" means the central, most important part of something. In linear algebra, the kernel reveals fundamental information about a linear map and the solutions to linear systems.

### Properties of the Kernel

The kernel is a _subspace_ of the domain, meaning it satisfies three key properties:

1. **Contains the zero vector**: Since $A\mathbf{0} = \mathbf{0}$, the zero vector is always in the kernel.

2. **Closed under scalar multiplication**: If $\mathbf{u}$ is in the kernel, then $c\mathbf{u}$ is also in the kernel:
   $$A(c\mathbf{u}) = c(A\mathbf{u}) = c \cdot \mathbf{0} = \mathbf{0}$$

3. **Closed under addition**: If $\mathbf{u}$ and $\mathbf{v}$ are in the kernel, then $\mathbf{u} + \mathbf{v}$ is in the kernel:
   $$A(\mathbf{u} + \mathbf{v}) = A\mathbf{u} + A\mathbf{v} = \mathbf{0} + \mathbf{0} = \mathbf{0}$$

### Nullity and the Rank-Nullity Theorem

The dimension of the kernel is called the _[nullity](https://mathworld.wolfram.com/Nullity.html)_ of $A$. For 2×2 matrices, the [rank-nullity theorem](https://mathworld.wolfram.com/Rank-NullityTheorem.html) states:

$$\text{rank} + \text{nullity} = 2$$

This means:
- If rank = 2 (full rank), then nullity = 0, and the kernel contains only the zero vector
- If rank = 1, then nullity = 1, and the kernel is a line through the origin

### Orthogonality to Row Space

A vector $\mathbf{u}$ satisfying $A\mathbf{u} = \mathbf{0}$ is orthogonal to every row of $A$. The rows of $A$ span the _row space_, so the kernel is orthogonal to the row space.

## Relationship Between Inverse and Kernel

### The Key Connection

The existence of an inverse is directly related to the kernel:

> **A matrix $A$ is invertible if and only if its kernel contains only the zero vector.**

This is because:
- If $\text{Ker}(A) = \{\mathbf{0}\}$, then $A\mathbf{u} = \mathbf{b}$ has at most one solution for any $\mathbf{b}$
- For a square matrix, this means exactly one solution exists, given by $\mathbf{u} = A^{-1}\mathbf{b}$

### Using the Kernel to Understand Solution Sets

The kernel helps determine existence and uniqueness of solutions:

| Kernel | Nullity | System $A\mathbf{u} = \mathbf{b}$ |
|--------|---------|-----------------------------------|
| Only $\mathbf{0}$ | 0 | Unique solution (if consistent) |
| Non-trivial | ≥ 1 | Infinitely many solutions (if consistent) |

### Worked Example: General Solution Using Kernel

Consider the system:

$$\begin{bmatrix} 2 & 1 \\ 4 & 2 \end{bmatrix} \begin{bmatrix} u_1 \\ u_2 \end{bmatrix} = \begin{bmatrix} 3 \\ 6 \end{bmatrix}$$

The matrix has rank 1 (the rows are proportional), so nullity = 1.

**Step 1: Find a Particular Solution**

By inspection or elimination, one particular solution is:

$$\mathbf{u}_s = \begin{bmatrix} 1 \\ 1 \end{bmatrix}$$

We can verify: $2(1) + 1(1) = 3$ ✓ and $4(1) + 2(1) = 6$ ✓

**Step 2: Find the Kernel**

Solve the homogeneous system:

$$\begin{bmatrix} 2 & 1 \\ 4 & 2 \end{bmatrix} \begin{bmatrix} u_1 \\ u_2 \end{bmatrix} = \begin{bmatrix} 0 \\ 0 \end{bmatrix}$$

The kernel is spanned by:

$$\mathbf{u}_k = \begin{bmatrix} -\frac{1}{2} \\ 1 \end{bmatrix}$$

**Step 3: General Solution**

The general solution is the particular solution plus any kernel vector:

$$\mathbf{u} = \mathbf{u}_s + c\mathbf{u}_k = \begin{bmatrix} 1 \\ 1 \end{bmatrix} + c \begin{bmatrix} -\frac{1}{2} \\ 1 \end{bmatrix}$$

for any scalar $c$.

**Verification with $c = 2$:**

$$\mathbf{u} = \begin{bmatrix} 1 \\ 1 \end{bmatrix} + 2 \begin{bmatrix} -\frac{1}{2} \\ 1 \end{bmatrix} = \begin{bmatrix} 0 \\ 3 \end{bmatrix}$$

Check: $\begin{bmatrix} 2 & 1 \\ 4 & 2 \end{bmatrix} \begin{bmatrix} 0 \\ 3 \end{bmatrix} = \begin{bmatrix} 3 \\ 6 \end{bmatrix}$ ✓

### Why This Works

The general solution formula works because of linearity:

$$A(\mathbf{u}_s + c\mathbf{u}_k) = A\mathbf{u}_s + cA\mathbf{u}_k = \mathbf{b} + c \cdot \mathbf{0} = \mathbf{b}$$

The kernel contributes $\mathbf{0}$ when multiplied by $A$, so adding any kernel vector to a particular solution yields another solution.

## Summary

| Concept | Definition | Key Property |
|---------|------------|--------------|
| Inverse $A^{-1}$ | Matrix such that $A^{-1}A = AA^{-1} = I$ | Exists iff $\det(A) \neq 0$ |
| Invertible | Matrix with an inverse | Unique solution to $A\mathbf{u} = \mathbf{b}$ |
| Kernel | Set $\{\mathbf{u} : A\mathbf{u} = \mathbf{0}\}$ | Always a subspace |
| Nullity | Dimension of kernel | Number of free parameters |
| Homogeneous | System with $\mathbf{b} = \mathbf{0}$ | Always consistent |

**The Central Theorem**: A matrix is invertible if and only if its kernel is trivial (contains only $\mathbf{0}$).

```julia
using LinearAlgebra

# Example: Invertible matrix (trivial kernel)
julia> A = [2 4; 1 6]
2×2 Matrix{Int64}:
 2  4
 1  6

julia> det(A)
8

julia> nullspace(A)
2×0 Matrix{Float64}  # Empty - only trivial solution

julia> inv(A)
2×2 Matrix{Float64}:
  0.75  -0.5
 -0.125  0.25

# Example: Non-invertible matrix (non-trivial kernel)
julia> B = [1 2; 2 4]
2×2 Matrix{Int64}:
 1  2
 2  4

julia> det(B)
0

julia> nullspace(B)
2×1 Matrix{Float64}:
 -0.894427
  0.447214  # Non-empty - kernel is a line
```
