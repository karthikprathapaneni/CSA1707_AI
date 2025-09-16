% Facts
fruit(apple, red).
fruit(apple, green).
fruit(banana, yellow).
fruit(grapes, green).
fruit(grapes, purple).
fruit(orange, orange).

% Rule: match fruit with its color
colour_of(Fruit, Colour) :-
    fruit(Fruit, Colour).
