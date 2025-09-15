def print_board(board):
    for row in board:
        print(" | ".join(row))
    print("-"*5)

def check_winner(board, player):
    # Check rows, cols, diagonals
    for i in range(3):
        if all(board[i][j]==player for j in range(3)): return True
        if all(board[j][i]==player for j in range(3)): return True
    if all(board[i][i]==player for i in range(3)): return True
    if all(board[i][2-i]==player for i in range(3)): return True
    return False

def tic_tac_toe():
    board = [[" "]*3 for _ in range(3)]
    players = ["X","O"]
    for turn in range(9):
        print_board(board)
        player = players[turn%2]
        r,c = map(int,input(f"Player {player}, enter row,col (0-2): ").split(","))
        if board[r][c] != " ":
            print("Invalid move! Try again."); continue
        board[r][c] = player
        if check_winner(board, player):
            print_board(board)
            print(f"Player {player} wins!")
            return
    print_board(board)
    print("It's a Draw!")

# Run game
tic_tac_toe()
