# -*- coding: utf-8 -*-
"""
Created on Mon Oct 11 20:18:49 2021

@author: Jess
"""

from torch import nn
import config


class NNModel(nn.Module):
    def __init__(self, num_units=8, nonlin=nn.ReLU()):
        super(NNModel, self).__init__()

        self.dense0 = nn.Linear(config.input_size, num_units)
        self.nonlin = nonlin
        self.output = nn.Linear(num_units, config.output_size)

    def forward(self, X, **kwargs):
        X = self.nonlin(self.dense0(X))
        X = self.output(X)
        return X
