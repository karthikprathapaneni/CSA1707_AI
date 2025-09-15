% --- Facts: known symptoms ---
symptom(fever).
symptom(cough).
symptom(fatigue).
% (you can add/remove symptoms as needed)

% --- Rules: disease if all required symptoms are true ---
disease(flu) :-
    symptom(fever),
    symptom(cough),
    symptom(fatigue).

disease(covid19) :-
    symptom(fever),
    symptom(cough),
    symptom(shortness_of_breath).

disease(malaria) :-
    symptom(fever),
    symptom(chills),
    symptom(headache).

% --- Query: is a disease present? ---
diagnose(Disease) :-
    disease(Disease).
