
## Explication 
The net is made of 4 layers, the first and the third one are convolutional layers and the second and fourth one are pool layer. For the convolutional layer we decided to use a 15 x 15 kernel and a 7 x 7 kernel respectively. This decision was taken because we realized the textures aren't discriminative between them in small scales. In other words a small kernel doesn't work in this problem. In the other hand, in the "pooling" stage, we decided take a maximum in [ 4 4 ] and [4 4] windows. This values was chosen in order to take a significative region, again in small scales the textures aren't differents.

For the final net, we tried 4 different configurations but the most of these taken a very much time and the error was not significative difference with the final net. First of all we tried a 14 layers with some variation in the number of  epoch, then we tried to reduce the number of layer and we made a 8 layers net but as we said these take a very much time and te results are not significative better so we decides to reduce again the net and made the final 6 layer net (2 convolutional 2 pooling, one of relu and one of softmaxloss).

## Results 
To train the neural network we use a batch size of 25 and 3 epoch, this means that in each epoch there was 750 batches. The time that took to train the proposed Neural Networks was 60 minutos. In average each batch lasted 1 seconds, this means that the net process from 15 to 20 image for second. So the time of each epoch was 30 minutes. Respect to the results, in training set we has an error average 80% in the first epoch. We trained the network but we realized that the net has a problem because when the number of images are greater than 700 the filters were not working. For this we could not test our neural network. 


