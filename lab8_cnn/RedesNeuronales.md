
## Explication 
The net is made of 4 layers, the first and the third one are convolutional layers and the second and fourth one are pool layer. For the convolutional layer we decided to use a 15 x 15 kernel and a 7 x 7 kernel respectively. This decision was taken because we realized the textures aren't discriminative between them in small scales. In other words a small kernel doesn't work in this problem. In the other hand, in the "pooling" stage, we decided take a maximum in [ 4 4 ] and [4 4] windows. This values was chosen in order to take a significative region, again in small scales the textures aren't differents.

For the final net, we tried 4 different configurations but the most of these taken a very much time and the error was not significative difference with the final net. First of all we tried a 14 layers with some variation in the number of  epoch, then we tried to reduce the number of layer and we made a 8 layers net but as we said these take a very much time and te results are not significative better so we decides to reduce again the net and made the final 6 layer net (2 convolutional 2 pooling, one of relu and one of softmaxloss).

## Results 
