#!/bin/bash
echo "distro version name"
echo $1 $2 $3
sudo /usr/bin/docker create -i -t --privileged=true -h ldapkdc.example.com --name=$3 -v /home/$USER/development:/home/$USER/development -v /srv/ccache:/srv/ccache $1_389ds-devel:$2
sudo /usr/bin/docker start -i -a $3

