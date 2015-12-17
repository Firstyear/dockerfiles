#!/bin/bash
for image in `sudo docker images | grep '<none>' | awk '{ print $3; }' `; do
sudo docker rmi $image
done
