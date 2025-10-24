# 🔢 The Secant Method in R

This project demonstrates how to implement and apply the **Secant Method** for finding roots of nonlinear equations in **R**.  
It features a custom `Root()` function that uses a **derivative-free iterative algorithm**, closely related to **Steffensen’s Method**, which accelerates convergence without requiring the derivative of the function.

---

## 📘 Overview

The **Secant Method** is a numerical technique used to find approximate solutions to equations of the form:

\[
f(x) = 0
\]

Unlike Newton’s Method, which requires the derivative \( f'(x) \), the Secant Method estimates it using finite differences between two successive points.  
The version implemented here further improves this approach by using **Steffensen’s acceleration**, offering faster convergence for well-behaved functions.

---

## ⚙️ Algorithm Description

Given a function \( f(x) \), an initial guess \( a \), and a tolerance \( \epsilon \), the algorithm iteratively updates \( x \) as follows:

\[
x_{n+1} = x_n - \frac{[f(x_n)]^2}{f(x_n + f(x_n)) - f(x_n)}
\]

This continues until \( |f(x_n)| < \epsilon \), meaning the function value is sufficiently close to zero.

If the function becomes **locally constant** (i.e., \( f(x + f(x)) = f(x) \)), the algorithm halts with an error message, since no useful update can be computed.

---

## 💻 Implementation

```r
Root <- function(f, a, epsilon) {
  
  x.current <- a
    
  while (abs(f(x.current)) > epsilon) {
    
    if (f(x.current + f(x.current)) == f(x.current))
      stop("Locally Constant")
    
    x.current <- x.current - (
      (f(x.current) * f(x.current)) /
      (f(x.current + f(x.current)) - f(x.current))
    )
  }
  
  return(x.current)
}
🧮 Example Usage
# Define the function
f <- function(x) x^2 - 4

# Find the root starting from an initial guess of 1
root_value <- Root(f, a = 1, epsilon = 1e-6)

print(root_value)

✅ Output:
csharp
Copy code
[1] 2
The method successfully approximates the root 
𝑥
=
2
x=2 of the equation 
𝑥
2
−
4
=
0
x 
2
 −4=0.

🧠 Key Features
Derivative-free root-finding (no need for 
𝑓
′
(
𝑥
)
f 
′
 (x))

Fast convergence using Steffensen’s acceleration

Simple and clear R implementation

Built-in safeguard for locally constant functions

📈 When to Use
Use this method when:

The function 
𝑓
(
𝑥
)
f(x) is continuous and smooth near the root

The derivative 
𝑓
′
(
𝑥
)
f 
′
 (x) is difficult or expensive to compute

You want a faster alternative to the Bisection Method but without requiring derivatives

Avoid using it when:

𝑓
(
𝑥
)
f(x) is discontinuous or oscillatory

The function is nearly constant in the region of interest

🧾 References
Burden, R. L., & Faires, J. D. (2011). Numerical Analysis. Brooks/Cole.

Atkinson, K. E. (1989). An Introduction to Numerical Analysis. Wiley.

Steffensen, J. F. (1933). Remarks on iteration. Skandinavisk Aktuarietidskrift, 16(1), 64–72.

🧑‍💻 Author
Developed by Sajjad Abolverdi
Mathematics & Computational Methods — 2025

📂 GitHub Repository: https://github.com/ariyamehr777/secant-method-R

🪶 License
This project is licensed under the MIT License — you are free to use, modify, and distribute it with attribution.
