echo "Downloading ImageNet pre-trained model and weight"
wget -O ./models/bvlc_reference_caffenet/bvlc_reference_caffenet.caffemodel "https://www.dropbox.com/s/nlggnj47xxdmwkb/bvlc_reference_caffenet.caffemodel?dl=1"

echo "Convert CIFAR10 to leveldb"
./examples/cvprw15-cifar10/create_imagenet.sh 
