import heapq

def manhattan(state, goal):
    dist = 0
    for i, v in enumerate(state):
        if v == 0: continue
        gi = goal.index(v)
        dist += abs(i//3 - gi//3) + abs(i%3 - gi%3)
    return dist

def neighbors(state):
    idx = state.index(0)
    x, y = divmod(idx, 3)
    for dx,dy,move in [(-1,0,'Up'),(1,0,'Down'),(0,-1,'Left'),(0,1,'Right')]:
        nx, ny = x+dx, y+dy
        if 0<=nx<3 and 0<=ny<3:
            new_idx = nx*3+ny
            new = list(state)
            new[idx], new[new_idx] = new[new_idx], new[idx]
            yield tuple(new), move

def a_star(start, goal):
    start, goal = tuple(start), tuple(goal)
    open_heap = []
    g_score = {start: 0}
    heapq.heappush(open_heap, (manhattan(start, list(goal)), 0, start, []))  # (f, g, state, path)
    closed = set()
    while open_heap:
        f, g, state, path = heapq.heappop(open_heap)
        if state == goal:
            return path + [(state, None)]
        if state in closed:
            continue
        closed.add(state)
        for nxt, move in neighbors(list(state)):
            tentative_g = g + 1
            if tentative_g < g_score.get(nxt, 1e9):
                g_score[nxt] = tentative_g
                fval = tentative_g + manhattan(nxt, list(goal))
                heapq.heappush(open_heap, (fval, tentative_g, nxt, path + [(state, move)]))
    return None

# Example run
start = [1,2,3,4,0,5,6,7,8]
goal  = [1,2,3,4,5,0,6,7,8]

solution = a_star(start, goal)
if solution:
    print("Steps (state shown as 3x3 rows) and the move that produced the next state:")
    for idx, (state, move) in enumerate(solution):
        print(f"Step {idx}:")
        print(state[0:3])
        print(state[3:6])
        print(state[6:9])
        if move: print(" Move:", move)
        print()
    print("Number of moves:", len(solution)-1)
else:
    print("No solution found.")
