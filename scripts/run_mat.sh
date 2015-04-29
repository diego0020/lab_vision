#!/bin/bash

readonly matlab="/usr/local/MATLAB/R2014b/bin/matlab"
readonly ml_flags="-nodesktop -noFigureWindows -nosplash"
readonly t_limit="4h"
readonly base_dir="/home/imagine/cnn/hws"
readonly mega_log="/home/imagine/cnn/scripts/mega_log.txt"

function main(){
local folder=$1
local script=$2

cd $base_dir
cd $folder

rm -rf "textons-experiment"
rm "train_log.txt"
local command="$matlab $ml_flags -logfile train_log.txt -r $script"
echo $command
echo -e "\n\n $folder \n =========================\n$command \n\n ">> $mega_log

timeout -s1 --foreground $t_limit $command  <<< "exit"
#$command

echo -e "\n -Time is up- \n" >> train_log.txt

cat train_log.txt >> $mega_log

}

main $@
