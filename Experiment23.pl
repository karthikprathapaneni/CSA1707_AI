% --- Facts ---
male(john).
male(mike).
male(raju).
male(ravi).

female(susan).
female(anna).
female(kavya).
female(meera).

% parent(Parent, Child).
parent(john, mike).
parent(susan, mike).
parent(john, anna).
parent(susan, anna).

parent(mike, raju).
parent(kavya, raju).

parent(mike, meera).
parent(kavya, meera).

parent(anna, ravi).

% --- Rules ---
father(F, C) :- male(F), parent(F, C).
mother(M, C) :- female(M), parent(M, C).

sibling(X, Y) :- parent(P, X), parent(P, Y), X \= Y.

grandparent(G, C) :- parent(G, P), parent(P, C).
grandfather(G, C) :- male(G), grandparent(G, C).
grandmother(G, C) :- female(G), grandparent(G, C).

uncle(U, C) :- male(U), sibling(U, P), parent(P, C).
aunt(A, C) :- female(A), sibling(A, P), parent(P, C).
