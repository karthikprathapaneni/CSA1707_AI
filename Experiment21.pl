% --- Towers of Hanoi ---
% hanoi(N, From, To, Aux) 
% Moves N disks from From to To using Aux as auxiliary peg.

hanoi(1, From, To, _) :-
    write('Move disk from '), write(From), write(' to '), write(To), nl.

hanoi(N, From, To, Aux) :-
    N > 1,
    M is N - 1,
    hanoi(M, From, Aux, To),
    hanoi(1, From, To, _),
    hanoi(M, Aux, To, From).
% moves(N, Count) :- Count is the number of moves needed for N disks.

moves(1, 1).  % Base case: 1 disk = 1 move
moves(N, Count) :-
    N > 1,
    N1 is N - 1,
    moves(N1, C1),
    Count is 2 * C1 + 1.
