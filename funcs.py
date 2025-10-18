from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier

def train_random_forest(dataset, features, target, test_ratio=0.2, estimators=200, seed=42):
    df = dataset[features].dropna()

    X = df.drop(columns=target).select_dtypes(include='number')
    y = df[target]

    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=test_ratio, shuffle=False)

    model = RandomForestClassifier(n_estimators=estimators, random_state=seed)
    model.fit(X_train, y_train)

    return model, model.score(X_test, y_test)