def vacuum_cleaner(roomA, roomB, start):
    actions = []
    if start == "A":
        if roomA == "Dirty":
            actions.append("Clean Room A"); roomA = "Clean"
        actions.append("Move to Room B")
        if roomB == "Dirty":
            actions.append("Clean Room B"); roomB = "Clean"
    else:  # start at B
        if roomB == "Dirty":
            actions.append("Clean Room B"); roomB = "Clean"
        actions.append("Move to Room A")
        if roomA == "Dirty":
            actions.append("Clean Room A"); roomA = "Clean"

    return actions, (roomA, roomB)

# Example run
actions, final_state = vacuum_cleaner("Dirty", "Clean", "A")
print("Actions:", actions)
print("Final State:", final_state)
