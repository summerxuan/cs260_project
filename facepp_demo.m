%
% Face++ Matlab SDK demo
%

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

ConfigStr= sprintf('-t 0 -v 5 -c 1'); 
model = svmtrain(label_img,feature_img,ConfigStr);