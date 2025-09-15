from queue import PriorityQueue

def a_star(graph, heuristics, start, goal):
    pq = PriorityQueue()
    pq.put((0, start, [start]))
    g_cost = {start: 0}

    while not pq.empty():
        f, node, path = pq.get()
        if node == goal:
            return path, g_cost[node]

        for neighbor, cost in graph[node]:
            new_g = g_cost[node] + cost
            if neighbor not in g_cost or new_g < g_cost[neighbor]:
                g_cost[neighbor] = new_g
                f = new_g + heuristics[neighbor]
                pq.put((f, neighbor, path + [neighbor]))
    return None, float('inf')

# Example graph
graph = {
    'A': [('B',1),('C',3)],
    'B': [('D',3)],
    'C': [('D',1)],
    'D': []
}
heuristics = {'A':3,'B':2,'C':1,'D':0}

path, cost = a_star(graph, heuristics, 'A', 'D')
print("Path:", path)
print("Cost:", cost)
