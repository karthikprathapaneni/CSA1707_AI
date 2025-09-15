import itertools

def solve_cryptarithm(words_add, result):
    # collect unique letters
    letters = sorted(set("".join(words_add) + result))
    if len(letters) > 10:
        return None
    first_letters = {w[0] for w in words_add + [result]}

    digits = '0123456789'
    for perm in itertools.permutations(digits, len(letters)):
        assign = dict(zip(letters, perm))
        # leading letters cannot be '0'
        if any(assign[ch] == '0' for ch in first_letters):
            continue
        # convert words to numbers
        def word_val(w):
            return int("".join(assign[ch] for ch in w))
        vals = [word_val(w) for w in words_add]
        res = word_val(result)
        if sum(vals) == res:
            return assign, vals, res
    return None

# Example: SEND + MORE = MONEY
words = ["SEND","MORE"]
result = "MONEY"
sol = solve_cryptarithm(words, result)
if sol:
    assign, vals, res = sol
    print("Solution mapping:")
    for k in sorted(assign):
        print(f" {k} = {assign[k]}")
    print()
    print("Equation:")
    for w,v in zip(words, vals):
        print(f" {v}  # {w}")
    print(f"+\n {res}  # {result}")
else:
    print("No solution found.")
