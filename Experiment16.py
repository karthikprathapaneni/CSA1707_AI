import numpy as np

# Sigmoid activation
def sigmoid(x): return 1/(1+np.exp(-x))
def sigmoid_deriv(x): return x*(1-x)

# Training data (XOR problem)
X = np.array([[0,0],[0,1],[1,0],[1,1]])
y = np.array([[0],[1],[1],[0]])

# Initialize weights
np.random.seed(1)
W1 = 2*np.random.random((2,4)) - 1  # input→hidden
W2 = 2*np.random.random((4,1)) - 1  # hidden→output

# Train
for epoch in range(5000):
    # Forward
    hidden = sigmoid(np.dot(X, W1))
    output = sigmoid(np.dot(hidden, W2))
    # Error
    error = y - output
    # Backprop
    d_output = error * sigmoid_deriv(output)
    d_hidden = d_output.dot(W2.T) * sigmoid_deriv(hidden)
    # Update weights
    W2 += hidden.T.dot(d_output)
    W1 += X.T.dot(d_hidden)

# Final predictions
print("Predictions:\n", output.round(3))
