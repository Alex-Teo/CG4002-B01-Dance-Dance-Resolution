# Machine Learning


## File Descriptions

### Preliminary Testing Folder

| File                    | Description                                                                              |
| ----------------------- | ---------------------------------------------------------------------------------------- |
| KNN.py                  | Code file for K-nearest neighbours                                                       |
| model_preliminary.ipynb | Jupyter Notebook for preliminary testing of different models on dummy dataset            |
| NN.py                   | Neural network code for preliminary testing                                              |
| SVC.py                  | Support vector classifier for preliminary testing                                        |
| train & test.csv        | Training and testing dataset                                                             |

### Main Files

| File                  | Description                                                                                                            |
| --------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| config.py             | Configuration file for the model                                                                                       |
| data_preprocessing.py | Code to preprocess data and segmentation of data                                                                       |
| fea_eng.py            | Code to engineer features                                                                                              |
| NN_main.py            | Main Neural network code, training and testing of NN                                                                   |
| NN_model.py           | NN architecture                                                                                                        |
| saved_model.pth       | Saved model                                                                                                            |
| scaler_encoder.pkl    | Saved Encoder and Scaler object                                                                                        |
| scaling.py            | Code for scaling data                                                                                                  |
| SVC.py                | Support vector code                                                                                                    |


## For Training of model 
```
import NN_main as NN
mlclass = NN.ML()
print(mlclass.training())
```
## Writing data to ML and predicting
```
import NN_main as NN
dancer_1_mlclass = NN.ML()
dancer_1_prediction_list = []
for idx, row in incoming_data:
  dancer_1_mlclass.write_data(0, data[1:7].tolist())   #1st arg is dancer_id 2 arg is data e.g a list [GyroX, GyroY, GyroZ, AccX, AccY, AccZ]
  pred_1 = dancer_1_mlclass.predict(dancer_1_prediction_list)
  if pred_1 is not None:
    print(pred_1) #append pred_1 to mqueue
    dancer_1_prediction_list.clear()
    break
'''