# Line Intersections

Finding the [intersection](https://mathworld.wolfram.com/Line-LineIntersection.html) of two lines is a fundamental problem in geometry and linear algebra. The approach to finding an intersection depends on how the lines are represented—parametric form, implicit form, or a combination of both. See [02 Lines](02 Lines.md) for detailed definitions of these line representations.

This document covers three intersection scenarios:

1. **Implicit and Parametric Lines** – One line in implicit form, one in parametric form
2. **Two Parametric Lines** – Both lines in parametric form
3. **Two Implicit Lines** – Both lines in implicit form

Each method reduces to solving a [system of linear equations](https://mathworld.wolfram.com/SystemofEquations.html), but the setup and interpretation differ based on the representations involved.

## Intersection of Implicit and Parametric Lines

### Problem Setup

**Given:** Two lines $\mathbf{l}_1$ and $\mathbf{l}_2$:

$$\begin{aligned}
\mathbf{l}_1: \quad & \mathbf{l}_1(t) = \mathbf{p} + t\mathbf{v} \quad \text{(parametric form)} \\
\mathbf{l}_2: \quad & ax_1 + bx_2 + c = 0 \quad \text{(implicit form)}
\end{aligned}$$

**Find:** The intersection point $\mathbf{i}$.

### Derivation

The approach is to find the specific parameter value $\hat{t}$ at which the parametric line intersects the implicit line.

The intersection point $\mathbf{i}$ lies on both lines. When the coordinates of $\mathbf{i}$ are substituted into the implicit equation, the left-hand side evaluates to zero:

$$a\lbrack p_1 + \hat{t}v_1 \rbrack + b\lbrack p_2 + \hat{t}v_2 \rbrack + c = 0$$

where the intersection point has coordinates:

$$\mathbf{i} = \begin{bmatrix} x_1 \\ x_2 \end{bmatrix} = \begin{bmatrix} p_1 + \hat{t}v_1 \\ p_2 + \hat{t}v_2 \end{bmatrix}$$

This is one equation with one unknown ($\hat{t}$). Expanding and collecting terms:

$$ap_1 + a\hat{t}v_1 + bp_2 + b\hat{t}v_2 + c = 0$$

$$\hat{t}(av_1 + bv_2) = -c - ap_1 - bp_2$$

### Formula

Solving for the parameter $\hat{t}$:

$$\hat{t} = \frac{-c - ap_1 - bp_2}{av_1 + bv_2}$$

Once $\hat{t}$ is found, the intersection point is:

$$\mathbf{i} = \mathbf{l}_1(\hat{t}) = \mathbf{p} + \hat{t}\mathbf{v}$$

### Checking for Parallel Lines

Before computing $\hat{t}$, we must verify that the denominator is non-zero. The denominator:

$$\text{denom} = av_1 + bv_2 = \mathbf{a} \cdot \mathbf{v}$$

where $\mathbf{a} = \lbrack a, b \rbrack^T$ is the [normal vector](https://mathworld.wolfram.com/NormalVector.html) to the implicit line $\mathbf{l}_2$.

A zero [dot product](https://mathworld.wolfram.com/DotProduct.html) implies that the vectors are [perpendicular](https://mathworld.wolfram.com/Perpendicular.html). Since $\mathbf{a}$ is perpendicular to $\mathbf{l}_2$, and $\mathbf{v}$ is parallel to $\mathbf{l}_1$, the condition:

$$\mathbf{a} \cdot \mathbf{v} = 0$$

means the lines are [parallel](https://mathworld.wolfram.com/ParallelLines.html) and have no unique intersection point.

### Numerical Tolerance

In practice, check for parallelism using a tolerance based on the angle between vectors:

$$\cos(\theta) = \frac{\mathbf{a} \cdot \mathbf{v}}{\lVert \mathbf{a} \rVert \lVert \mathbf{v} \rVert}$$

A tolerance like $\cos(0.1°)$ provides a dimension-independent threshold. If $\lvert \cos(\theta) \rvert$ is below this tolerance, treat the lines as parallel.

### Checking for Identical Lines

If the lines are parallel, they might be identical. To check, substitute $\mathbf{p}$ into the implicit equation and compute the [distance](https://mathworld.wolfram.com/Point-LineDistance2-Dimensional.html):

$$d = \frac{ap_1 + bp_2 + c}{\lVert \mathbf{a} \rVert}$$

If $d = 0$ (within tolerance), the lines are identical—every point on one line lies on the other.

**Important:** If lines are parallel or identical, there is no unique intersection point.

## Intersection of Two Parametric Lines

### Problem Setup

**Given:** Two lines in parametric form:

$$\begin{aligned}
\mathbf{l}_1: \quad & \mathbf{l}_1(t) = \mathbf{p} + t\mathbf{v} \\
\mathbf{l}_2: \quad & \mathbf{l}_2(s) = \mathbf{q} + s\mathbf{w}
\end{aligned}$$

Note that we use two different parameters, $t$ and $s$, because the lines are independent of each other.

**Find:** The intersection point $\mathbf{i}$.

### Derivation

At the intersection, both parametric equations yield the same point. We need parameter values $\hat{t}$ and $\hat{s}$ such that:

$$\mathbf{p} + \hat{t}\mathbf{v} = \mathbf{q} + \hat{s}\mathbf{w}$$

Rearranging to collect the unknowns on the left:

$$\hat{t}\mathbf{v} - \hat{s}\mathbf{w} = \mathbf{q} - \mathbf{p}$$

Writing this as a [system of linear equations](https://mathworld.wolfram.com/SystemofLinearEquations.html) in component form:

$$\begin{aligned}
\hat{t}v_1 - \hat{s}w_1 &= q_1 - p_1 \\
\hat{t}v_2 - \hat{s}w_2 &= q_2 - p_2
\end{aligned}$$

This is two equations with two unknowns ($\hat{t}$ and $\hat{s}$).

### Matrix Formulation

The system can be written in [matrix form](https://mathworld.wolfram.com/MatrixEquation.html):

$$\begin{bmatrix} v_1 & -w_1 \\ v_2 & -w_2 \end{bmatrix} \begin{bmatrix} \hat{t} \\ \hat{s} \end{bmatrix} = \begin{bmatrix} q_1 - p_1 \\ q_2 - p_2 \end{bmatrix}$$

Or more compactly: $A\mathbf{x} = \mathbf{b}$ where:

- The coefficient matrix: $A = \lbrack \mathbf{v} \mid -\mathbf{w} \rbrack$
- The unknown vector: $\mathbf{x} = \lbrack \hat{t}, \hat{s} \rbrack^T$
- The right-hand side: $\mathbf{b} = \mathbf{q} - \mathbf{p}$

### Solution

Solve the system using standard linear algebra techniques. Once $\hat{t}$ and $\hat{s}$ are found, compute the intersection point by substituting either parameter into its respective line equation:

$$\mathbf{i} = \mathbf{l}_1(\hat{t}) = \mathbf{p} + \hat{t}\mathbf{v}$$

or equivalently:

$$\mathbf{i} = \mathbf{l}_2(\hat{s}) = \mathbf{q} + \hat{s}\mathbf{w}$$

### Checking for Parallel Lines

If the direction vectors $\mathbf{v}$ and $\mathbf{w}$ are [linearly dependent](https://mathworld.wolfram.com/LinearlyDependentVectors.html), then the coefficient matrix $A$ is [singular](https://mathworld.wolfram.com/SingularMatrix.html) and no unique solution exists. The lines are parallel and may be identical.

### Julia Implementation

```julia
using GeometryBasics

function intersection_2_parametric_lines(v, w, p, q)
    # Calculate the vector for RHS of the solution equation
    b = Vector(q - p)
    # Build the coefficient matrix from direction vectors
    A = [v[1] -w[1]; v[2] -w[2]]
    # Solve the system using left division
    A \ b
end
```

### Worked Example

**Given:**
- Point $\mathbf{p} = \lbrack 0, 3 \rbrack^T$ with direction $\mathbf{v} = \lbrack -2, -1 \rbrack^T$
- Point $\mathbf{q} = \lbrack 4, 0 \rbrack^T$ with direction $\mathbf{w} = \lbrack -1, 2 \rbrack^T$

```julia
julia> p = Point(0, 3)
2-element Point{2, Int64} with indices SOneTo(2):
 0
 3

julia> q = Point(4, 0)
2-element Point{2, Int64} with indices SOneTo(2):
 4
 0

julia> v = [-2, -1]
2-element Vector{Int64}:
 -2
 -1

julia> w = [-1, 2]
2-element Vector{Int64}:
 -1
  2

julia> params = intersection_2_parametric_lines(v, w, p, q)
2-element Vector{Float64}:
 -1.0
  2.0
```

The result gives $\hat{t} = -1$ and $\hat{s} = 2$. Computing the intersection point:

$$\mathbf{i} = \mathbf{p} + \hat{t}\mathbf{v} = \begin{bmatrix} 0 \\ 3 \end{bmatrix} + (-1)\begin{bmatrix} -2 \\ -1 \end{bmatrix} = \begin{bmatrix} 2 \\ 4 \end{bmatrix}$$

## Intersection of Two Implicit Lines

### Problem Setup

**Given:** Two lines in implicit form:

$$\begin{aligned}
\mathbf{l}_1: \quad & ax_1 + bx_2 + c = 0 \\
\mathbf{l}_2: \quad & \bar{a}x_1 + \bar{b}x_2 + \bar{c} = 0
\end{aligned}$$

Each implicit line is geometrically defined by a point on the line and a normal vector $\mathbf{a} = \lbrack a, b \rbrack^T$ or $\bar{\mathbf{a}} = \lbrack \bar{a}, \bar{b} \rbrack^T$ perpendicular to the line.

**Find:** The intersection point:

$$\mathbf{i} = \hat{\mathbf{x}} = \begin{bmatrix} \hat{x}_1 \\ \hat{x}_2 \end{bmatrix}$$

that simultaneously satisfies both line equations.

### Derivation

The intersection point must satisfy both implicit equations. Rearranging with the constants on the right:

$$\begin{aligned}
a\hat{x}_1 + b\hat{x}_2 &= -c \\
\bar{a}\hat{x}_1 + \bar{b}\hat{x}_2 &= -\bar{c}
\end{aligned}$$

This is a [system of two linear equations](https://mathworld.wolfram.com/SystemofLinearEquations.html) with two unknowns, $\hat{x}_1$ and $\hat{x}_2$.

### Matrix Formulation

In matrix form:

$$\begin{bmatrix} a & b \\ \bar{a} & \bar{b} \end{bmatrix} \begin{bmatrix} \hat{x}_1 \\ \hat{x}_2 \end{bmatrix} = \begin{bmatrix} -c \\ -\bar{c} \end{bmatrix}$$

Or: $A\hat{\mathbf{x}} = \mathbf{b}$ where:

- The coefficient matrix: $A = \begin{bmatrix} a & b \\ \bar{a} & \bar{b} \end{bmatrix}$
- The unknown intersection point: $\hat{\mathbf{x}} = \lbrack \hat{x}_1, \hat{x}_2 \rbrack^T$
- The right-hand side: $\mathbf{b} = \lbrack -c, -\bar{c} \rbrack^T$

### Checking for Parallel Lines

If the normal vectors $\mathbf{a} = \lbrack a, b \rbrack^T$ and $\bar{\mathbf{a}} = \lbrack \bar{a}, \bar{b} \rbrack^T$ are [linearly dependent](https://mathworld.wolfram.com/LinearlyDependentVectors.html), the coefficient matrix is singular and no unique intersection exists. The lines are parallel and may be identical.

### Julia Implementation

```julia
function intersection_2_implicit_lines(a₁::Number, b₁::Number, c₁::Number, 
                                        a₂::Number, b₂::Number, c₂::Number)
    # Build the right-hand side vector
    b = [-c₁, -c₂]
    # Build the coefficient matrix from normal vector components
    A = [a₁ b₁; a₂ b₂]
    # Solve the system using left division
    A \ b
end
```

### Worked Example

**Given:** Two implicit lines:
- $\mathbf{l}_1: x_1 - 2x_2 + 6 = 0$ (so $a_1 = 1$, $b_1 = -2$, $c_1 = 6$)
- $\mathbf{l}_2: 2x_1 + x_2 - 8 = 0$ (so $a_2 = 2$, $b_2 = 1$, $c_2 = -8$)

```julia
julia> a₁, b₁, c₁ = 1, -2, 6
(1, -2, 6)

julia> a₂, b₂, c₂ = 2, 1, -8
(2, 1, -8)

julia> intersection_2_implicit_lines(a₁, b₁, c₁, a₂, b₂, c₂)
2-element Vector{Float64}:
 2.0
 4.0
```

The intersection point is $\mathbf{i} = \lbrack 2, 4 \rbrack^T$.

**Verification:** Substituting back into both equations:
- $\mathbf{l}_1$: $1(2) - 2(4) + 6 = 2 - 8 + 6 = 0$ ✓
- $\mathbf{l}_2$: $2(2) + 1(4) - 8 = 4 + 4 - 8 = 0$ ✓

## Summary

| Intersection Type | Unknowns | Method | Parallel Check |
|-------------------|----------|--------|----------------|
| Implicit + Parametric | Parameter $\hat{t}$ | Direct formula | $\mathbf{a} \cdot \mathbf{v} = 0$ |
| Two Parametric | Parameters $\hat{t}$, $\hat{s}$ | $2 \times 2$ system | $\mathbf{v}$ and $\mathbf{w}$ linearly dependent |
| Two Implicit | Coordinates $\hat{x}_1$, $\hat{x}_2$ | $2 \times 2$ system | $\mathbf{a}$ and $\bar{\mathbf{a}}$ linearly dependent |

All three methods share a common structure:
- Set up equations that the intersection point must satisfy
- Solve the resulting system of linear equations
- Check for the parallel (degenerate) case before solving
