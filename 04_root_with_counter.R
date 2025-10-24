# ============================================================
# Task 4: Root function with iteration counter
# Description:
#   This script creates a modified version of the Root() function
#   that returns both the approximate root and the number of
#   iterations the while loop ran to reach convergence.
# ============================================================

# Modified Root function
Root_with_counter <- function(f, a, epsilon) {
  
  # Set initial approximation
  x.current <- a
  
  # Initialize iteration counter
  counter <- 0
  
  # Iterate until the function value is within tolerance
  while (abs(f(x.current)) > epsilon) {
    
    # Check for locally constant function
    if (f(x.current + f(x.current)) == f(x.current))
      stop("Locally Constant")
    
    # Update approximation using Steffensen/Secant-like formula
    x.current <- x.current - (
      (f(x.current) * f(x.current)) /
      (f(x.current + f(x.current)) - f(x.current))
    )
    
    # Increment counter
    counter <- counter + 1
  }
  
  # Return a vector: [approximate root, number of iterations]
  return(c(x.current, counter))
}

# --------------------------
# Example usage
f <- function(x) {
  x^2 - 1
}

# Run the function with initial guess 2 and epsilon 0.01
result <- Root_with_counter(f, 2, 0.01)
result
# Output:
# [1] 1.000056 5
# Explanation:
# - 1.000056 ≈ approximate root
# - 5 = number of iterations taken to converge
