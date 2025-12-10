# Systems of Equations

[Systems of equations](https://mathworld.wolfram.com/SystemofEquations.html) involve multiple equations with multiple unknowns. The solution is the set of values that satisfy all equations simultaneously.

## Linear Systems: Algebraic Methods

Linear systems consist of linear equations with multiple variables. Before using matrix methods, basic algebraic techniques provide intuition and work well for small systems.

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

Add or subtract equations to eliminate one variable.

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

**Note:** For larger systems or more systematic approaches, see [Matrices](04 Matrices.md) for Gaussian elimination and other matrix methods.

## Nonlinear Systems

[Nonlinear systems](https://mathworld.wolfram.com/NonlinearSystem.html) contain at least one equation that is not linear (e.g., contains powers, products of variables, trigonometric functions, etc.).

### Substitution Method for Nonlinear Systems

When one equation is linear (or can be easily solved for one variable), substitution is often effective.

**Example:** Solve the system:

$$\begin{aligned}
x^2 + y^2 &= 25 \\
x + y &= 7
\end{aligned}$$

1. From the second equation: $y = 7 - x$
2. Substitute into the first: $x^2 + (7 - x)^2 = 25$
3. Expand: $x^2 + 49 - 14x + x^2 = 25$
4. Simplify: $2x^2 - 14x + 24 = 0 \Rightarrow x^2 - 7x + 12 = 0$
5. Factor: $(x - 3)(x - 4) = 0$
6. **Solutions:** $(x, y) = (3, 4)$ or $(x, y) = (4, 3)$

**Geometric interpretation:** This finds the intersection of a circle ($x^2 + y^2 = 25$) and a line ($x + y = 7$).

### Elimination in Nonlinear Systems

Sometimes variables or terms can be eliminated by adding/subtracting equations.

**Example:** Solve the system:

$$\begin{aligned}
x^2 + y^2 &= 13 \\
x^2 - y^2 &= 5
\end{aligned}$$

1. Add the equations: $2x^2 = 18 \Rightarrow x^2 = 9 \Rightarrow x = \pm 3$
2. Subtract the equations: $2y^2 = 8 \Rightarrow y^2 = 4 \Rightarrow y = \pm 2$
3. **Solutions:** $(x, y) = (3, 2), (3, -2), (-3, 2), (-3, -2)$

### Graphical Methods

Plotting the equations and finding intersection points provides geometric insight into the solution.

- **Circle and line:** 0, 1, or 2 intersection points
- **Two circles:** 0, 1, 2, or infinitely many intersection points
- **Parabola and line:** 0, 1, or 2 intersection points

### Numerical Methods

For complex nonlinear systems without closed-form solutions:

- **Newton-Raphson method** for systems (multivariate Newton's method)
- **Fixed-point iteration**
- **Computational software** (for complex or large systems)

## Types of Solutions

### Consistent Systems

A system is [consistent](https://mathworld.wolfram.com/ConsistentSystem.html) if it has at least one solution.

- **Unique solution:** Exactly one set of values satisfies all equations
- **Infinitely many solutions:** A family of solutions exists (often parameterized)

### Inconsistent Systems

A system is [inconsistent](https://mathworld.wolfram.com/InconsistentSystem.html) if it has no solution. The equations contradict each other.

**Example:** The system $x + y = 3$ and $x + y = 5$ has no solution (parallel lines).

### Dependent Systems

A system is **dependent** if the equations are not independent — one equation can be derived from the others. Such systems have infinitely many solutions.

**Example:** The system $x + y = 3$ and $2x + 2y = 6$ has infinitely many solutions (same line).

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

- [Matrices](04 Matrices.md) - Matrix methods for linear systems (Gaussian elimination, Cramer's rule)
- [Vectors](01 Vectors.md) - Geometric interpretation of solutions
- [Lines](02 Lines.md) - Two-variable systems as line intersections
