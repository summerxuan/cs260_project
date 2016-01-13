d_img = dir('jaffe/*.tiff');
nfiles_img = length(d_img);

cell_img = struct2cell(d_img);

file_id = zeros(1,nfiles_img);
run matconvnet-1.0-beta16/matlab/vl_setupnn
result = zeros(nfiles_img,2);
net = load('mycnn_2.mat') ;
for i = 1:nfiles_img
img =['jaffe/',cell_img{1,i}];


im = imread(img) ;
%im = cat(3,im,im,im);
im = im(1:250,:,:) ; % crop
im_ = single(im) ; % note: 255 range
im_ = imresize(im_, net.n.normalization.imageSize(1:2)) ;
im_ = bsxfun(@minus,im_,net.n.normalization.averageImage) ;
res = vl_simplenn(net.n, im_) ;

% show the classification result
scores = squeeze(gather(res(end).x)) ;
[bestScore, best] = max(scores) ;
result(i,1) = best;
result(i,2) = bestScore;
end
