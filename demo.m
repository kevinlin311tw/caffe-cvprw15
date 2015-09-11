% Demo of binary codes and deep feature extraction  
% Modify 'test_file_list' and get the features of your images!

close all;
clear;

% -----------------------------------------------------------
% 48-bits binary codes extraction
%
% input
%   	img_list.txt:  list of images files 
% output
%   	binary_codes: 48 x num_images output binary vector
%   	list_im: the corresponding image path
%
% ----- settings start here -----
% set 1 to use gpu, and 0 to use cpu
use_gpu = 1;
% binary code length
feat_len = 48;
% models
model_file = './examples/cvprw15-cifar10/KevinNet_CIFAR10_48.caffemodel';
% model definition
model_def_file = './examples/cvprw15-cifar10/KevinNet_CIFAR10_48_deploy.prototxt';
% input data
test_file_list = 'img_list.txt';
% ------ settings end here ------

[feat_test , list_im] = matcaffe_batch_feat(test_file_list, use_gpu, feat_len, model_def_file, model_file);
binary_codes = (feat_test>0.5);
save('binary48.mat','binary_codes','list_im','-v7.3');



% -----------------------------------------------------------
% layer7 feature extraction
%
% input
%   	img_list.txt:  list of images files 
%
% output
%   	scores: 4096 x num_images output vector
%   	list_im: the corresponding image path
%
% ----- settings start here -----
% set 1 to use gpu, and 0 to use cpu
use_gpu = 1;
% binary code length
feat_len = 4096;
% models
model_file = './examples/cvprw15-cifar10/KevinNet_CIFAR10_48.caffemodel';
% model definition
model_def_file = './models/bvlc_reference_caffenet/deploy_l7.prototxt';
% input data
test_file_list = 'img_list.txt';
% ------ settings end here ------

[feat_test , list_im] = matcaffe_batch_feat(test_file_list, use_gpu, feat_len, model_def_file, model_file);
save('feat4096.mat','feat_test','list_im','-v7.3');
