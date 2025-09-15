% sum_to_n(N, Sum) :- Sum is the sum of integers from 1 to N.

sum_to_n(0, 0).   % Base case
sum_to_n(N, Sum) :-
    N > 0,
    N1 is N - 1,
    sum_to_n(N1, Sum1),
    Sum is Sum1 + N.
