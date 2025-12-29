# Linear Algebra

This documentation provides comprehensive notes on linear algebra, covering both algebraic foundations and geometric interpretations.

## About These Notes

The content in this documentation is organized into two main sections:

- **Basics**: Algebraic foundations of linear algebra—vectors, matrices, linear transformations, and systems of equations
- **Geometry**: Geometric interpretations and visualizations of linear algebra concepts, with Julia code examples

### Source Material

These notes are based on:

- **Farin, G. & Hansford, D.** (2021). *Practical Linear Algebra: A Geometry Toolbox* (4th ed.). CRC Press.
  - Primary source for the Geometry section, emphasizing geometric intuition and practical applications

Additional references include standard linear algebra texts for the algebraic foundations in the Basics section.

## Package Documentation

This package provides a collection of functions for linear algebra operations and transformations.

### Basic Linear Algebra Functions

```@autodocs
Modules = [Linear_Algebra]
Order   = [:function, :type]
Pages   = ["linear_algebra_basic.jl"]
```

### Linear Transformations

```@autodocs
Modules = [Linear_Algebra]
Order   = [:function, :type]
Pages   = ["linear_algebra_transform.jl"]
```
