% --- Facts: disease and recommended foods ---

% Format: diet(Disease, Food).
diet(diabetes, oats).
diet(diabetes, green_vegetables).
diet(diabetes, brown_rice).

diet(hypertension, banana).
diet(hypertension, spinach).
diet(hypertension, beetroot).

diet(obesity, salad).
diet(obesity, fruits).
diet(obesity, green_tea).

diet(anemia, spinach).
diet(anemia, beetroot).
diet(anemia, pomegranate).

diet(heart_disease, oats).
diet(heart_disease, nuts).
diet(heart_disease, fish).

% --- Rules ---
recommend(Disease, Food) :-
    diet(Disease, Food).
