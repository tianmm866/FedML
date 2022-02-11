#!/bin/bash

#set -ex

# code checking
pyflakes .

# activate the fedml environment
source "$HOME/miniconda/etc/profile.d/conda.sh"
conda activate fedml

wandb login 8974651f1c691b45417700ea7e2c710cd265af67
wandb off

# 1. distributed base framework
cd ./fedml_experiments/distributed/base
bash run_base_distributed_pytorch.sh &
cd ./../../../

# 2. decentralized base framework
cd ./fedml_experiments/distributed/decentralized_demo
bash run_decentralized_demo_distributed_pytorch.sh &
cd ./../../../
