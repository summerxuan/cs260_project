classes = '1234567';
cell_img = struct2cell(d_img);
feature_img = zeros(nfiles_img,83*2);
label_img = zeros(nfiles_img,1);
file_id = zeros(1,nfiles_img);
img_data = zeros(256,256,3,nfiles_img);
file_set = ones(1,nfiles_img);
file_label = zeros(1,nfiles_img);
names = cell(1,nfiles_img);
for i = 1:nfiles_img
img =['jaffe/',cell_img{1,i}];

names{i} = img;

file_id(1,i) = i;
if(mod(i,5)==0)
    file_set(1,i)=2;
end
label_img(i,1) = label_dict(img(10:11));
file_label(1,i) = label_img(i,1);
%display(fileID_img);
API_KEY = 'd45344602f6ffd77baeab05b99fb7730';
API_SECRET = 'jKb9XJ_GQ5cKs0QOk6Cj1HordHFBWrgL';

% If you have chosen Amazon as your API sever and 
% changed API_KEY&API_SECRET into yours, 
% pls reform the FACEPP call as following :
% api = facepp(API_KEY, API_SECRET, 'US')

im = imread(img);
im = cat(3,im,im,im);

    img_data(:,:,:,i) = im;
    % Draw facial key points

end
%svm model
%ConfigStr= sprintf('-t 0 -v 5 -c 1'); 
%model = svmtrain(label_img,feature_img,ConfigStr);
images = struct('id',file_id,'data',img_data,'label',file_label,'set',file_set);