count = 0
for i = 1:213
    if(result(i,1)==label_img(i,1))
        count=count+1;
   end
end
d_img = dir('jaffe/*.tiff');
nfiles_img = length(d_img);
classes = '1234567';
cell_img = struct2cell(d_img);
I =['jaffe/',cell_img{1,1}];
I0 = imread(I);
sumImage = double(I0); % Inialize to first image.
for i = 2:nfiles_img
img =['jaffe/',cell_img{1,i}];
  rgbImage = imread(img);
  sumImage = sumImage + double(rgbImage);
end;
meanImage = sumImage / nfiles_img;