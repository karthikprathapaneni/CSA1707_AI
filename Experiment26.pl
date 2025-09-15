% --- Facts: fruit and its colour ---
fruit(apple, red).
fruit(apple, green).
fruit(banana, yellow).
fruit(grapes, green).
fruit(grapes, purple).
fruit(orange, orange).
fruit(mango, yellow).

% --- Rule: get colour of a fruit ---
colour_of(Fruit, Colour) :-
    fruit(Fruit, Colour).
