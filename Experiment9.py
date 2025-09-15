import itertools

def travelling_salesman(distance_matrix):
    n = len(distance_matrix)
    cities = range(n)
    min_cost = float('inf')
    best_path = None

    # Try all possible permutations of cities except the starting city (0)
    for perm in itertools.permutations(cities[1:]):
        path = (0,) + perm + (0,)   # complete cycle
        cost = sum(distance_matrix[path[i]][path[i+1]] for i in range(n))
        if cost < min_cost:
            min_cost = cost
            best_path = path

    return best_path, min_cost

# Example run
matrix = [
    [0, 10, 15, 20],
    [10, 0, 35, 25],
    [15, 35, 0, 30],
    [20, 25, 30, 0]
]

path, cost = travelling_salesman(matrix)
print("Optimal Path:", path)
print("Minimum Cost:", cost)
