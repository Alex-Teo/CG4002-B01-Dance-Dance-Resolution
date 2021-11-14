# -*- coding: utf-8 -*-
"""
Created on Thu Sep 16 18:59:46 2021

@author: Jess
"""
from sklearn.svm import SVC
import pandas as pd
import seaborn as sns
from sklearn.preprocessing import LabelEncoder
from sklearn.metrics import confusion_matrix,classification_report
#from sklearn.model_selection import RandomizedSearchCV
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

Y_test=encoder.transform(Y_test)

'''
#hyperparameter tuning
Best C: 1000
Best gamma: 0.0001
Best kernel: rbf
hyperparameters = {'C':[1,10,100,1000],'gamma':[1,0.1,0.001,0.0001], 'kernel':['linear','rbf']}
clf = RandomizedSearchCV(SVC(),hyperparameters,refit = True, verbose=2)
best_model = clf.fit(X_train,Y_train)
#Print The value of best Hyperparameters
print('Best C:', best_model.best_estimator_.get_params()['C'])
print('Best gamma:', best_model.best_estimator_.get_params()['gamma'])
print('Best kernel:', best_model.best_estimator_.get_params()['kernel'])

predict_y = best_model.predict(X_test)
'''
svc = SVC(C=1000,kernel='rbf',gamma=0.001)
svc_model = svc.fit(X_train,Y_train)
predict_y = svc_model.predict(X_test)


#decode the one hot encoding

y_test_string  = list(encoder.inverse_transform(Y_test))
y_pred_string = list(encoder.inverse_transform(predict_y))

print(classification_report(y_test_string,y_pred_string))
print(confusion_matrix(y_test_string, y_pred_string))

#show confusion matrix
cf_matrix = confusion_matrix(y_test_string, y_pred_string)
p = sns.heatmap(cf_matrix, annot=True, xticklabels=['STANDING', 'SITTING', 'LAYING', 'WALKING', 'WALKING_DOWNSTAIRS',
       'WALKING_UPSTAIRS'], yticklabels=['STANDING', 'SITTING', 'LAYING', 'WALKING', 'WALKING_DOWNSTAIRS',
       'WALKING_UPSTAIRS'], fmt='g')
p.set_xlabel("Predicted Label", fontsize = 10)
p.set_ylabel("True Label", fontsize = 10)
