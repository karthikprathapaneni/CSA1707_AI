% --- State Representation ---
% state(MonkeyPos, BoxPos, MonkeyOnBox?, HasBanana?)

% Initial State: monkey at door, box at window, monkey on floor, no banana
initial(state(at_door, at_window, on_floor, has_not)).

% Goal State: monkey has the banana
goal(state(_, _, _, has)).

% --- Actions ---

% 1. Monkey walks to a place
move(state(_, Box, on_floor, has_not),
     state(at_middle, Box, on_floor, has_not),
     walk_to_middle).

% 2. Monkey pushes the box from one place to another
move(state(at_middle, at_window, on_floor, has_not),
     state(at_middle, at_middle, on_floor, has_not),
     push_box_to_middle).

% 3. Monkey climbs onto the box
move(state(at_middle, at_middle, on_floor, has_not),
     state(at_middle, at_middle, on_box, has_not),
     climb_box).

% 4. Monkey grasps the banana
move(state(at_middle, at_middle, on_box, has_not),
     state(at_middle, at_middle, on_box, has),
     grasp_banana).

% --- Plan search ---
plan(State, []) :- goal(State).
plan(State, [Action | Rest]) :-
    move(State, NextState, Action),
    plan(NextState, Rest).

solve :-
    initial(Init),
    plan(Init, Plan),
    write('Plan to get banana: '), nl,
    write(Plan), nl.
