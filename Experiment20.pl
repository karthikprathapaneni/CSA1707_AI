% --- Planets Database ---

% planet(Name, OrderFromSun, Type, DiameterKm, Moons).

planet(mercury, 1, terrestrial, 4879, 0).
planet(venus,   2, terrestrial, 12104, 0).
planet(earth,   3, terrestrial, 12742, 1).
planet(mars,    4, terrestrial, 6779, 2).
planet(jupiter, 5, gas_giant,   139820, 79).
planet(saturn,  6, gas_giant,   116460, 83).
planet(uranus,  7, ice_giant,   50724, 27).
planet(neptune, 8, ice_giant,   49244, 14).

% --- Rules ---

% Find planets with moons more than a given number
has_more_moons_than(Name, N) :-
    planet(Name, _, _, _, Moons),
    Moons > N.

% Find planets by type
planet_type(Name, Type) :-
    planet(Name, _, Type, _, _).

% Find planet larger than Earth
larger_than_earth(Name) :-
    planet(Name, _, _, D, _),
    planet(earth, _, _, De, _),
    D > De.
