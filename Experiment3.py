from collections import deque

def water_jug_bfs(capA, capB, target):
    start = (0,0)
    q = deque([[ (start, "Start") ]])
    seen = {start}
    while q:
        path = q.popleft()
        (a,b),_ = path[-1]
        if a == target or b == target:
            return path
        states = []
        # Fill A
        states.append(((capA, b), f"Fill A -> ({capA},{b})"))
        # Fill B
        states.append(((a, capB), f"Fill B -> ({a},{capB})"))
        # Empty A
        states.append(((0, b), f"Empty A -> (0,{b})"))
        # Empty B
        states.append(((a, 0), f"Empty B -> ({a},0)"))
        # Pour A -> B
        transfer = min(a, capB - b)
        states.append(((a - transfer, b + transfer), f"Pour A->B {transfer} -> ({a-transfer},{b+transfer})"))
        # Pour B -> A
        transfer = min(b, capA - a)
        states.append(((a + transfer, b - transfer), f"Pour B->A {transfer} -> ({a+transfer},{b-transfer})"))
        for new_state, action in states:
            if new_state not in seen:
                seen.add(new_state)
                q.append(path + [(new_state, action)])
    return None

# Example use:
capA, capB, target = 3, 5, 4
path = water_jug_bfs(capA, capB, target)
if path:
    for idx,(state,action) in enumerate(path):
        a,b = state
        print(f"Step {idx}: State=({a},{b}) | Action: {action}")
    print(f"\nReached target in step {len(path)-1}: state {path[-1][0]}")
else:
    print("No solution found.")
