function [KevinCIFAR4096_scores ,KevinCIFAR4096_list_im] = matcaffe_batch_KevinNet_CIFAR10_4096(y_ft_list_im, use_gpu)
% scores = matcaffe_batch(y_ft_list_im, use_gpu)
%
% Demo of the matlab wrapper using the ILSVRC network.
%
% input
%   y_ft_list_im  list of images files
%   use_gpu  1 to use the GPU, 0 to use the CPU
%
% output
%   scores   1000 x num_images ILSVRC output vector
%
% You may need to do the following before you start matlab:
%  $ export LD_LIBRARY_PATH=/opt/intel/mkl/lib/intel64:/usr/local/cuda/lib64
%  $ export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libstdc++.so.6
% Or the equivalent based on where things are installed on your system
%
% Usage:
%  scores = matcaffe_batch({'peppers.png','onion.png'});
%  scores = matcaffe_batch('y_ft_list_images.txt', 1);
if nargin < 1
  % For test purposes
  y_ft_list_im = {'peppers.png','onions.png'};
end
if ischar(y_ft_list_im)
    %Assume it is a file contaning the list of images
    filename = y_ft_list_im;
    y_ft_list_im = read_cell(filename);
end
% Adjust the batch size and dim to match with models/bvlc_reference_caffenet/deploy.prototxt
batch_size = 10;
%dim = 1000;
dim = 4096;
disp(y_ft_list_im)
if mod(length(y_ft_list_im),batch_size)
    warning(['Assuming batches of ' num2str(batch_size) ' images rest will be filled with zeros'])
end

% init caffe network (spews logging info)
if exist('use_gpu', 'var')
  matcaffe_init_KevinNet_CIFAR10_4096(use_gpu);
else
  matcaffe_init_KevinNet_CIFAR10_4096();
end

d = load('ilsvrc_2012_mean');
IMAGE_MEAN = d.image_mean;

% prepare input

num_images = length(y_ft_list_im);
y_ft_scores = zeros(dim,num_images,'single');
num_batches = ceil(length(y_ft_list_im)/batch_size)
initic=tic;
for bb = 1 : num_batches
    batchtic = tic;
    range = 1+batch_size*(bb-1):min(num_images,batch_size * bb);
    tic
    input_data = prepare_batch(y_ft_list_im(range),IMAGE_MEAN,batch_size);
    toc, tic
    fprintf('Batch %d out of %d %.2f%% Complete ETA %.2f seconds\n',...
        bb,num_batches,bb/num_batches*100,toc(initic)/bb*(num_batches-bb));
    output_data = caffe('forward', {input_data});
    toc
    output_data = squeeze(output_data{1});
    y_ft_scores(:,range) = output_data(:,mod(range-1,batch_size)+1);
    toc(batchtic)
end
toc(initic);
KevinCIFAR4096_list_im = y_ft_list_im;
KevinCIFAR4096_scores = y_ft_scores;
%if exist('filename', 'var')
%    save([filename '_KevinCIFAR4096.probs.mat'],'KevinCIFAR4096_list_im','KevinCIFAR4096_scores','-v7.3');
%end

