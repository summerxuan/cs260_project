%
% Face++ Matlab SDK demo
%

clc; clear;
% Load an image, input your API_KEY & API_SECRET
d_dfh_anger = dir('dfh_all/dfh_un-rimmed/dfh_anger_x/*.jpg');
nfiles_dfh_anger = length(d_dfh_anger);

cell_dfh_anger = struct2cell(d_dfh_anger);
feature_dfh_anger = zeros(nfiles_dfh_anger,83*2);
label_dfh_anger = ones(nfiles_dfh_anger,1);
%anger labeled as 1

for i = 1:nfiles_dfh_anger
dfh_anger =['dfh_all/dfh_un-rimmed/dfh_anger_x/',cell_dfh_anger{1,i}];
%display(fileID_img);
API_KEY = 'd45344602f6ffd77baeab05b99fb7730';
API_SECRET = 'jKb9XJ_GQ5cKs0QOk6Cj1HordHFBWrgL';

% If you have chosen Amazon as your API sever and 
% changed API_KEY&API_SECRET into yours, 
% pls reform the FACEPP call as following :
%api = facepp(API_KEY, API_SECRET, 'US')
api = facepp(API_KEY, API_SECRET);

% Detect faces in the image, obtain related information (faces, img_id, img_height, 
% img_width, session_id, url, attributes)
rst = detect_file(api, dfh_anger, 'all');
img_width = rst{1}.img_width;
img_height = rst{1}.img_height;
face = rst{1}.face;
fprintf('Totally %d faces detected!\n', length(face));
if(isempty(face))
   continue; 
end
im = imread(dfh_anger);
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
        feature_dfh_anger(i,(2*j-1)) = cell{j}.x;
        feature_dfh_anger(i,(2*j)) = cell{j}.y;
     end
    
    % Draw facial key points

end

