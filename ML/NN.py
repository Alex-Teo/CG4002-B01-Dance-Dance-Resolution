# -*- coding: utf-8 -*-
"""
Created on Thu Sep 16 20:24:39 2021

@author: Jess
"""
import pandas as pd
import numpy as np
import seaborn as sns
from sklearn.preprocessing import LabelEncoder
from sklearn.metrics import confusion_matrix,classification_report
from sklearn.preprocessing import StandardScaler
import matplotlib.pyplot as plt 
import torch
from torch import nn
from torch.utils.data import Dataset
import skorch
from skorch import NeuralNetClassifier



encoder=LabelEncoder()
# dataset definition
class ActivityDataset(Dataset):
    # load the dataset
    def __init__(self, trainpath, testpath):
        # store the inputs and outputs
        train_df = pd.read_csv(trainpath)
        train_df = train_df.sample(frac=1).reset_index(drop=True)
        train_df = train_df.drop(['subject'], axis=1)
        train_X = train_df.drop(['Activity'], axis=1)
        train_Y = train_df['Activity']
        
        test_df = pd.read_csv(testpath)
        test_df = test_df.drop(['subject'], axis=1)
        test_X = test_df.drop(['Activity'], axis=1)
        test_Y = test_df['Activity']
        
        #feature selection
        '''
        Features with high correlation are more linearly dependent and hence
        have almost the same effect on the dependent variable.
        So, when two features have high correlation,
        we can drop one of the two features.
        '''
        corr = train_X.corr()
        columns = np.full((corr.shape[0],), True, dtype=bool)
        for i in range(corr.shape[0]):
            for j in range(i+1, corr.shape[0]):
                if corr.iloc[i,j] >= 0.99:
                    if columns[j]:
                        columns[j] = False
        selected_columns = train_X.columns[columns]
        train_X = train_X[selected_columns]
        test_X = test_X[selected_columns]
        
        
        sc=StandardScaler()
        train_X=sc.fit_transform(train_X)
        test_X=sc.fit_transform(test_X)
        train_Y=encoder.fit_transform(train_Y)
        test_Y = encoder.transform(test_Y)
        self.train_X = train_X.astype(np.float32)
        self.train_Y = train_Y.astype(np.longlong)
        self.test_X = test_X.astype(np.float32)
        self.test_Y = test_Y.astype(np.longlong)

    # number of rows in the dataset
    def __len__(self):
        return len(self.X)

    # get a row at an index
    def __getitem__(self, idx):
        return [self.X[idx], self.y[idx]]
    
dataset = ActivityDataset("./Documents/CG4002/train.csv", "./Documents/CG4002/test.csv")



input_size = dataset.train_X.shape[1]
output_size = 6

class NNModel(nn.Module):
    def __init__(self, num_units=8, nonlin=nn.ReLU()):
        super(NNModel, self).__init__()

        self.dense0 = nn.Linear(input_size, num_units)
        self.nonlin = nonlin
        self.output = nn.Linear(num_units, output_size)

    def forward(self, X, **kwargs):
        X = self.nonlin(self.dense0(X))
        X = self.output(X)
        return X

net = NeuralNetClassifier(
    NNModel,
    max_epochs=100,
    optimizer=torch.optim.Adam,
    optimizer__weight_decay=0.07,
    batch_size=64,
    lr=0.001,
    criterion = nn.CrossEntropyLoss,
    train_split=skorch.dataset.CVSplit(cv=3, stratified=True, random_state=None),
)

'''
from sklearn.model_selection import RandomizedSearchCV

params = {
    'lr': [0.001],
    'module__num_units': [8, 16, 32, 64],
    'optimizer__weight_decay':[0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07]
}
gs = RandomizedSearchCV(net, params, refit=False, cv=5, scoring='accuracy')
bestmodel = gs.fit(dataset.train_X, dataset.train_Y)
print(gs.best_score_, gs.best_params_)
print(gs.cv_results_)
'''
#training
net.fit(dataset.train_X, dataset.train_Y)
# Save
net.save_params(f_params='./Documents/CG4002/nn_params.pkl')


val_loss=[]
train_loss=[]

for i in range(100):
    val_loss.append(net.history[i]['valid_loss'])
    train_loss.append(net.history[i]['train_loss'])
    
fig, (ax1, ax2) = plt.subplots(1, 2)
ax1.semilogy(train_loss, label='Train loss')
ax1.semilogy(val_loss, label='Validation loss')
ax1.set_xlabel('Epoch')
ax1.set_ylabel('Loss')
ax1.grid()
ax1.legend()

#test
predictions = net.predict(dataset.test_X)
actuals = dataset.test_Y
y_test_string  = list(encoder.inverse_transform(actuals))
y_pred_string = list(encoder.inverse_transform(predictions))
print(classification_report(y_test_string,y_pred_string))
print(confusion_matrix(actuals,predictions))
cm=confusion_matrix(actuals,predictions)
p = sns.heatmap(cm, annot=True, xticklabels=['STANDING', 'SITTING', 'LAYING', 'WALKING', 'WALKING_DOWNSTAIRS',
       'WALKING_UPSTAIRS'], yticklabels=['STANDING', 'SITTING', 'LAYING', 'WALKING', 'WALKING_DOWNSTAIRS',
       'WALKING_UPSTAIRS'], fmt='g',  ax=ax2)
p.set_xlabel("Predicted Label", fontsize = 10)
p.set_ylabel("True Label", fontsize = 10)


# Load
newmodel = NeuralNetClassifier(
    NNModel,
    max_epochs=100,
    optimizer=torch.optim.Adam,
    optimizer__weight_decay=0.07,
    batch_size=64, #predict for 1 sample
    lr=0.001,
    criterion = nn.CrossEntropyLoss,
    train_split=skorch.dataset.CVSplit(cv=3, stratified=True, random_state=None),
)
newmodel.initialize()  
newmodel.load_params(f_params='./Documents/CG4002/nn_params.pkl')

print((dataset.test_X[0]))
print(f'Actual class : {dataset.test_Y[0]}')

pred = newmodel.predict(np.array([dataset.test_X[0]]))
print(f'Predicted class : {pred}')

