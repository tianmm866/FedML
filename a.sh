#!/bin/bash
cd ./fedml_experiments/standalone/fedavg
bash run_fedavg_standalone_pytorch.sh 0 2 2 4 mnist ./../../../data/mnist lr hetero 1 1 0.03 sgd 1
