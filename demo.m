%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Demo of binary codes and deep feature extraction
% Modify the images in "img_list.txt" and get the features of your images!
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
close all;
clear;
addpath('matlab/caffe');
addpath('examples');

USE_GPU = 1; % 1 to use the GPU, 0 to use the CPU

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Demo of 48-bits binary codes extraction using our deep hashing method.
%
% input
%   	img_list.txt:  list of images files 
%
% output
%   	binary_codes: 48 x num_images output binary vector
%   	list_im: the corresponding image path
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[scores, list_im] = matcaffe_batch_KevinNet_CIFAR10_48('img_list.txt', USE_GPU);
binary_codes = (scores>0.5);
save('binary48.mat','binary_codes','list_im','-v7.3');





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Demo of layer7 feature extraction using our deep hashing method.
%
% input
%   	img_list.txt:  list of images files 
%
% output
%   	scores: 4096 x num_images output vector
%   	list_im: the corresponding image path
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[scores, list_im] = matcaffe_batch_KevinNet_CIFAR10_4096('img_list.txt', USE_GPU);
save('feat4096.mat','scores','list_im','-v7.3');
