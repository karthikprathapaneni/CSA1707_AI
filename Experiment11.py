# Graph Coloring using CSP (Backtracking)
def is_safe(node, color, graph, colors, assignment):
    for neighbor in graph[node]:
        if neighbor in assignment and assignment[neighbor] == color:
            return False
    return True

def graph_coloring(graph, colors, assignment={}, nodes=None):
    if nodes is None:
        nodes = list(graph.keys())
    if not nodes:
        return assignment

    node = nodes[0]
    for color in colors:
        if is_safe(node, color, graph, colors, assignment):
            assignment[node] = color
            result = graph_coloring(graph, colors, assignment, nodes[1:])
            if result:
                return result
            assignment.pop(node)
    return None

# Example graph (Adjacency list)
graph = {
    'A': ['B','C'],
    'B': ['A','C'],
    'C': ['A','B','D'],
    'D': ['C']
}

colors = ["Red","Green","Blue"]
solution = graph_coloring(graph, colors)
print("Graph Coloring Solution:", solution)
