# caffe-cvprw15

Implementation of the deep hashing method in the following papers:

Kevin Lin, Huei-Fang Yang, Jen-Hao Hsiao, and Chu-Song Chen, "Deep Learning of Binary Hash Codes for Fast Image Retrieval," CVPR Workshop (CVPRW) on Deep Learning in Computer Vision, DeepVision 2015, June 2015. [link](http://www.iis.sinica.edu.tw/~kevinlin311.tw/cvprw15.pdf)

Kevin Lin, Huei-Fang Yang, Kuan-Hsien Liu, Jen-Hao Hsiao and Chu-Song Chen, "Rapid Clothing Retrieval via Deep Learning of Binary Codes and Hierarchical Search," ACM International Conference on Multimedia Retrieval, ICMR 2015, June 2015.

Please cite the paper in your publications if it helps your research.

To run our code:

    make all -j8
    make test -j8
    make runtest -j8
    make matcaffe
    ./download_model.sh

Launch matlab and run 'demo.m'
This demo generate 48-bits binary codes using our model trained on CIFAR10.

Please feel free to leave suggestions or comments to Kevin Lin (kevinlin311.tw@iis.sinica.edu.tw), Huei-Fang Yang (hfyang@citi.sinica.edu.tw) or Chu-Song Chen (song@iis.sinica.edu.tw)



