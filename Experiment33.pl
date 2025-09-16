% Check if a character is a vowel
vowel(a).
vowel(e).
vowel(i).
vowel(o).
vowel(u).

% Count vowels in a list of characters
count_vowels([], 0).
count_vowels([H|T], Count) :-
    vowel(H), !,
    count_vowels(T, Rest),
    Count is Rest + 1.
count_vowels([_|T], Count) :-
    count_vowels(T, Count).

% Convert atom/string to list of characters and count
vowel_count(Word, Count) :-
    atom_chars(Word, Chars),
    count_vowels(Chars, Count).
