from sklearn import tree

# Example dataset: [Weather, Temperature]
X = [[0, 30], [0, 40], [1, 25], [1, 35], [2, 20], [2, 30]]
Y = ["No", "No", "Yes", "Yes", "Yes", "No"]

clf = tree.DecisionTreeClassifier()
clf = clf.fit(X, Y)

# Predict
print("Prediction:", clf.predict([[1, 28]]))  # Example input
