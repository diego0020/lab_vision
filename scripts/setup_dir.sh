#!/bin/bash

function setup_dir(){

local target_dir=$1
readonly base_dir=/home/imagine/cnn/practical
ln -s $base_dir/* $target_dir
}

function setup_all(){
local all_dirs=$(ls -1 $1)
for d in ${all_dirs}; do
echo $1/$d
setup_dir $1/$d
done
}

function main(){
if [ $# -ne 1 ]; then
	echo Requires one argument
else
	if [ -d $1 ]; then
		setup_all $1
	else
		echo $1 is not a directory
	fi
fi



}
main $@
