#!/bin/bash
for image in `sudo docker ps -a | grep -E '.*(weeks|days|months).*' | awk '{ print $1; }' `; do
echo $image
sudo docker rm $image
done

