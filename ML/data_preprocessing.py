# -*- coding: utf-8 -*-
"""
Created on Sun Oct 10 22:23:34 2021

@author: Jess
"""
import pandas as pd
import os
import numpy as np

#import sys #add sys path to import config.py
#sys.path.append('C:\\Users\\Jess\\Documents\\CG4002')
#print(sys.path)

import ML.config as config



def window_seg(df, start):
    window = df.iloc[start:(start+config.window_length), 0:6]
    nparray = window.to_numpy()
    nparray = nparray.flatten('F')
    return nparray

def preprocess_single(data):
    raw = np.array(data).flatten('F')
    raw_df = pd.DataFrame([raw], columns=np.arange(config.window_length * config.num_sensor_feat))
    return raw_df

def preprocess():
    df = pd.DataFrame()
    for file in os.listdir(config.TRAINING_FOLDER):
        if file.endswith("hand.csv"):
            print(file)
            df1 = pd.read_csv(f'{config.TRAINING_FOLDER}/{file}')
            df1.drop(['Beetle'], axis=1, inplace=True)
            raw = []
            len_df = df1.shape[0]
            num_of_wind = ((len_df) // int(config.window_length * (1 - config.overlap))) - 1
            for window_id in range(num_of_wind):
                start = window_id * int(config.window_length * (1 - config.overlap))
                window_array = window_seg(df1, start)
                raw.append(window_array)
            raw_df = pd.DataFrame(raw, columns=np.arange(config.window_length * config.num_sensor_feat))
            raw_df['label'] = df1['Dance Move']
            df = df.append(raw_df,ignore_index=True)
    #df.to_csv('C:/Users/Jess/Documents/CG4002/Training_Data/segmented_data.csv', index=False)
    return df
