# -*- coding: utf-8 -*-
"""
Created on Mon Oct 11 16:31:08 2021

@author: Jess
"""
import pandas as pd
from sklearn.preprocessing import LabelEncoder
from sklearn.preprocessing import StandardScaler
import os
import pickle
import ML.config as config

def data_scaling(df, train_mode):
    if train_mode: 
        X = df.drop(['label'], axis=1)
        Y = df['label']
        if os.path.isfile(config.SC_EN_PATH):
            with open(config.SC_EN_PATH, 'rb') as fp:
                sc, encoder = pickle.load(fp)
            X = sc.transform(X)
            X = pd.DataFrame(X)
            
            #ENCODE Y
            Y = encoder.transform(Y)
            Y = pd.DataFrame(Y)
            le_name_mapping = dict(zip(encoder.classes_, encoder.transform(encoder.classes_)))
            print(le_name_mapping)
            Y.columns = ['label']
        else:
            sc=StandardScaler()
            X = sc.fit_transform(X)
            X = pd.DataFrame(X)
            
            #ENCODE Y
            encoder = LabelEncoder()
            Y = encoder.fit_transform(Y)
            Y = pd.DataFrame(Y)
            le_name_mapping = dict(zip(encoder.classes_, encoder.transform(encoder.classes_)))
            print(le_name_mapping)
            Y.columns = ['label']
            with open(config.SC_EN_PATH, 'wb') as fp:
                pickle.dump((sc,encoder), fp)
        
        result = pd.concat([X, Y], axis=1)
        return result
    else:
        try:
            with open(config.SC_EN_PATH, 'rb') as fp:
                sc, encoder = pickle.load(fp)
            X = sc.transform(df)
            result = pd.DataFrame(X)
            return result, encoder
        except:
            print('No scaler stored, run training first')
    