#!/bin/bash
set -ex

# install pyflakes to do code error checking
echo "pip3 install pyflakes --cache-dir $HOME/.pip-cache"
pip3 install pyflakes --cache-dir $HOME/.pip-cache


# Conda Installation
#wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
# 更换国内源
wget https://repo.anaconda.com/miniconda/Miniconda3-py37_4.10.3-Linux-x86_64.sh -O miniconda.sh
# conda各种包的下载地址
bash miniconda.sh -b -p $HOME/miniconda
source "$HOME/miniconda/etc/profile.d/conda.sh"
hash -r

# 清华源
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud//pytorch/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/
conda config --set show_channel_urls yes

# 开启显示环境名称功能
conda config --set always_yes yes --set changeps1 true
conda update -q conda
conda info -a

# conda配置国内镜像源,源混乱，导致python包安装不上去
# 中科大源
#conda config --add channels https://mirrors.ustc.edu.cn/anaconda/pkgs/free/
#conda config --set show_channel_urls yes


echo "conda create -n fedml python=3.7.4"
conda create -n fedml python=3.7.4

echo "conda activate fedml"
conda activate fedml



# Install PyTorch (please visit pytorch.org to check your version according to your physical machines
# nvidia-smi会显示11.4但是pytorch显示10.2，安装的镜像版本是10.2
# pytorch已经安装成功
#conda install pytorch torchvision cudatoolkit=10.2 -c pytorch
# 去除-c pytorch 防止从官网下载
conda install pytorch torchvision cudatoolkit=10.2

# Install MPI
conda install -c anaconda mpi4py
# mpi4y可能安装不上，需要先执行apt install libopenmpi-dev，安装相应的包

# Install Wandb
pip install --upgrade wandb

# Install other required package
conda install scikit-learn
conda install numpy
conda install h5py
conda install setproctitle
conda install networkx
conda install tqdm
pip install -r requirements.txt

## install the dataset
## 1. MNIST
#cd ./data/MNIST
#sh download_and_unzip.sh
#cd ../../
#
## 2. FederatedEMNIST
#cd ./data/FederatedEMNIST
#sh download_federatedEMNIST.sh
#cd ../../
#
## 3. shakespeare
#cd ./data/shakespeare
#sh download_shakespeare.sh
#cd ../../
#
#
## 4. fed_shakespeare
#cd ./data/fed_shakespeare
#sh download_shakespeare.sh
#cd ../../
#
## 5. fed_cifar100
#cd ./data/fed_cifar100
#sh download_fedcifar100.sh
#cd ../../
#
## 6. stackoverflow
## cd ./data/stackoverflow
## sh download_stackoverflow.sh
## cd ../../
#
## 7. CIFAR10
#cd ./data/cifar10
#sh download_cifar10.sh
#cd ../../
#
## 8. CIFAR100
#cd ./data/cifar100
#sh download_cifar100.sh
#cd ../../
#
## 9. CINIC10
#cd ./data/cinic10
#sh download_cinic10.sh > cinic10_downloading_log.txt
#cd ../../
