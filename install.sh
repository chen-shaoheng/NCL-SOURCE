#!/bin/bash
set -x
set -e


mkdir -p $PWD/ncl-download
cd ncl-download
wget https://github.com/chen-shaoheng/NCL-SOURCE/releases/download/ncl-6.6.2/ncl-6.6.2.tar.gz
tar -xvf ncl-6.6.2.tar.gz
cd ncl-6.6.2

#add lunix_aarch64 branch
sed -i '380a case    aarch64:' config/ymake
sed -i '381a set model   = $mach' config/ymake
sed -i '382a set arch    = $mach' config/ymake
sed -i '383a set sysincs = LINUX' config/ymake
sed -i '384a set vendor  = ARM' config/ymake
sed -i '385a breaksw' config/ymake

./Configure -v

make Everything
make all install
