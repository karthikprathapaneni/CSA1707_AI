% --- Facts: known symptoms ---
fact(fever).
fact(cough).
fact(fatigue).

% --- Rules: if conditions then conclusion ---
% rule(ID, [Conditions], Conclusion).
rule(1, [fever, cough, fatigue], flu).
rule(2, [fever, cough, shortness_of_breath], covid19).
rule(3, [fever, chills, headache], malaria).

% --- Forward Chaining Engine ---

% Start inference process
forward_chain :-
    forward_chain([]).

forward_chain(Derived) :-
    % find an applicable rule whose conditions are satisfied
    rule(ID, Conditions, Conclusion),
    \+ member(Conclusion, Derived),
    conditions_met(Conditions, Derived),
    format('Rule ~w fired: ~w -> ~w~n', [ID, Conditions, Conclusion]),
    forward_chain([Conclusion|Derived]).

% Stop when no more rules can be applied
forward_chain(Derived) :-
    writeln('No more rules can be applied.'),
    writeln('Derived facts:'),
    print_list(Derived).

% Check if all conditions are satisfied
conditions_met([], _).
conditions_met([H|T], Derived) :-
    (fact(H) ; member(H, Derived)),
    conditions_met(T, Derived).

% Utility: print list
print_list([]).
print_list([H|T]) :-
    writeln(H),
    print_list(T).
