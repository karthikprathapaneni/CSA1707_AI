% --- Facts: birds and their flying ability ---

bird(sparrow).
bird(pigeon).
bird(crow).
bird(penguin).
bird(ostrich).
bird(eagle).

% Some birds cannot fly
cannot_fly(penguin).
cannot_fly(ostrich).

% Rule: A bird can fly if it is a bird and not in cannot_fly list
can_fly(Bird) :-
    bird(Bird),
    \+ cannot_fly(Bird).
