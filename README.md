# caffe-cvprw15 
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

and

    Rapid Clothing Retrieval via Deep Learning of Binary Codes and Hierarchical Search
    K. Lin, H.-F. Yang, K.-H. Liu, J.-H. Hsiao, C.-S. Chen
    ACM International Conference on Multimedia Retrieval, ICMR 2015, June 2015.

 
### Prerequisites

  0. MATLAB (tested with 2012b on 64-bit Linux)
  0. Caffe's [prerequisites](http://caffe.berkeleyvision.org/installation.html#prequequisites)


### Install caffe-cvprw15

Adjust Makefile.config and simply run the following commands:

    $ make all -j8
    $ make test -j8
    $ make runtest -j8
    $ make matcaffe
    $ ./download_model.sh

### Demo

This demo generate 48-bits binary codes using our model trained on CIFAR10.
 
Launch matlab and run "demo.m"
    
    >> demo


### Contact

Please feel free to leave suggestions or comments to Kevin Lin (kevinlin311.tw@iis.sinica.edu.tw), Huei-Fang Yang (hfyang@citi.sinica.edu.tw) or Chu-Song Chen (song@iis.sinica.edu.tw)



