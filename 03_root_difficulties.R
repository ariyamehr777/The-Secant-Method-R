# ============================================================
# Task 3: Root-finding difficulties with f(x) = x^3 * exp(x^4)
# Description:
#   This script demonstrates why the Root() function may fail
#   for certain initial guesses, and how choosing a different
#   starting point can help.
# ============================================================

# Define the function
f <- function(x) {
  (x^3) * exp(x^4)
}

# --------------------------
# Attempt 1: initial guess a = 2, epsilon = 0.1
# Observation:
#   The Root() function fails to converge. 
#   Reason:
#     - f(x) grows extremely fast for x > 1 due to exp(x^4).
#     - The iterative formula x_{n+1} = x_n - f(x_n)^2 / (f(x_n + f(x_n)) - f(x_n))
#       produces very large updates, leading to divergence.
#     - Essentially, the function's slope is too steep at this starting point,
#       so the method cannot reach the root.
# Uncomment to try (may take a long time or fail):
# Root(f, 2, 0.1)

# --------------------------
# Attempt 2: initial guess a = 0, epsilon = 0.1
# Observation:
#   The Root() function successfully converges to the root at x = 0
root <- Root(f, 0, 0.1)
root
f(root)
# Result: root = 0, f(root) = 0
# Reason:
#   - x = 0 is the only real root of f(x) = x^3 * exp(x^4)
#   - Choosing the initial guess close to the root allows convergence.
#   - The method works when the initial guess is in the region where the
#     function behaves “well” (not too steep or rapidly growing).

# --------------------------
# Summary:
# - The Root() function may fail for steep or rapidly growing functions
#   when the initial guess is far from the root.
# - Choosing an initial point closer to the root improves convergence.
# - For this function, a = 0 works because it is the actual root, while a = 2 fails
#   due to the explosive growth of exp(x^4) for x > 1.
