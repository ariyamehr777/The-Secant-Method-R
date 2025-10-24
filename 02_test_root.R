# ============================================================
# Task 2: Testing the Root() function
# Description:
#   This script tests the Root() function with a variety of
#   functions, initial guesses (a), and tolerances (epsilon).
#   It demonstrates how the choice of starting value and
#   tolerance affects the accuracy of the root approximation.
# ============================================================

# Define a test function f(x) = x^2 - 1
f <- function(x) {
  x^2 - 1
}

# --------------------------
# Test 1: initial guess a = 2, epsilon = 0.01
root1 <- Root(f, 2, 0.01)
f(root1)
# Result: root ≈ 1.000056, f(root) ≈ 0.000112
# Observation: very close to zero

# Test 2: initial guess a = 2.5, epsilon = 0.01
root2 <- Root(f, 2.5, 0.01)
f(root2)
# Result: root ≈ 1.000048, f(root) ≈ 0.000096
# Observation: slightly more accurate than previous test

# Test 3: initial guess a = 3, epsilon = 0.01
root3 <- Root(f, 3, 0.01)
f(root3)
# Result: root ≈ 1.003588, f(root) ≈ 0.007189
# Observation: less accurate due to initial guess being farther from the root

# Test 4: initial guess a = 2, epsilon = 0.001
root4 <- Root(f, 2, 0.001)
f(root4)
# Result: root ≈ 1.000056, f(root) ≈ 0.000112

# Test 5: initial guess a = 2.5, epsilon = 0.001
root5 <- Root(f, 2.5, 0.001)
f(root5)
# Result: root ≈ 1.000048, f(root) ≈ 0.000096

# Test 6: initial guess a = 3, epsilon = 0.001
root6 <- Root(f, 3, 0.001)
f(root6)
# Result: root ≈ 1.000019, f(root) ≈ 0.000038
# Observation: best accuracy among all tests

# --------------------------
# Summary of testing:
# - Different initial guesses (2, 2.5, 3) and tolerances (0.01, 0.001) were tested.
# - Smaller epsilon generally produces more accurate approximations.
# - The choice of initial guess affects the convergence and accuracy:
#   in these examples, a = 3 with epsilon = 0.001 gave the closest result to the true root.
# - Testing shows that by adjusting initial value and epsilon, the Root() function
#   can achieve a very precise approximation of the root.
