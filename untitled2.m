fprintf('Splitting Data into training and testing sets');
[XTrain XTest yTrain yTest] = splitData(feature_img, label_img);
fprintf('...done\n\n');

%% Initialize parameters
fprintf('Initializing parameters');
m = size(X, 1); % number of examples
lambda = 0.1; % regularization parameter
numLabels = size(unique(y),1); % number of labels
fprintf('...done\n');

%% Training Logistic Regression classifier
fprintf('Training One-vs-All Logistic Regression');

theta = LRClassifier(XTrain, yTrain, numLabels, lambda);
fprintf('...done\n');

%% Predict numbers 
prediction = predict(theta, XTest);

%% Calculate Accuracy over the training data
fprintf('\nTest Set Accuracy: %f\n', mean(double(prediction == yTest)) * 100);
