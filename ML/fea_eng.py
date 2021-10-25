# -*- coding: utf-8 -*-
"""
Created on Mon Oct 11 13:34:07 2021

@author: Jess
"""
from scipy import stats
import numpy as np
import ML.config as config
import pandas as pd

def feature_eng(df):
    output_df = []
    for idx,row in df.iterrows():
        sensor_window = row.to_numpy().flatten().reshape(config.num_sensor_feat, config.window_length)
        minimum = np.min(sensor_window, axis=1)
        maximum = np.max(sensor_window, axis=1)
        mean = np.mean(sensor_window, axis=1)
        var = np.var(sensor_window, axis=1)
        mad = stats.median_abs_deviation(sensor_window, axis=1)
        iqr = stats.iqr(sensor_window, axis=1)
        kurtosis = stats.kurtosis(sensor_window, axis=1)
        features = [minimum, maximum, mean, var, mad, iqr, kurtosis]
        correlations = []
        for i in range(len(sensor_window)):
            base = (i // 3) * 3
            #print(base, base + i % 3, base + (i + 1) % 3)
            corr = np.correlate(sensor_window[base + i % 3], sensor_window[base + (i + 1) % 3])[0]
            correlations.append(corr)
        features.append(correlations)
        fft = np.abs(np.fft.fft(sensor_window[:6], axis=1))
        fft = fft[:, :5] #
        features.extend(fft)
        fea_arr = np.concatenate(features)
        output_df.append(fea_arr)
    output_df = pd.DataFrame(output_df)
    return output_df
