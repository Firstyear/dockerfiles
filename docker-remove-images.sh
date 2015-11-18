#!/bin/bash
for image in `docker images | grep '<none>' | awk '{ print $3; }' `; do
docker rmi $image
done
