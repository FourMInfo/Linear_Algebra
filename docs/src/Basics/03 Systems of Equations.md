# Linear Systems of Equations

The system consisting of $m$ linear equations with $n$ unknowns $x_1, \ldots, x_n$:

$$\begin{aligned}
a_{11}x_1 + a_{12}x_2 + \cdots + a_{1n}x_n &= b_1 \\
a_{21}x_1 + a_{22}x_2 + \cdots + a_{2n}x_n &= b_2 \\
&\vdots \\
a_{m1}x_1 + a_{m2}x_2 + \cdots + a_{mn}x_n &= b_m
\end{aligned}$$

where the numbers $a_{ij}$ and $b_i$ are known, is called a [linear system of equations](https://mathworld.wolfram.com/LinearSystemofEquations.html). With the coefficient matrix $A$, the right-side vector $\mathbf{b}$, and the unknown vector $\mathbf{x}$:

$$A = \begin{bmatrix}a_{11} & \cdots & a_{1n} \\ a_{21} & \cdots & a_{2n} \\ \vdots & \ddots & \vdots \\ a_{m1} & \cdots & a_{mn}\end{bmatrix}, \quad
\mathbf{b} = \begin{bmatrix}b_1 \\ b_2 \\ \vdots \\ b_m\end{bmatrix}, \quad
\mathbf{x} = \begin{bmatrix}x_1 \\ x_2 \\ \vdots \\ x_n\end{bmatrix}$$

one writes the system compactly as $A\mathbf{x} = \mathbf{b}$.

## Linear Systems: Algebraic Methods

Before using matrix methods to solve linear systems of equations, basic algebraic techniques provide intuition and work well for small systems.

### Substitution Method

Solve one equation for one variable, then substitute into the other equation(s).

**Example:** Solve the system:

$$\begin{aligned}
2x + y &= 7 \\
x - y &= 2
\end{aligned}$$

1. From the second equation: $x = y + 2$
2. Substitute into the first equation: $2(y + 2) + y = 7$
3. Simplify: $2y + 4 + y = 7 \Rightarrow 3y = 3 \Rightarrow y = 1$
4. Back-substitute: $x = 1 + 2 = 3$
5. **Solution:** $(x, y) = (3, 1)$

### Elimination Method

Add or subtract equations to eliminate one variable. The solution set of a linear system of equations is not changed by the following operations:

 - Multiplication of an equation by a non-zero number (including negative numbers).
 - Adding a multiple of one equation to another (including negative multiples).
 - Swapping two equations.

**Example:** Solve the system:

$$\begin{aligned}
3x + 2y &= 12 \\
2x - y &= 1
\end{aligned}$$

1. Multiply the second equation by 2: $4x - 2y = 2$
2. Add to the first equation: $(3x + 2y) + (4x - 2y) = 12 + 2$
3. Simplify: $7x = 14 \Rightarrow x = 2$
4. Substitute back: $2(2) - y = 1 \Rightarrow y = 3$
5. **Solution:** $(x, y) = (2, 3)$

### Larger Systems (Three or More Variables)

For systems with three or more variables, extend substitution and elimination methods systematically.

**Example:** Solve the system:

$$\begin{aligned}
x + y + z &= 6 \\
2x - y + z &= 3 \\
x + 2y - z &= 1
\end{aligned}$$

**Using Elimination:**

1. Add equations 1 and 3 to eliminate $z$:
   $(x + y + z) + (x + 2y - z) = 6 + 1$
   $2x + 3y = 7$ ... (equation 4)

2. Add equations 2 and 3 to eliminate $z$:
   $(2x - y + z) + (x + 2y - z) = 3 + 1$
   $3x + y = 4$ ... (equation 5)

3. Now solve the 2×2 system of equations 4 and 5:
   From equation 5: $y = 4 - 3x$
   Substitute into equation 4: $2x + 3(4 - 3x) = 7$
   $2x + 12 - 9x = 7$
   $-7x = -5$
   $x = \frac{5}{7}$

4. Find $y$: $y = 4 - 3\left(\frac{5}{7}\right) = 4 - \frac{15}{7} = \frac{13}{7}$

5. Find $z$ using equation 1: $z = 6 - x - y = 6 - \frac{5}{7} - \frac{13}{7} = \frac{24}{7}$

**Solution:** $(x, y, z) = \left(\frac{5}{7}, \frac{13}{7}, \frac{24}{7}\right)$

**Note:** For larger systems, more systematic matrix approaches are described below.

## Linear Systems: Matrix Methods

For a formal treatment of matrices and their operations, see [Matrices](02 Matrices.md). This section covers how matrices are used to solve systems of linear equations.

A system of linear equations can be written in matrix form as: $$A\mathbf{x} = \mathbf{b}$$

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

The [augmented matrix](https://mathworld.wolfram.com/AugmentedMatrix.html) $\left\lbrack A \mid \mathbf{b}\right\rbrack$ combines the coefficient matrix and constant vector:

$$\left[\begin{array}{cccc|c}
a_{11} & a_{12} & \cdots & a_{1n} & b_1 \\
a_{21} & a_{22} & \cdots & a_{2n} & b_2 \\
\vdots & \vdots & \ddots & \vdots & \vdots \\
a_{m1} & a_{m2} & \cdots & a_{mn} & b_m
\end{array}\right]$$

### Row Operations

[Elementary row operations](https://mathworld.wolfram.com/ElementaryRowandColumnOperations.html) are the fundamental tools for solving systems of linear equations. These operations transform the augmented matrix without changing the solution set of the system. There are three types:

1. **Row swapping:** $R_i \leftrightarrow R_j$ — exchange two rows
2. **Row scaling:** $kR_i \rightarrow R_i$ (where $k \neq 0$) — multiply a row by a non-zero scalar
3. **Row addition:** $R_i + kR_j \rightarrow R_i$ — add a multiple of one row to another

#### Row Echelon Form

A matrix is in [row echelon form](https://mathworld.wolfram.com/RowEchelonForm.html) (REF) if:

- All zero rows are at the bottom
- The leading entry (pivot) of each non-zero row is to the right of the pivot above it
- All entries below a pivot are zero

#### Reduced Row Echelon Form

A matrix is in [reduced row echelon form](https://mathworld.wolfram.com/ReducedRowEchelonForm.html) (RREF) if it is in REF and additionally:

- Each pivot is 1
- Each pivot is the only non-zero entry in its column

### Solution Methods

**Gaussian elimination:** Row reduce the augmented matrix $\left\lbrack A \mid \mathbf{b}\right\rbrack$ to row echelon form using the row operations above, then use back-substitution.

**Gauss-Jordan elimination:** Row reduce to reduced row echelon form; the solution can be read directly.

**Cramer's rule:** For $n \times n$ system with $\det(A) \neq 0$: $$x_i = \frac{\det(A_i)}{\det(A)}$$ where $A_i$ has column $i$ replaced by $\mathbf{b}$.

**Direct solution (if $A$ is invertible):** $$\mathbf{x} = A^{-1}\mathbf{b}$$

### Gaussian Elimination and Gauss-Jordan Elimination

Let $A\mathbf{x} = \mathbf{b}$ be a linear system of $n$ equations with $n$ unknowns that has a unique solution. We start with the augmented matrix:

$$\left[\begin{array}{cccc|c}
a_{11} & \cdots & a_{1n} & b_1 \\
a_{21} & \cdots & a_{2n} & b_2 \\
\vdots & & \vdots & \vdots \\
a_{n1} & \cdots & a_{nn} & b_n
\end{array}\right]$$

in which the coefficients of the system and the right-hand side are listed. Then perform the following steps:

**Phase 1 — Forward elimination** (identical for both methods):

1. If $a_{11} = 0$, find a row whose first element is non-zero, swap it with the first row, and rename it. In any case, $a_{11} \neq 0$ is then valid.
2. Subtract a suitable multiple of the first row from the second, third, $\ldots$, last row so that those rows each start with zero. The new matrix then has only zeros in the first column below $a_{11}$.
3. Subtract a suitable multiple of the second row from the third, $\ldots$, last row so that those rows start with zero and also have a zero in the second position. The new matrix then has only zeros in the first column below $a_{11}$ and in the second column below $a_{22}$.
4. Repeat this procedure for the following columns until there are only zeros below the main diagonal elements. The matrix is now in **row echelon form (REF)**.

**Phase 2 — Solving** (the two methods diverge here):

- **Gaussian elimination:** Apply **back-substitution** — solve the last equation directly for the last variable, substitute that value into the second-to-last equation, and work upward row by row until all unknowns are found. No further row operations are needed.

- **Gauss-Jordan elimination:** Continue with **upward elimination** — divide the last row by its pivot so it equals 1, then use row operations to eliminate all entries _above_ each pivot, working from the bottom pivot upward. Repeat for each preceding pivot (dividing the row to get a 1, then clearing above) until the matrix is in **reduced row echelon form (RREF)**:

$$\left[\begin{array}{cccc|c}
1 & 0 & \cdots & 0 & x_1 \\
0 & 1 & \cdots & 0 & x_2 \\
\vdots & & \ddots & \vdots & \vdots \\
0 & \cdots & 0 & 1 & x_n
\end{array}\right]$$

The last column then contains the solution directly — no further algebra required.

#### Example

Solve the system:

$$\begin{aligned}
x + 2y + z &= 9 \\
2x + y - z &= 3 \\
3x - y + 2z &= 8
\end{aligned}$$

**Using Gaussian elimination:**

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

**Step 4:** Instead of fully row reducing, we can stop at step 4 and perform  back-substitution

- From row 3: $6z = 16 \Rightarrow z = \frac{8}{3}$
- From row 2: $-3y - 3z = -15 \Rightarrow y = 5 - z = \frac{7}{3}$
- From row 1: $x + 2y + z = 9 \Rightarrow x = 9 - 2y - z = \frac{5}{3}$
**Solution:** $(x, y, z) = \left(\frac{5}{3}, \frac{7}{3}, \frac{8}{3}\right)$

**Using Gauss-Jordan elimination:**

**Step 4:** Divide the last row by 6 to get a pivot of 1 ($R_3 \div 6$)

$$\left[\begin{array}{ccc|c}
1 & 2 & 1 & 9 \\
0 & -3 & -3 & -15 \\
0 & 0 & 1 & \frac{8}{3}
\end{array}\right]$$

**Step 5:** Eliminate above the third pivot ($R_2 + 3R_3$, $R_1 - R_3$)

$$\left[\begin{array}{ccc|c}
1 & 2 & 0 & \frac{19}{3} \\
0 & -3 & 0 & -7 \\
0 & 0 & 1 & \frac{8}{3}
\end{array}\right]$$

**Step 6:** Divide the second row by -3 to get a pivot of 1 ($R_2 \div -3$)

$$\left[\begin{array}{ccc|c}
1 & 2 & 0 & \frac{19}{3} \\
0 & 1 & 0 & \frac{7}{3} \\
0 & 0 & 1 & \frac{8}{3}
\end{array}\right]$$

**Step 7:** Eliminate above the second pivot ($R_1 - 2R_2$)

$$\left[\begin{array}{ccc|c}
1 & 0 & 0 & \frac{5}{3} \\
0 & 1 & 0 & \frac{7}{3} \\
0 & 0 & 1 & \frac{8}{3}
\end{array}\right]$$

**Solution:** $(x, y, z) = \left(\frac{5}{3}, \frac{7}{3}, \frac{8}{3}\right)$

#### Is there a solution? If so, how many?

During forward elimination (the phase common to both methods), the row operations may produce one or more rows with all-zero coefficients. The augmented entry in such a row determines the solution type:

- **No solution:** A row of the form $\left\lbrack 0, 0, \ldots, 0 \mid c \right\rbrack$ with $c \neq 0$ appears. The corresponding equation $0 = c$ is a contradiction, so the system has no solution. No further row reduction is meaningful.

- **Unique solution:** No all-zero coefficient rows arise and the number of pivots equals $n$ (the number of unknowns). The REF last row has a non-zero leading entry. Back-substitution (Gaussian) or continued upward elimination (Gauss-Jordan) then yields a single solution.

- **Infinitely many solutions:** One or more rows reduce to $\left\lbrack 0, 0, \ldots, 0 \mid 0 \right\rbrack$ (consistent but redundant equations). The number of pivots is less than $n$, leaving $n - \text{pivots}$ free variables. The solution is a family parameterised by those free variables.

These three outcomes can be read off from the augmented matrix in REF before any back-substitution or upward elimination takes place, making them detectable at the same intermediate stage regardless of which method is being used. See [Types of Systems](#Types-of-Systems) below for more detail.

### Cramer's Rule

[Cramer's rule](https://mathworld.wolfram.com/CramersRule.html) gives an explicit formula for each unknown in a square $n \times n$ system $A\mathbf{x} = \mathbf{b}$, provided $\det(A) \neq 0$ (i.e. the matrix is invertible).

For each unknown $x_i$, form the matrix $A_i$ by replacing column $i$ of $A$ with the right-hand side vector $\mathbf{b}$, then:

$$x_i = \frac{\det(A_i)}{\det(A)}, \quad i = 1, 2, \ldots, n$$

Because it requires computing $n + 1$ determinants, Cramer's rule is mainly useful for small systems (2×2 or 3×3) or for deriving theoretical results. For larger systems, Gaussian elimination is far more efficient. See [Determinants](02 Matrices.md#Determinant) for how to compute determinants.

#### Example

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

### Matrix Inverse Method

When $A$ is invertible ($\det(A) \neq 0$), multiplying both sides of $A\mathbf{x} = \mathbf{b}$ on the left by $A^{-1}$ gives:

$$A^{-1}A\mathbf{x} = A^{-1}\mathbf{b} \implies \mathbf{x} = A^{-1}\mathbf{b}$$

In practice, computing $A^{-1}$ costs more than a single Gaussian elimination, so this method is mainly useful when the same coefficient matrix $A$ must be solved against many different right-hand sides $\mathbf{b}$. See [Matrix Inverse](02 Matrices.md#Matrix-Inverse) for how to compute $A^{-1}$.

**Example**

For the system $A\mathbf{x} = \mathbf{b}$ where $A = \begin{bmatrix} 2 & 1 \\ 1 & -1 \end{bmatrix}$, $\mathbf{b} = \begin{bmatrix} 5 \\ 1 \end{bmatrix}$

**Step 1:** Find $A^{-1}$ using the 2×2 inverse formula

$$A^{-1} = \frac{1}{\det(A)} \begin{bmatrix} -1 & -1 \\ -1 & 2 \end{bmatrix} = \frac{1}{-3} \begin{bmatrix} -1 & -1 \\ -1 & 2 \end{bmatrix} = \begin{bmatrix} \frac{1}{3} & \frac{1}{3} \\ \frac{1}{3} & -\frac{2}{3} \end{bmatrix}$$

**Step 2:** Calculate $\mathbf{x} = A^{-1}\mathbf{b}$

$$\mathbf{x} = \begin{bmatrix} \frac{1}{3} & \frac{1}{3} \\ \frac{1}{3} & -\frac{2}{3} \end{bmatrix} \begin{bmatrix} 5 \\ 1 \end{bmatrix} = \begin{bmatrix} \frac{5}{3} + \frac{1}{3} \\ \frac{5}{3} - \frac{2}{3} \end{bmatrix} = \begin{bmatrix} 2 \\ 1 \end{bmatrix}$$

**Solution:** $(x, y) = (2, 1)$

## Rank and Nullity

The concepts of rank and nullity formalize _why_ systems fall into the types described [below](#Types-of-Systems).

### Rank

The [rank](https://mathworld.wolfram.com/MatrixRank.html) of a matrix is:

- The number of linearly independent rows (which by the _rank theorem_ equals the number of linearly independent columns)
- The number of non-zero rows (pivots) in row echelon form

The rank determines the nature of the solution: a system $A\mathbf{x} = \mathbf{b}$ with $n$ unknowns has a unique solution when $\text{rank}(A) = n$, infinitely many solutions when $\text{rank}(A) < n$, and no solution when the augmented matrix has higher rank than $A$.

**Example:**

For $A = \begin{bmatrix} 1 & 2 & -1 \\ 2 & 4 & -2 \\ 3 & 1 & 0 \end{bmatrix}$, row-reduce to REF ($R_2 - 2R_1$, then $R_3 - 3R_1$, then swap $R_2 \leftrightarrow R_3$):

$$\begin{bmatrix} 1 & 2 & -1 \\ 0 & -5 & 3 \\ 0 & 0 & 0 \end{bmatrix}$$

Two non-zero rows (two pivots), so $\text{rank}(A) = 2$.

### Nullity

The [nullity](https://mathworld.wolfram.com/Nullity.html) of a matrix is the number of free variables (non-pivot unknowns) in the solution.

**Example:**

Continuing from the rank example above: $A$ has $n = 3$ unknowns but only 2 pivots, so there is $3 - 2 = 1$ free variable, giving $\text{nullity}(A) = 1$.

### Rank-Nullity Theorem

For an $m \times n$ matrix $A$: $$\text{rank}(A) + \text{nullity}(A) = n$$

This means: the number of pivot variables plus the number of free variables always equals the total number of unknowns.

**Example:** For the matrix above: $\text{rank}(A) + \text{nullity}(A) = 2 + 1 = 3 = n$ ✓

## Types of Systems

### Consistent Systems

A system is consistent if it has at least one solution.

- **Unique solution:** Exactly one set of values satisfies all equations. For square systems, this occurs when the coefficient matrix has full rank ($\det(A) \neq 0$).
- **Infinitely many solutions:** A family of solutions exists (often parameterized). This occurs when the system is underdetermined — there are free variables (fewer pivots than unknowns). For square $n \times n$ systems, this requires $\det(A) = 0$ but that does not provide the full picture. For that see the [Rouché–Capelli theorem](#Rank-and-the-Rouché-Capelli-Theorem) section below.

**Example (Infinitely Many Solutions):**

$$\begin{aligned}
x + 2y + z &= 3 \\
2x + 4y + 2z &= 6
\end{aligned}$$

The second equation is twice the first, so we have infinitely many solutions: $$\mathbf{x} = \begin{bmatrix} 3 - 2s - t \\ s \\ t \end{bmatrix}$$ where $s$ and $t$ are free parameters.

### Inconsistent Systems

A system is inconsistent if it has no solution. The equations contradict each other. In matrix terms, the augmented matrix has a row $\left\lbrack 0, 0, \ldots, 0 \mid c \right\rbrack$ where $c \neq 0$. For square systems, an inconsistent system can only occur when $\det(A) = 0$ (since $\det(A) \neq 0$ guarantees a unique solution). However, $\det(A) = 0$ alone does not tell you whether the system is inconsistent or has infinitely many solutions.

### Rank and the Rouché-Capelli Theorem

The **rank** resolves ambiguity between systems. By the [Rouché–Capelli theorem](https://mathworld.wolfram.com/Rouche-CapelliTheorem.html):

- **inconsistent** (no solution): $\text{rank}(A) < \text{rank}(\left\lbrack A \mid \mathbf{b}\right\rbrack)$
- **infinitely many solutions:** $\text{rank}(A) = \text{rank}(\left\lbrack A \mid \mathbf{b}\right\rbrack) < n$
- **unique solution:** $\text{rank}(A) = \text{rank}(\left\lbrack A \mid \mathbf{b}\right\rbrack) = n$

**Example:** The system $x + y = 3$ and $x + y = 5$ has no solution (parallel lines).

### Dependent Systems

A system is **dependent** if the equations are not independent — one equation can be derived from the others. Such systems have infinitely many solutions. For square systems, dependence implies $\det(A) = 0$.

**Example:** The system $x + y = 3$ and $2x + 2y = 6$ has infinitely many solutions (same line).

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

### Julia Best Practice: Check Rank Before Solving

#### `\` vs `pinv` — What They Compute

Both `A \ b` and `pinv(A) * b` aim to solve $A\mathbf{x} = \mathbf{b}$, but they use different algorithms and behave very differently on singular or rank-deficient systems.

**`A \ b` (backslash)**

Dispatches an algorithm based on the *shape* of `A`:

- Square matrix → LU factorisation → exact solution, **or throws `SingularException` if singular**
- Non-square matrix → QR factorisation → least-squares solution minimising $\|A\mathbf{x} - \mathbf{b}\|$

It does not check for singularity first — it simply tries, and fails for square singular matrices.

**`pinv(A) * b` (pseudoinverse)**

Computes the Moore-Penrose pseudoinverse $A^+$ via **Singular Value Decomposition (SVD)**, then multiplies: $\mathbf{x} = A^+\mathbf{b}$.

This always gives the **minimum-norm least-squares** solution — i.e. of all $\mathbf{x}$ that minimise $\|A\mathbf{x} - \mathbf{b}\|$, it returns the one with the smallest $\|\mathbf{x}\|$. It never throws.

#### Comparison

| Scenario | `A \ b` | `pinv(A) * b` |
|---|---|---|
| Unique solution (full-rank square) | ✅ Fast, exact | ✅ Same result, but slower |
| Non-square, full column rank | ✅ Correct least-squares | ✅ Same result, slower |
| Square, singular | ❌ Throws `SingularException` | ✅ Returns min-norm least-squares |
| Underdetermined (infinite solutions) | ✅ Non-square only; ❌ square singular throws | ✅ Always gives minimum-norm solution |
| Algorithm | LU or QR — fast, $O(n^3)$ | SVD — slower, $O(mn^2)$ or $O(m^2n)$ |
| Numerical stability | Good for well-conditioned systems | Better for ill-conditioned / rank-deficient |
| Multiple right-hand sides | `A \ B` handles matrix `B` directly | Must recompute or cache `pinv(A)` |

#### Why Two Options Exist

`\` is designed for **performance in the common case**: when the system is well-posed and full-rank (by far the most frequent case in practice), LU/QR is significantly faster than SVD. Julia's `\` dispatches the fastest correct algorithm for each matrix shape.

`pinv` is designed for **robustness when rank is unknown or deficient**: SVD reveals the matrix's rank structure and handles all cases uniformly — square or non-square, full rank or rank-deficient, consistent or inconsistent — without throwing. The cost is roughly 3–10× slower.

For an $n \times n$ system as a rough guide:

$$\text{backslash (LU):} \approx \tfrac{2}{3}n^3 \text{ flops} \qquad \text{pinv (SVD):} \approx 6n^3 \text{ flops}$$

#### The Recommended Pattern

Check rank first, then choose the appropriate solver:

- **Inconsistent** → use `pinv(A) * b` (least-squares minimiser of $\|A\mathbf{x} - \mathbf{b}\|$); confirm with residual `norm(A*x - b) > 0`
- **Underdetermined** → use `pinv(A) * b` (minimum-norm solution: smallest $\|\mathbf{x}\|$ among all solutions)
- **Unique** → use `A \ b`

```julia
using LinearAlgebra

r_A  = rank(A)
r_Ab = rank([A b])          # [A b] is idiomatic Julia for the augmented matrix

if r_Ab > r_A               # inconsistent — no exact solution
    x = pinv(A) * b
elseif r_A < size(A, 2)     # underdetermined — infinite solutions
    x = pinv(A) * b         # returns the minimum-norm solution
else                        # unique solution
    x = A \ b
end
```

The `solve_linear_system(A, b)` function in this repository implements exactly this pattern and is available after `using Linear_Algebra`.

> **`[A b]` vs `hcat(A, b)`**: These are identical — `[A b]` is syntactic sugar that Julia compiles to the same operation. `[A b]` is the preferred idiomatic style because it mirrors the mathematical augmented-matrix notation $\lbrack A \mid b \rbrack$ and is more concise. Use `hcat(arrays...)` only when building the concatenation programmatically from a variable-length collection.

## Applications

### Physics

- Equilibrium problems: balancing forces
- Circuit analysis: Kirchhoff's laws
- Collision problems: conservation laws

### Economics

- Supply and demand equilibrium
- Input-output models
- Break-even analysis

### Engineering

- Structural analysis
- Control systems
- Optimization problems

### Chemistry

- Balancing chemical equations
- Equilibrium concentrations
- Mixture problems

## See Also

- [Matrices](02 Matrices.md) - Matrix operations, determinants, and inverses
- [Analytic Geometry](04 Analytic Geometry.md) - Plane equations and linear transformations
- [Vectors](01 Vectors.md) - Geometric interpretation of solutions
- [Lines](../Geometry/02 Lines.md) - Two-variable systems as line intersections
