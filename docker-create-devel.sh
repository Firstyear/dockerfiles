#!/bin/bash
# echo "distro version"
# echo $1 $2
sudo /usr/bin/docker create -i -t --privileged=true -h ldapkdc.example.com -v /home/$USER/development:/home/$USER/development opensuse_devel:latest
# sudo /usr/bin/docker create -i -t --privileged=true -h ldapkdc.example.com -v /home/$USER/development:/home/$USER/development $1_devel:$2

