from sklearn.neighbors import KNeighborsClassifier
import pandas as pd
import seaborn as sns
from sklearn.preprocessing import LabelEncoder
from sklearn.metrics import confusion_matrix,classification_report
from sklearn.model_selection import RandomizedSearchCV
from sklearn.preprocessing import StandardScaler
import numpy as np
df_train = pd.read_csv("./Documents/CG4002/train.csv")
test_data=pd.read_csv('./Documents/CG4002/test.csv')

# drop useless col
df_train = df_train.drop(['subject'], axis=1)
X_train = df_train.drop(['Activity'], axis=1)
Y_train = df_train['Activity']
X_test = test_data.drop(['Activity', 'subject'], axis=1)
Y_test = test_data['Activity']

#feature selection

#Features with high correlation are more linearly dependent and hence
#have almost the same effect on the dependent variable.
#So, when two features have high correlation,
#we can drop one of the two features.
corr = X_train.corr()
columns = np.full((corr.shape[0],), True, dtype=bool)
for i in range(corr.shape[0]):
    for j in range(i+1, corr.shape[0]):
        if corr.iloc[i,j] >= 0.99:
            if columns[j]:
                columns[j] = False
selected_columns = X_train.columns[columns]
X_train = X_train[selected_columns]
X_test = X_test[selected_columns]
     

#normalization
sc=StandardScaler()
X_train=sc.fit_transform(X_train)
X_test=sc.transform(X_test)

#one hot encode
encoder=LabelEncoder()
Y_train=encoder.fit_transform(Y_train)
Y_train=pd.get_dummies(Y_train).values

Y_test=encoder.transform(Y_test)
Y_test=pd.get_dummies(Y_test).values

'''
#hyperparamter tuning
Best leaf_size: 42
Best p: 1
Best n_neighbors: 19
#List Hyperparameters that we want to tune.
leaf_size = list(range(1,50))
n_neighbors = list(range(1,30))
p=[1,2]
#Convert to dictionary
hyperparameters = dict(leaf_size=leaf_size, n_neighbors=n_neighbors, p=p)
#Create new KNN object
knn = KNeighborsClassifier()
#Use GridSearch
clf = RandomizedSearchCV(knn, hyperparameters, cv=10, verbose=2)
#Fit the model
best_model = clf.fit(X_train,Y_train)
#Print The value of best Hyperparameters
print('Best leaf_size:', best_model.best_estimator_.get_params()['leaf_size'])
print('Best p:', best_model.best_estimator_.get_params()['p'])
print('Best n_neighbors:', best_model.best_estimator_.get_params()['n_neighbors'])

predict_y = best_model.predict(X_test)
'''
knn = KNeighborsClassifier(n_neighbors=19,leaf_size=42,p=1)
knn_model = knn.fit(X_train,Y_train)
predict_y = knn_model.predict(X_test)

#decode the one hot encoding
predic_no_encode = predict_y.argsort()[:,-1]
Y_test_no_encode = Y_test.argsort()[:,-1]
y_test_string  = list(encoder.inverse_transform(Y_test_no_encode))
y_pred_string = list(encoder.inverse_transform(predic_no_encode))

print(classification_report(y_test_string,y_pred_string))

#show confusion matrix
cf_matrix = confusion_matrix(y_test_string, y_pred_string)
p = sns.heatmap(cf_matrix, annot=True, xticklabels=['STANDING', 'SITTING', 'LAYING', 'WALKING', 'WALKING_DOWNSTAIRS',
       'WALKING_UPSTAIRS'], yticklabels=['STANDING', 'SITTING', 'LAYING', 'WALKING', 'WALKING_DOWNSTAIRS',
       'WALKING_UPSTAIRS'], fmt='g')
p.set_xlabel("Predicted Label", fontsize = 10)
p.set_ylabel("True Label", fontsize = 10)