# -*- coding: utf-8 -*-
"""
Created on Mon Oct 11 13:00:33 2021

@author: Jess
"""
import os

window_length = 40

overlap = 0.5

num_sensor_feat = 6

input_size = 78

output_size = 3

path = "C:/Users/Jess/Documents/CG4002"

TRAINING_FOLDER = os.path.join(path, "Training_Data")

MODEL_PATH = os.path.join(path, "saved_model.pth")

SC_EN_PATH = os.path.join(path, "scaler_encoder.pkl")