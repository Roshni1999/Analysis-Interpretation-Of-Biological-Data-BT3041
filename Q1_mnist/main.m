% MNIST data
clear;
clc;
close all
% Load MNIST dataset
load('mnist_data.mat');
trainImages = double(trainImages)' / 255;
testImages = double(testImages)' / 255;
trainLabels = double(trainLabels)';
testLabels = double(testLabels)';

%%
% Transform labels to correct target values.
TargetValuesTrain = zeros(10, size(trainLabels, 1));
TargetValuesTest = zeros(10, size(testLabels, 1));
for n = 1: size(trainLabels, 1)
    TargetValuesTrain(trainLabels(n) + 1, n) = 1;
end
for n = 1: size(testLabels, 1)
    TargetValuesTest(testLabels(n) + 1, n) = 1;
end
    
%% 
noHiddenUnits =100; %Network Architecture
learningRate = 1; %Learning Rate
    
batchSize = 800; % Choosing batch size as entire train dataset
epochs = 500;
    
fprintf('No of hidden units: %d.\n', noHiddenUnits);
fprintf('Activation function used: Logistic Sigmoid. \n');
fprintf('Error function: MSE. \n');
fprintf('Learning rate: %d.\n', learningRate);

[MSEtrain, MSEtest, TrainAccuracy, TestAccuracy] = training(noHiddenUnits, trainImages, trainLabels, TargetValuesTrain, ...
          testImages, testLabels, TargetValuesTest, epochs, batchSize, learningRate);
    
%%  

fprintf('Final Accuracy after %d epochs: \n', epochs);
fprintf('Training Accuracy: %d \n', TrainAccuracy);
fprintf('Test Accuracy: %d \n', TestAccuracy);
   
