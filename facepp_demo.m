%
% Face++ Matlab SDK demo
%
%
clc; clear;
% Load an image, input your API_KEY & API_SECRET
d_people = dir('CK+/cohn-kanade-images');
nfiles_people = length(d_people);
%people_cell_x={};
%people_cell_y = {};
for i = 64:64
     file = ['CK+/cohn-kanade-images/',d_people(i).name];
     d_emotion= dir(file);
     n_type_emotion = length(d_emotion);
     emotion_cell_x = {};
     emotion_cell_y = {};
     for j = 4: n_type_emotion
         images = [file,'/',d_emotion(j).name,'/*.png'];
         txt = [file,'/',d_emotion(j).name,'/*.txt'];
         d_img = dir(images);
         
         cell_img = struct2cell(d_img);
         n_img = length(d_img);
         d_label = dir(txt);
         if(length(d_label)==0)
             %which means do not have label
              label_img = zeros(n_img,1);
              continue;
         else
         file_name = [file,'/',d_emotion(j).name,'/',d_label(1).name];
         f_label_id = fopen(file_name);
       
        
            C = textscan(f_label_id,'%d');
            label = C{1,1};
            label_img = double(label)*ones(n_img,1);
         end
         feature_img = zeros(n_img,83*2);
         for k = 1: n_img
             img =[file,'/',d_emotion(j).name,'/',cell_img{1,k}];

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
                if(length(face)==0)
                    continue;
                end
                fprintf('Totally %d faces detected!\n', length(face));

                im = imread(img);
    face_i = face{1};
    % Detect facial key points
    rst2 = api.landmark(face_i.face_id, '83p');
    landmark_points = rst2{1}.result{1}.landmark;
    landmark_names = fieldnames(landmark_points);
    
    % convert the data to feature matrix and normalize 
    
    cell = struct2cell(landmark_points);
   
    for q = 1:83
        feature_img(k,(2*q-1)) = cell{q}.x;
        feature_img(k,(2*q)) = cell{q}.y;
       
     end
     end
     emotion_cell_x{1,j-3} = feature_img;
     emotion_cell_y{1,j-3} = label_img;
     end
     %people_cell_x{1,i-3} = emotion_cell_x;
     %people_cell_y{1,i-3} = emotion_cell_y;
end
