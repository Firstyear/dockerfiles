#!/bin/bash
echo $1 $2 $3
sudo /usr/bin/docker create -i -t --privileged=true -h ldapkdc.example.com --name=$3 -v /home/wibrown/development:/home/wibrown/development -v /srv/ccache:/srv/ccache $1_wibrown_389ds-devel:$2

