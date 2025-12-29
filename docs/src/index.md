# Linear Algebra

## Overview

This package provides a collection of functions and documentation for learning and applying linear algebra concepts. The code and documentation were created as I worked through various linear algebra textbooks, discussed below.

The code in this package is not meant to be a complete implementation of the materials in the books, but rather code that I created in order to gain practice and a deeper understanding of the concepts in the books. The code is not necessarily divided in the same way as the documentation. I actually worked through the basics book after I was well into the linear algebra books, so the Julia code files are mostly related to the Geometry books. By contrast, in the Github repository, you will find notebooks related to each of the documentation sections.

Besides the package documentation, you will also find in the left navigation tab links to documents explaining topics from the source books. These often provide more details than covered in the books. Currently, there are two sections: Basics and Geometry.

The Basics documentation section covers the algebraic foundations of linear algebra, including vectors, matrices, linear transformations, and systems of equations. The source of the documents in this section is the book [_Foundations of Mathematics: A Preparatory Course_](https://link.springer.com/book/10.1007/978-3-662-67809-1). by Guido Walz, Frank Zeilfelder and Thomas Rießinger. The earlier contents of this book cover basic mathematical concepts, and documentation and code for those topics can be found in the [Math_Foundations](https://study.fourm.info/math_foundations/dev/sites/) package.

The Geometry section focuses on geometric interpretations and visualizations of linear algebra concepts, with Julia code examples. These examples are also found in the Julia code files documented below. There are several books that serve as source material for this section. I started with [_Linear Algebra and Geometry_](https://bookstore.ams.org/text-46/) but found it a bit too elementary. I then moved on to [Linear Algebra Through Geometry](https://link.springer.com/book/10.1007/978-1-4612-4390-8) a book I had completely worked through in the past. Unfortunately I found it often too complicated and confusing. I finally settled on [_Practical Linear Algebra: A Geometry Toolbox_](https://www.crcpress.com/Practical-Linear-Algebra-A-Geometry-Toolbox-4th-Edition/Farin-Hansford/p/book/9780367563567) which met my Goldilocks test.

The Geometry section is still a work in progress. I have not yet covered all topics from the Geometry Toolbox book, particularly 3D geometry and more advanced material. I plan to add these in the future. As I study more advanced Linear Algebra texts, I plan to add additional sections and code to this package.

## Basic Linear Algebra

The code for this can be found in the [linear_algebra_basic.jl](https://github.com/FourMInfo/Linear_Algebra/blob/main/src/linear_algebra_basic.jl) file.

```@autodocs
Modules = [Linear_Algebra]
Order   = [:function, :type]
Pages   = ["linear_algebra_basic.jl"]
```

## Linear Transformations

The code for this can be found in the [linear_algebra_transform.jl](https://github.com/FourMInfo/Linear_Algebra/blob/main/src/linear_algebra_transform.jl) file.

```@autodocs
Modules = [Linear_Algebra]
Order   = [:function, :type]
Pages   = ["linear_algebra_transform.jl"]
```
