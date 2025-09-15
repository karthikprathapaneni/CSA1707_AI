from collections import deque

# Check if a state is valid
def is_valid(m, c):
    return (m == 0 or m >= c) and (3 - m == 0 or (3 - m) >= (3 - c))

# Generate next possible states
def get_moves(state):
    m, c, b = state
    moves = [(2,0),(0,2),(1,0),(0,1),(1,1)]
    next_states = []
    for dm, dc in moves:
        if b == 0:  # boat on left -> move to right
            nm, nc, nb = m - dm, c - dc, 1
        else:       # boat on right -> move to left
            nm, nc, nb = m + dm, c + dc, 0
        if 0 <= nm <= 3 and 0 <= nc <= 3 and is_valid(nm, nc):
            next_states.append((nm, nc, nb))
    return next_states

# BFS to find solution
def solve():
    start, goal = (3, 3, 0), (0, 0, 1)
    q = deque([[start]])
    visited = {start}
    while q:
        path = q.popleft()
        state = path[-1]
        if state[:2] == goal[:2]:
            return path
        for next_state in get_moves(state):
            if next_state not in visited:
                visited.add(next_state)
                q.append(path + [next_state])
    return None

# Run and print solution
solution = solve()
if solution:
    for step in solution:
        m, c, b = step
        side = "Left" if b == 0 else "Right"
        print(f"Left Bank: M={m}, C={c} | Boat on {side}")
else:
    print("No solution found.")
