% File: medical_diagnosis.pl
% Simple educational medical diagnosis expert system

% -----------------------
% Knowledge base: diseases and typical symptoms
% Format: disease(Name, [ListOfKeySymptoms]).
% -----------------------
disease(flu,       [fever, cough, sore_throat, body_ache, fatigue]).
disease(common_cold,[cough, sneezing, sore_throat, mild_fever]).
disease(covid19,   [fever, cough, shortness_of_breath, loss_of_taste_smell, fatigue]).
disease(malaria,   [fever, chills, sweating, headache, nausea]).
disease(dengue,    [fever, severe_headache, pain_behind_eyes, joint_pain, rash]).
disease(anemia,    [fatigue, pale_skin, shortness_of_breath, dizziness]).
disease(urinary_tract_infection, [frequent_urination, pain_while_urinating, lower_abdominal_pain, fever]).

% -----------------------
% Facts to record patient's reported symptoms
% Use assert/1 or provide list to diagnosis predicates (preferred).
% -----------------------
% Example (do not include in file): assert(patient_symptom(fever)).
% You can also pass symptoms list to diagnosis functions as shown below.

% -----------------------
% 1) Strict rule-based diagnosis:
%    A disease is suggested if ALL its key symptoms appear in the patient's symptom list.
% -----------------------
has_all_symptoms(Disease, PatientSymptoms) :-
    disease(Disease, KeySymptoms),
    subset(KeySymptoms, PatientSymptoms).

% helper: subset(SubList, List) true if every element of SubList is in List
subset([], _).
subset([H|T], List) :-
    member(H, List),
    subset(T, List).

% diagnose_strict(+PatientSymptoms, -Disease)
% returns diseases for which ALL key symptoms are present
diagnose_strict(PatientSymptoms, Disease) :-
    has_all_symptoms(Disease, PatientSymptoms).

% -----------------------
% 2) Scoring diagnosis: count matched symptoms and return score
%    Useful when patient has partial symptoms.
% -----------------------
% count_matches(+KeySymptoms, +PatientSymptoms, -Count)
count_matches([], _, 0).
count_matches([H|T], PatientSymptoms, Count) :-
    count_matches(T, PatientSymptoms, Rest),
    ( member(H, PatientSymptoms) -> Count is Rest + 1 ; Count = Rest ).

% diagnose_score(+PatientSymptoms, -Disease, -Score)
% Score = number of key symptoms matched
diagnose_score(PatientSymptoms, Disease, Score) :-
    disease(Disease, KeySymptoms),
    count_matches(KeySymptoms, PatientSymptoms, Score),
    Score > 0.     % only report diseases with at least one match

% get_ranked_diagnoses(+PatientSymptoms, -Ranked)
% Ranked is list of Disease-Score pairs sorted descending by Score
get_ranked_diagnoses(PatientSymptoms, Ranked) :-
    findall(Score-Disease, (diagnose_score(PatientSymptoms, Disease, Score)), Pairs),
    sort(1, @>=, Pairs, SortedPairs),      % sort by Score descending
    pairs_to_list(SortedPairs, Ranked).

% helper: convert Score-Disease to Disease-Score list format
pairs_to_list([], []).
pairs_to_list([Score-Disease|T], [Disease-Score|Rest]) :-
    pairs_to_list(T, Rest).

% -----------------------
% 3) Utility predicates to print nicely
% -----------------------
print_ranked([]).
print_ranked([Disease-Score|T]) :-
    format('~w  (match score: ~w)~n', [Disease, Score]),
    print_ranked(T).

show_ranked(PatientSymptoms) :-
    get_ranked_diagnoses(PatientSymptoms, Ranked),
    ( Ranked = [] -> writeln('No matching diseases found.') ;
      writeln('Possible diagnoses (ranked):'), print_ranked(Ranked)
    ).

% -----------------------
% 4) Example helper that runs both strict and scored diagnosis:
%    diagnose(+PatientSymptoms)
% -----------------------
diagnose(PatientSymptoms) :-
    format('Patient symptoms: ~w~n~n', [PatientSymptoms]),
    writeln('Strict matches (diseases with ALL key symptoms):'),
    ( diagnose_strict(PatientSymptoms, D) ->
        ( write('- '), writeln(D), fail )  % force backtracking to list all
    ; writeln('None.')
    ; true
    ),
    nl,
    writeln('Ranked (partial matches):'),
    show_ranked(PatientSymptoms).

% -----------------------
% End of file
% -----------------------
