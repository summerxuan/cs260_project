% Face++ Matlab SDK demo

clc; clear;
% Load an image, input your API_KEY & API_SECRET
d_img = dir('jaffe/*.tiff');
nfiles_img = length(d_img);

cell_img = struct2cell(d_img);
feature_img = zeros(nfiles_img,83*2);
label_img = zeros(nfiles_img,1);
for i = 1:nfiles_img
img =['jaffe/',cell_img{1,i}];
label_img(i,1) = label_dict(img(10:11));
%display(fileID_img);
API_KEY = 'd45344602f6ffd77baeab05b99fb7730';
API_SECRET = 'jKb9XJ_GQ5cKs0QOk6Cj1HordHFBWrgL';

% If you have chosen Amazon as your API sever and 
% changed API_KEY&API_SECRET into yours, 
% pls reform the FACEPP call as following :
% api = facepp(API_KEY, API_SECRET, 'US')
api = facepp(API_KEY, API_SECRET);

% Detect faces in the image, obtain related information (faces, img_id, img_height, 
% img_width, session_id, url, attributes)
rst = detect_file(api, img, 'all');
img_width = rst{1}.img_width;
img_height = rst{1}.img_height;
face = rst{1}.face;
fprintf('Totally %d faces detected!\n', length(face));

im = imread(img);
imshow(im);
hold on;


    % Draw face rectangle on the image
    face_i = face{1};
    center = face_i.position.center;
    w = face_i.position.width / 100 * img_width;
    h = face_i.position.height / 100 * img_height;
    rectangle('Position', ...
        [center.x * img_width / 100 -  w/2, center.y * img_height / 100 - h/2, w, h], ...
        'Curvature', 0.4, 'LineWidth',2, 'EdgeColor', 'blue');
    
    % Detect facial key points
    rst2 = api.landmark(face_i.face_id, '83p');
    landmark_points = rst2{1}.result{1}.landmark;
    landmark_names = fieldnames(landmark_points);
    
    % convert the data to feature matrix and normalize 
    
    cell = struct2cell(landmark_points);
    for j = 1:83
        feature_img(i,(2*j-1)) = cell{j}.x;
        feature_img(i,(2*j)) = cell{j}.y;
     end
    
    % Draw facial key points

end

%svm
ConfigStr= sprintf('-t 0 -v 5 -c 1'); 
model = svmtrain(label_img,feature_img,ConfigStr);

% decision tree
tree_model = ClassificationTree.fit(feature_img,label_img)
tree_pred = predict(tree_model, feature_img)
count = 0;
for i = 1:213
    if (tree_pred(i) == label_img(i))
        count = count+1;
    end
end
count/213

% dataset divided into training set and test set
id = randperm(213,170);
train_fea = feature_img(id,:);
train_lab = label_img(id,:);
id2 = 1:213;
id2(id) = [];
test_fea = feature_img(id2,:);
test_lab = label_img(id2,:);

% knn
knn_model = fitensemble(train_fea, train_lab, 'subspace', 'AllPredictorCombinations', 'KNN');
knn_pred = predict(knn_model, test_fea);
count_k = 0;
for i = 1:43
    if (knn_pred(i) == test_lab(i))
        count_k = count_k+1;
    end
end
count_k/43

% decision tree
tree_model = ClassificationTree.fit(train_fea, train_lab);
tree_pred = predict(tree_model, test_fea);
count = 0;
for i = 1:43
    if (tree_pred(i) == test_lab(i))
        count = count+1;
    end
end
count/43


% add angles as new features
new_features = zeros(213,22);
for i = 1:213
 new_features(i,:) = angles(feature_img(i,:));
end
total_features = [feature_img, new_features];

%svm
ConfigStr= sprintf('-t 0 -v 5 -c 1'); 
model = svmtrain(label_img,total_features,ConfigStr);

% decision tree
tree_model = ClassificationTree.fit(total_features,label_img)
tree_pred = predict(tree_model, total_features)
count = 0;
for i = 1:213
    if (tree_pred(i) == label_img(i))
        count = count+1;
    end
end
count/213
