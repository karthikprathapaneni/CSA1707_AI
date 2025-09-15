N = 8

def print_board(board):
    for row in board:
        print(" ".join("Q" if x else "." for x in row))
    print()

def is_safe(board, row, col):
    # Check this row
    for i in range(col):
        if board[row][i]: return False
    # Upper diagonal
    for i,j in zip(range(row,-1,-1), range(col,-1,-1)):
        if board[i][j]: return False
    # Lower diagonal
    for i,j in zip(range(row,N), range(col,-1,-1)):
        if board[i][j]: return False
    return True

def solve(board, col):
    if col >= N: return True
    for row in range(N):
        if is_safe(board, row, col):
            board[row][col] = 1
            if solve(board, col+1): return True
            board[row][col] = 0
    return False

board = [[0]*N for _ in range(N)]
solve(board, 0)
print_board(board)
