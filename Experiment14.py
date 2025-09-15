def alphabeta(depth, nodeIndex, isMax, values, alpha, beta, maxDepth):
    if depth == maxDepth:
        return values[nodeIndex]

    if isMax:
        best = float('-inf')
        for i in range(2):
            val = alphabeta(depth+1, nodeIndex*2+i, False, values, alpha, beta, maxDepth)
            best = max(best, val); alpha = max(alpha, best)
            if beta <= alpha: break
        return best
    else:
        best = float('inf')
        for i in range(2):
            val = alphabeta(depth+1, nodeIndex*2+i, True, values, alpha, beta, maxDepth)
            best = min(best, val); beta = min(beta, best)
            if beta <= alpha: break
        return best

# Example: leaf values of a game tree
values = [3, 5, 6, 9, 1, 2, 0, -1]
print("Optimal Value:", alphabeta(0, 0, True, values, float('-inf'), float('inf'), 3))
