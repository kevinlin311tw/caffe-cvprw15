# Caffe-cvprw15 

Implementation of the Deep Learning of Binary Hash Codes

Created by Kevin Lin, Huei-Fang Yang, and Chu-Song Chen at Academia Sinica, Taipei, Taiwan.

### Introduction

We present a simple yet effective deep learning framework to create the hash-like binary codes for fast image retrieval. We add a latent-attribute layer in the deep CNN to simultaneously learn domain specific image representations and a set of hash-like functions. Our method does not rely on pairwised similarities of data and is highly scalable to the dataset size. Experimental results show that, with only a simple modification of the deep CNN, our method improves the previous best retrieval results with 1% and 30% retrieval precision on the MNIST and CIFAR-10 datasets, respectively. We further demonstrate the scalability and efficacy of the proposed approach on the large-scale dataset of 1 million shopping images.

The details can be found in the following [CVPRW 2015 paper](http://www.iis.sinica.edu.tw/~kevinlin311.tw/cvprw15.pdf)

### Citing the deep hashing works

If you find our works useful in your research, please consider citing:

    Deep Learning of Binary Hash Codes for Fast Image Retrieval
    K. Lin, H.-F. Yang, J.-H. Hsiao, C.-S. Chen
    CVPR Workshop (CVPRW) on Deep Learning in Computer Vision, DeepVision 2015, June 2015.


    Rapid Clothing Retrieval via Deep Learning of Binary Codes and Hierarchical Search
    K. Lin, H.-F. Yang, K.-H. Liu, J.-H. Hsiao, C.-S. Chen
    ACM International Conference on Multimedia Retrieval, ICMR 2015, June 2015.

 
### Prerequisites

  0. MATLAB (tested with 2012b on 64-bit Linux)
  0. Caffe's [prerequisites](http://caffe.berkeleyvision.org/installation.html#prequequisites)


### Install Caffe-cvprw15

Adjust Makefile.config and simply run the following commands:

    $ make all -j8
    $ make test -j8
    $ make runtest -j8
    $ make matcaffe
    $ ./download_model.sh

For a faster build, compile in parallel by doing "make all -j8" where 8 is the number of parallel threads for compilation (a good choice for the number of threads is the number of cores in your machine).



### Demo

This demo generates 48-bits binary codes using our model trained on CIFAR10.
 
Launch matlab and run "demo.m"
    
    >> demo



### Train your own model on CIFAR10 dataset.

First, run script "prepare.sh" to download ImageNet pretrained model and CIFAR10 dataset. This script will convert CIFAR10 to leveldb format.


    $ ./prepare.sh


Then, go to the folder "/examples/cvprw15-cifar10", and run the training script:


    $ cd /examples/cvprw15-cifar10
    $ chmod 777 train_48.sh
    $ ./train_48.sh


You will get your model named "KevinNet_CIFAR10_48_iter_xxxxxx.caffemodel"

To use your trained model, modify your model path in "/matlab/caffe/matcaffe_init_KevinNet_CIFAR10_48.m":

```
line#14  model_file = './examples/cvprw15-cifar10/YOUR_MODEL.caffemodel';

```

Launch matlab, run "demo.m" and enjoy it!
    
    >> demo




### Train your own model on another dataset.

It should be easy to train the model using another dataset as long as that dataset has label annotations. You need to convert the dataset into leveldb format using "create_imagenet.sh"  We will show you how to do this. To be continued..

 



### Contact

Please feel free to leave suggestions or comments to Kevin Lin (kevinlin311.tw@iis.sinica.edu.tw), Huei-Fang Yang (hfyang@citi.sinica.edu.tw) or Chu-Song Chen (song@iis.sinica.edu.tw)



