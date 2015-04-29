#!/bin/bash

readonly base_dir="/home/imagine/cnn/scripts"
readonly hws_dir="/home/imagine/cnn/hws"
function do_something(){
echo hola
echo $1
echo $2
echo 
#cd $hws_dir
#cd $1
#gedit $2.m
cd $base_dir
./run_mat.sh $1 $2
}

function main(){

while read p; do
do_something $p
done < train_funcs.txt

}

main 
