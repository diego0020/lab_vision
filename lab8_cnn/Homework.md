## Net Description
The arquiterture of the net is based on the LeNet and AlexNet because this reference nets are famous by your good performance.
Both nets begin with a layer secuence conv-maxpooling-conv. The first layer in LeNet have a stride of 1 and in AlexNet have a stride of 4.
As mid-point I choose a stride of 3. The dimensions of the first filters was selected as a mid-point between the filters size of LeNet and AlexNet.
The last filters size was selected to reduce the size to 1x1.

## Results
The time to train the net was aprox. 3 hours 
Unfortunatelly the result of the designed net was not better that a random selection of the classes (like if the Net throw a 25-faces-dice to choose the prediction)
The error with 1 class was 96.0% and the error with 5 classes was 80.0%, both in train and validation.
