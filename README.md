# Caffe-cvprw15 

Deep Learning of Binary Hash Codes for Fast Image Retrieval

Created by Kevin Lin, Huei-Fang Yang, and Chu-Song Chen at Academia Sinica, Taipei, Taiwan.


## Introduction

We present a simple yet effective deep learning framework to create the hash-like binary codes for fast image retrieval. We add a latent-attribute layer in the deep CNN to simultaneously learn domain specific image representations and a set of hash-like functions. Our method does not rely on pairwised similarities of data and is highly scalable to the dataset size. Experimental results show that, with only a simple modification of the deep CNN, our method improves the previous best retrieval results with 1% and 30% retrieval precision on the MNIST and CIFAR-10 datasets, respectively. We further demonstrate the scalability and efficacy of the proposed approach on the large-scale dataset of 1 million shopping images.

The details can be found in the following [CVPRW 2015 paper](http://www.iis.sinica.edu.tw/~kevinlin311.tw/cvprw15.pdf)


## Citing the deep hashing works

If you find our works useful in your research, please consider citing:

    Deep Learning of Binary Hash Codes for Fast Image Retrieval
    K. Lin, H.-F. Yang, J.-H. Hsiao, C.-S. Chen
    CVPR Workshop (CVPRW) on Deep Learning in Computer Vision, DeepVision 2015, June 2015.


    Rapid Clothing Retrieval via Deep Learning of Binary Codes and Hierarchical Search
    K. Lin, H.-F. Yang, K.-H. Liu, J.-H. Hsiao, C.-S. Chen
    ACM International Conference on Multimedia Retrieval, ICMR 2015, June 2015.


## CIFAR10 retrieval results

Performance comparison of different hashing methods on CIFAR10 dataset. The table shows the mean average precision (mAP) of top 1000 returned images with respect to different number of hash bits.


     Method     |   12 bits   |   32 bits   |   48 bits   
----------------|:-----------:|:-----------:|:-----------:
      Ours      |    89.30    |    89.72    |    89.73    
      CNNH+     |    46.50    |    52.10    |    53.20    
      CNNH      |    43.90    |    50.90    |    52.20    
      KSH       |    30.30    |    34.60    |    35.60    
     ITQ-CCA    |    26.40    |    28.80    |    29.50   
      LSH       |    12.10    |    12.00    |    12.00   


## Prerequisites

  0. MATLAB (tested with 2012b on 64-bit Linux)
  0. Caffe's [prerequisites](http://caffe.berkeleyvision.org/installation.html#prequequisites)


## Install Caffe-cvprw15

Adjust Makefile.config and simply run the following commands:

    $ make all -j8
    $ make test -j8
    $ make runtest -j8
    $ make matcaffe
    $ ./download_model.sh

For a faster build, compile in parallel by doing `make all -j8` where 8 is the number of parallel threads for compilation (a good choice for the number of threads is the number of cores in your machine).


## Demo

This demo generates 48-bits binary codes using our model trained on CIFAR10.
 
Launch matlab and run `demo.m`
    
    >> demo

## Retrieval evaluation on CIFAR10

First, run script `prepare_eval.sh` to download and setup CIFAR10 dataset. 

    $ ./prepare_eval.sh


Second, launch matalb and run `run_cifar10.m` to perform the evaluation of `precision at k` and `mean average precision at k`. We set `k=1000` in the experiments. The bit length of binary codes is `48`. This process takes around 12 minutes.
    
    >> run_cifar10


Then, you will get the `mAP` result as follows. 

    >> MAP = 0.897373

Moreover, simply run the following commands to generate the `precision at k` curves:

    $ cd analysis
    $ gnuplot plot-p-at-k.gnuplot 

You will reproduce the precision curves with respect to different number of top retrieved samples when the 48-bit hash codes are
used in the evaluation:

<img src="https://www.csie.ntu.edu.tw/~r01944012/cvprw15-cifar10.png" width="500">
 


## Train your own model on CIFAR10

First, run script `prepare_train.sh` to download ImageNet pretrained model and convert CIFAR10 dataset to leveldb format. The whole process takes around 5 minutes.


    $ ./prepare_train.sh


Then, go to the folder `/examples/cvprw15-cifar10`, and run the training script:


    $ cd /examples/cvprw15-cifar10
    $ chmod 777 train_48.sh
    $ ./train_48.sh


The training process takes roughly 5~6 hours on a desktop with GTX Titian Black GPU.
You will finally get your model named `KevinNet_CIFAR10_48_iter_xxxxxx.caffemodel`

To use your model, modify the `model_file` in `demo.m` to link to your model:

```
    model_file = './YOUR/MODEL/PATH/filename.caffemodel';
```

Launch matlab, run `demo.m` and enjoy!
    
    >> demo


## Train your own model on another dataset

It should be easy to train the model using another dataset as long as that dataset has label annotations. You need to convert the dataset into leveldb format using "create_imagenet.sh".  We will show you how to do this. To be continued.

 
## Correction of computational cost

In previous experiments, we use mex-file to call C/C++ functions from MATLAB, which slows down the process. We improve the search with pure C/C++ implementation as shown below.


     Descriptor     |       Measure       | Computational cost
------------------- |:-------------------:|:-------------------:
CNN-fc7-4096        | Euclidean distance  |       22.6 μs
BinaryHashCodes-64  | Hamming distance    |       23.0 ps


Performing the Euclidean distance measure between two 4096-dimensional vectors takes 22.6 μs.
Computing hamming distance between two 64-bit binary codes takes 23 ps (bitwise XOR operation).
Thus, the proposed method is around ~982,600x faster than traditional exhaustive search with 4096-dimensional features.



## Frequently asked questions

Please refer this [FAQs](http://www.iis.sinica.edu.tw/~kevinlin311.tw/deephash_questions.txt)


## Contact

Please feel free to leave suggestions or comments to Kevin Lin (kevinlin311.tw@iis.sinica.edu.tw), Huei-Fang Yang (hfyang@citi.sinica.edu.tw) or Chu-Song Chen (song@iis.sinica.edu.tw)



