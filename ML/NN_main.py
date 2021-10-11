import numpy as np
import pandas as pd
import matplotlib.pyplot as plt 
import torch
from sklearn.model_selection import train_test_split
from torch.utils.data import Subset
from torch.utils.data import DataLoader
from sklearn.metrics import accuracy_score
from torch import nn
from torch.utils.data import Dataset
import config
import data_preprocessing
import fea_eng
import scaling
import NN_model
        



# dataset definition
class ActivityDataset(Dataset):
    # load the dataset
    def __init__(self, df):
        # store the inputs and outputs
        #df = pd.read_csv(PATH)
        self.X = df.iloc[:,:-1]
        self.y = df.iloc[:,-1]
        self.X = self.X.astype('float32').to_numpy()
        self.y = self.y.astype(np.longlong).to_numpy()

    # number of rows in the dataset
    def __len__(self):
        return len(self.X)

    # get a row at an index
    def __getitem__(self, idx):
        return [self.X[idx], self.y[idx]]
    


class ML:
    def __init__(self):
        self.dance_data = []

    def dataloader_split(self, df, val_split=0.2):
        dataset = ActivityDataset(df) 
        train_idx, val_idx = train_test_split(list(range(len(dataset))), test_size=val_split, stratify=dataset.y)
        datasets = {}
        datasets['train'] = Subset(dataset, train_idx)
        datasets['val'] = Subset(dataset, val_idx)
        train_dl = DataLoader(datasets['train'], batch_size=32, shuffle=True)
        valid_dl = DataLoader(datasets['val'], batch_size=32, shuffle=True)
        return train_dl,valid_dl


    def train_model(self, train_dl, valid_dl, model):
        epochs = 60
        min_valid_loss = np.inf
        criterion = nn.CrossEntropyLoss()
        optimizer = torch.optim.Adam(model.parameters(), lr=0.001, weight_decay=0.08)
        val_loss_pt=[]
        train_loss_pt=[]
        train_accu = []
        val_accu = []
        for epoch in range(epochs):
            # enumerate mini batches
            train_loss = 0.0
            traincorrect=0
            traintotal=0
            model.train()
            for inputs, targets in train_dl:
                # clear the gradients
                optimizer.zero_grad()
                # compute the model output
                yhat = model(inputs)
                # calculate loss
                loss = criterion(yhat, targets)
                # credit assignment
                loss.backward()
                # update model weights
                optimizer.step()
                # Calculate Loss
                train_loss += loss.item() * inputs.size(0)
                _, predicted = yhat.max(1)
                traintotal += targets.size(0)
                traincorrect += predicted.eq(targets).sum().item()
            train_loss_pt.append(train_loss/len(train_dl.sampler))
            trainaccu=100.*traincorrect/traintotal
            train_accu.append(trainaccu)    
            
            
            valid_loss = 0.0
            valcorrect=0
            valtotal=0
            model.eval()     # Optional when not using Model Specific layer
            for vinputs, vtargets in valid_dl:
                # Forward Pass
                vyhat = model(vinputs)
                # Find the Loss
                valloss = criterion(vyhat, vtargets)
                # Calculate Loss
                valid_loss += valloss.item() * vinputs.size(0)
                _, predicted = vyhat.max(1)
                valtotal += vtargets.size(0)
                valcorrect += predicted.eq(vtargets).sum().item()
            valaccu=100.*valcorrect/valtotal
            val_accu.append(valaccu) 
            val_loss_pt.append(valid_loss/len(valid_dl.sampler))
     
            print(f'Epoch {epoch+1} Train Loss: {train_loss / len(train_dl)} Train Acc: {trainaccu}  Val Loss: {valid_loss / len(valid_dl)} Val Acc: {valaccu}')
             
            if min_valid_loss > valid_loss/len(valid_dl.sampler):
                print(f'Validation Loss Decreased({min_valid_loss:.6f}--->{valid_loss:.6f}) Saving The Model')
                min_valid_loss = valid_loss/len(valid_dl.sampler)
                 
                # Saving State Dict
                torch.save(model.state_dict(), config.MODEL_PATH)
                
        fig, (ax1, ax2) = plt.subplots(1, 2)
        ax1.semilogy(train_loss_pt, label='Train loss')
        ax1.semilogy(val_loss_pt, label='Validation loss')
        ax1.set_xlabel('Epoch')
        ax1.set_ylabel('Loss')
        ax1.grid()
        ax1.legend()
        ax2.semilogy(train_accu, label='Train Acc')
        ax2.semilogy(val_accu, label='Val Acc')
        ax2.set_xlabel('Epoch')
        ax2.set_ylabel('Acc')
        ax2.grid()
        ax2.legend()

    def load_model(self, MODEL_PATH):
        model = NN_model.NNModel()
        #print(torch.load(MODEL_PATH))
        model.load_state_dict(torch.load(MODEL_PATH))
        model.eval()
        return model

    def test_model(self, test_dl, model):
        predictions, actuals = list(), list()
        for inputs, targets in test_dl:
            # evaluate the model on the test set
            yhat = model(inputs)
            # retrieve numpy array
            _, predicted = yhat.max(1)
            predicted = predicted.detach().numpy()
            actual = targets.numpy()
            # store
            predictions.append(predicted)
            actuals.append(actual)
        
        predictions, actuals = np.hstack(predictions), np.hstack(actuals)
        # calculate accuracy
        acc = accuracy_score(actuals, predictions)
        return acc
    
    
    def training(self):
        data_df = data_preprocessing.preprocess()
        labels = data_df.pop('label')
        data_df = fea_eng.feature_eng(data_df)
        data_df['label'] = labels
        train, test = train_test_split(data_df, test_size=0.2, stratify=data_df['label'])
        train = scaling.data_scaling(train, train_mode=True)
        test = scaling.data_scaling(test, train_mode=True)
        train_dl, valid_dl = self.dataloader_split(train, 0.2)
        net = NN_model.NNModel()
        self.train_model(train_dl, valid_dl, net)
        print(self.predict(test, config.MODEL_PATH))      
        
        
    def predict_single_row(self, model_path):
        if len(self.dance_data) == config.window_length:
            data_df = data_preprocessing.preprocess_single(self.dance_data)
            data_df = fea_eng.feature_eng(data_df)
            data_df, loaded_encoder = scaling.data_scaling(data_df, train_mode=False)
            model = self.load_model(model_path)
            x = torch.from_numpy(data_df.astype('float32').to_numpy())
            prediction = model(x)
            _, predicted = prediction.max(1)
            predicted = loaded_encoder.inverse_transform(predicted.detach().numpy())
            self.reset_data()
            return predicted[0]
        return None

        
    def predict(self, df, model_path):
        dataset = ActivityDataset(df)
        test_dl = DataLoader(dataset)
        model = self.load_model(model_path)
        acc = self.test_model(test_dl, model)
        return acc
    
    def write_data(self, dancer_id, data):#todo implement dancer_id
        self.dance_data.append(data)
    
    def reset_data(self):
        self.dance_data = []



mlclass = ML()
data = pd.read_csv("C:/Users/Jess/Documents/CG4002/Training_Data/dab_hand.csv")
for idx,row in data.iterrows():
    
    mlclass.write_data(0, row[1:7].tolist())
    print(mlclass.predict_single_row(config.MODEL_PATH))
     