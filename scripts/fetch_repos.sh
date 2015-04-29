#! /bin/bash

echo NOT AVAILABLE > errors.txt

while read u
do
    REPO=https://github.com/$u/lab_vision
    #test connection
    echo $REPO
    wget -q --spider $REPO
    status=$?
    if [ $status -eq 0 ]
    then
        rm -rf $u
        git clone --progress https://github.com/$u/lab_vision $u
    else
        echo Not available
        echo $u >> errors.txt
    fi
    sleep 10
done < gh_users.txt
