% --- Graph representation ---
% edge(Node1, Node2, Cost).
edge(a, b, 1).
edge(a, c, 1).
edge(b, d, 1).
edge(b, e, 1).
edge(c, f, 1).
edge(c, g, 1).

% heuristic(Node, HValue) - estimated cost to reach goal
heuristic(a, 5).
heuristic(b, 4).
heuristic(c, 3).
heuristic(d, 2).
heuristic(e, 6).
heuristic(f, 2).
heuristic(g, 0).   % goal node

% --- Best-First Search ---

best_first(Start, Goal, Path) :-
    bestfs([[Start]], Goal, Path).

% If the first path starts with the Goal, success
bestfs([[Goal | Rest] | _], Goal, Path) :-
    reverse([Goal | Rest], Path).

% Otherwise expand the first path
bestfs([[Node | Rest] | Paths], Goal, Path) :-
    findall([Next, Node | Rest],
            (edge(Node, Next, _), \+ member(Next, [Node | Rest])),
            NewPaths),
    append(Paths, NewPaths, TempPaths),
    sort_paths(TempPaths, SortedPaths),
    bestfs(SortedPaths, Goal, Path).

% --- Sorting by heuristic ---
sort_paths(Paths, Sorted) :-
    map_list_to_pairs(path_heuristic, Paths, Pairs),
    keysort(Pairs, SortedPairs),
    pairs_values(SortedPairs, Sorted).

path_heuristic([Node | _], H) :-
    heuristic(Node, H).
