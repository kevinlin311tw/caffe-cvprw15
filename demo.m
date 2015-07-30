close all;
clear;
addpath('matlab/caffe');
addpath('examples');
[scores, list_im] = matcaffe_batch_KevinNet_CIFAR10_48('img_list.txt', 1);
binary_codes = (scores>0.5);
save('binary48.mat','binary_codes','list_im','-v7.3');

[scores, list_im] = matcaffe_batch_KevinNet_CIFAR10_4096('img_list.txt', 1);
save('feat4096.mat','scores','list_im','-v7.3');