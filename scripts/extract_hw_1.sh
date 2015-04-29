#! /bin/bash

rm -rf homework_1
mkdir homework_1
hws=$(find . -wholename "*/lab0_intro/questions.md")
for hw in ${hws[*]}
do
name=${hw:2}
slash_i=$(( `expr index "$name" /` - 1 ))
name=${name:0:$slash_i}
echo $name
cp $hw homework_1/$name.md
done
