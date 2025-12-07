# Lines

[Lines](https://mathworld.wolfram.com/Line.html) are fundamental geometric objects that can be represented in multiple equivalent forms. In linear algebra, understanding line representations is essential for solving systems of equations and understanding linear transformations.

## Line Representations

There are three primary ways to represent a line in the plane:

1. **Parametric form:** Using a point and direction vector
2. **Implicit form:** Using a linear equation
3. **Explicit form:** Using slope-intercept form

Each representation has advantages depending on the application.

## Parametric Form

### Definition

A line in [parametric form](https://mathworld.wolfram.com/ParametricEquations.html) is defined by a point $P$ and a direction vector $\mathbf{v}$: $$\ell(t) = P + t\mathbf{v}$$ where $t \in \mathbb{R}$ is the parameter.

**Component form:** If $P = [p_1, p_2]$ and $\mathbf{v} = [v_1, v_2]$:

$$\begin{aligned}
x(t) &= p_1 + tv_1 \\
y(t) &= p_2 + tv_2
\end{aligned}$$

### Properties

- As $t$ varies over all real numbers, the point $\ell(t)$ traces out the entire line
- $t = 0$ gives the point $P$
- $t = 1$ gives the point $P + \mathbf{v}$
- Negative $t$ values give points in the opposite direction from $\mathbf{v}$

### Line Through Two Points

Given two points $P$ and $Q$, the parametric equation is: $$\ell(t) = P + t(Q - P) = (1-t)P + tQ$$ where:

- $t = 0$ gives point $P$
- $t = 1$ gives point $Q$
- $0 < t < 1$ gives points between $P$ and $Q$
- $t < 0$ or $t > 1$ gives points outside the segment $PQ$

### Center of Gravity (Barycentric Coordinates)

For points $P$ and $Q$ with parameter $t$: $$R = (1-t)P + tQ$$ the parameter $t$ is called the [barycentric coordinate](https://mathworld.wolfram.com/BarycentricCoordinates.html) of $R$ with respect to $P$ and $Q$.

**Physical interpretation:** If masses $m_1 = 1-t$ and $m_2 = t$ are placed at $P$ and $Q$, then $R$ is the center of mass.

## Implicit Form

### Definition

A line in [implicit form](https://mathworld.wolfram.com/Line.html) is given by: $$ax + by + c = 0$$ where $a$, $b$, and $c$ are constants with $a$ and $b$ not both zero.

### Normal Vector

The vector $\mathbf{n} = [a, b]$ is perpendicular (normal) to the line. This follows because:

- Any point $[x, y]$ on the line satisfies $ax + by + c = 0$
- The direction vector of the line is $\mathbf{v} = [b, -a]$ (or $[-b, a]$)
- $\mathbf{n} \cdot \mathbf{v} = ab + b(-a) = 0$

### Converting from Parametric to Implicit

Given $\ell(t) = P + t\mathbf{v}$ where $P = [p_1, p_2]$ and $\mathbf{v} = [v_1, v_2]$:

1. The normal vector is $\mathbf{n} = [-v_2, v_1]$
2. Coefficients: $a = -v_2$, $b = v_1$
3. Constant: $c = -ap_1 - bp_2 = v_2p_1 - v_1p_2$

### Converting from Implicit to Parametric

Given $ax + by + c = 0$:

1. Direction vector: $\mathbf{v} = [b, -a]$
2. Find a point on the line:
   - If $|a| > |b|$: $P = [-c/a, 0]$
   - If $|b| \geq |a|$: $P = [0, -c/b]$

## Explicit Form (Slope-Intercept)

### Definition

The [explicit form](https://mathworld.wolfram.com/Slope-InterceptForm.html): $$y = mx + b$$ where:

- $m$ is the [slope](https://mathworld.wolfram.com/Slope.html)
- $b$ is the y-intercept

### Slope

The slope measures the rate of change of $y$ with respect to $x$: $$m = \frac{\Delta y}{\Delta x} = \frac{y_2 - y_1}{x_2 - x_1} = \frac{v_2}{v_1}$$

**Special cases:**

- $m = 0$: horizontal line
- $m$ undefined: vertical line (cannot be expressed in explicit form)
- $m > 0$: line rises from left to right
- $m < 0$: line falls from left to right

### Converting Between Forms

**Implicit to explicit** (when $b \neq 0$): $$ax + by + c = 0 \implies y = -\frac{a}{b}x - \frac{c}{b}$$

So: slope $m = -\frac{a}{b}$, y-intercept $= -\frac{c}{b}$

## Distance from Point to Line

### Using Implicit Form

The [distance](https://mathworld.wolfram.com/Point-LineDistance2-Dimensional.html) from point $R = [r_1, r_2]$ to line $ax + by + c = 0$: $$d = \frac{|ar_1 + br_2 + c|}{\sqrt{a^2 + b^2}}$$

### Point-Normal Form

If the line is in [point-normal form](https://mathworld.wolfram.com/NormalForm.html) (coefficients normalized so $\sqrt{a^2 + b^2} = 1$): $$\hat{a}x + \hat{b}y + \hat{c} = 0$$

Then the signed distance from $R$ to the line is simply: $$d = \hat{a}r_1 + \hat{b}r_2 + \hat{c}$$

The sign indicates which side of the line the point is on.

### Foot of Perpendicular

The [foot of the perpendicular](https://mathworld.wolfram.com/FootofthePerpendicular.html) from point $R$ to a line through $P$ with direction $\mathbf{v}$ is: $$F = P + \frac{\mathbf{v} \cdot (R - P)}{\|\mathbf{v}\|^2}\mathbf{v}$$

This is the point on the line closest to $R$.

## Intersection of Lines

### Two Lines in Implicit Form

Given:

$$\begin{aligned}
a_1x + b_1y + c_1 &= 0 \\
a_2x + b_2y + c_2 &= 0
\end{aligned}$$

The lines intersect at a unique point if and only if: $$a_1b_2 - a_2b_1 \neq 0$$

**Solution using Cramer's rule:**

$$\begin{aligned}
x &= \frac{b_1c_2 - b_2c_1}{a_1b_2 - a_2b_1} \\
y &= \frac{a_2c_1 - a_1c_2}{a_1b_2 - a_2b_1}
\end{aligned}$$

### Parallel Lines

Two lines are [parallel](https://mathworld.wolfram.com/ParallelLines.html) if their direction vectors are parallel: $$\mathbf{v}_1 = k\mathbf{v}_2$$ for some scalar $k$.

In implicit form, lines $a_1x + b_1y + c_1 = 0$ and $a_2x + b_2y + c_2 = 0$ are parallel if: $$a_1b_2 = a_2b_1$$

### Angle Between Lines

The angle $\theta$ between two lines with direction vectors $\mathbf{v}_1$ and $\mathbf{v}_2$: $$\cos\theta = \frac{|\mathbf{v}_1 \cdot \mathbf{v}_2|}{\|\mathbf{v}_1\|\|\mathbf{v}_2\|}$$

Using slopes $m_1$ and $m_2$: $$\tan\theta = \left|\frac{m_1 - m_2}{1 + m_1m_2}\right|$$

## Lines in Higher Dimensions

### Lines in $\mathbb{R}^3$

In 3D, a line requires the parametric form: $$\ell(t) = P + t\mathbf{v} = [p_1 + tv_1, p_2 + tv_2, p_3 + tv_3]$$

A single implicit equation $ax + by + cz + d = 0$ defines a plane, not a line.

A line in 3D can be expressed as the intersection of two planes:

$$\begin{aligned}
a_1x + b_1y + c_1z + d_1 &= 0 \\
a_2x + b_2y + c_2z + d_2 &= 0
\end{aligned}$$

### Skew Lines

In 3D, two lines can be [skew](https://mathworld.wolfram.com/SkewLines.html)—neither parallel nor intersecting. This cannot happen in 2D.

## Applications

### Computer Graphics

- Ray tracing: finding intersection of rays with objects
- Clipping: determining which parts of lines are visible

### Physics

- Projectile motion: linear approximation of trajectories
- Optics: light ray paths

### Engineering

- Structural analysis: force lines
- Circuit analysis: voltage-current relationships

## See Also

- [Vectors](01 Vectors.md) - Vector operations and properties
- [Linear Transformations](03 Linear Transformations.md) - How lines transform
- [Matrices](04 Matrices.md) - Solving systems of linear equations
