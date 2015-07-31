echo "Downloading ImageNet pre-trained model and weight"
wget -O ./models/bvlc_reference_caffenet/bvlc_reference_caffenet.caffemodel "https://www.dropbox.com/s/nlggnj47xxdmwkb/bvlc_reference_caffenet.caffemodel?dl=1"

echo "Downloading CIFAR10 Dataset"
wget -O cifar10-dataset.zip "https://www.dropbox.com/s/f7q3bbgvat2q1u2/cifar10-dataset.zip?dl=1" 
unzip cifar10-dataset.zip -d ./examples/cvprw15-cifar10/dataset

echo "Convert CIFAR10 to leveldb"
./examples/cvprw15-cifar10/create_imagenet.sh 
